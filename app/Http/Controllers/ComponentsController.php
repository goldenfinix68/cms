<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use App\Room;
use App\Component;
use App\ComponentArchive;
use App\ComponentTransaction;

class ComponentsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $components = Component::all();
        return view('components.index', compact('components'));
    }

    private function storeTransaction($data, $action)
    {
        $data['id'] = Carbon::now()->format('YmdHis');
        $data['action'] = $action;
        return ComponentTransaction::forceCreate($data);
    }

    private function storeArchive($data)
    {
        return ComponentArchive::forceCreate($data);
    }

    private function updateTransaction($data)
    {
        $data['id'] = Carbon::now()->format('YmdHis');
        $data['action'] = "UPDATE";
        return ComponentTransaction::forceCreate($data);
    }

    private function updateArchive($id, $data)
    {
        $component = ComponentArchive::findOrFail($id);

        return $component->update($data);

    }


    public function create()
    {
        $rooms = Room::all();
        return view('components.create', compact('rooms'));
    }

    public function edit(Component $component)
    {
        $rooms = Room::all();
        return view('components.edit', compact('component', 'rooms'));
    }

    public function update(Component $component)
    {
        // dd(request()->all());

        $validated = request()->validate([
            'name' => 'required|string|min:3|max:100',
            'description' => 'required|string|max:255',
            'model_number' => 'required|string|min:3|max:50',
            'image' => 'sometimes|mimes:jpg,jpeg,png|max:10000',
            'room' => 'required',
            'status' => 'required'
        ]);

        if(!request('category') && request('others')){
            $validated['category'] = request('others');
        } else if(request('category')){
            $validated['category'] = request('category');
        }
        else {
            $error = \Illuminate\Validation\ValidationException::withMessages([
                'category' => 'The category field is required',
            ]);
            throw $error;
        }

        $picture = false;

        if(request()->hasfile('image')) {
            $file = request()->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = Carbon::now()->format('YmdHis') . '.' . $extension;
            $file->move('uploads/components/', $filename);

            $validated['image'] = $filename;
            $picture = true;
        }

        $validated['room_id'] = $validated['room'];
        unset($validated['room']);

        $component->update($validated);

        $validated['user_id'] = $component->user_id;
        $validated['submitted_by'] = $component->submitted_by;
        if(!$picture){
            $validated['image'] = $component->image;
        }

        self::updateArchive($component->id, $validated);
        self::updateTransaction($validated);

        return redirect('/components')->with('component_updated','Success');


    }

    public function transactions()
    {
        $transactions = ComponentTransaction::all();
        return view('components.transactions', compact('transactions'));
    }

    public function archive()
    {
        $archives = ComponentArchive::where('active', true)->get();
        return view('components.archive', compact('archives'));
    }

    public function report(Component $component)
    {
        return view('components.report', compact('component'));
    }

    public function borrow(Component $component)
    {

        return view('components.borrow', compact('component'));
    }

    public function generateQR()
    {
        $id = request('id');

        echo "<img src='https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=$id,1' height=250 width=250/>";
    }
    

    public function store()
    {
        $validated = request()->validate([
            'name' => 'required|string|min:3|max:100',
            'description' => 'required|string|min:5|max:255',
            'model_number' => 'required|string|min:3|max:50',
            'image' => 'sometimes|mimes:jpg,jpeg,png|max:10000',
            'room' => 'required',
            'status' => 'required'
        ]);

        if(!request('category') && request('others')){
            $validated['category'] = request('others');
        } else if(request('category')){
            $validated['category'] = request('category');
        }
        else {
            $error = \Illuminate\Validation\ValidationException::withMessages([
                'category' => 'The category field is required',
            ]);
            throw $error;
        }

        if(request()->hasfile('image')) {
            $file = request()->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = Carbon::now()->format('YmdHis') . '.' . $extension;
            $file->move('uploads/components/', $filename);

            $validated['image'] = $filename;
        }

        $validated['room_id'] = $validated['room'];
        unset($validated['room']);
        $validated['submitted_by'] = Auth::user()->name;
        $validated['id'] = Carbon::now()->format('YmdHis');
        $validated['user_id'] = Auth::user()->id;


        Component::forceCreate($validated);
        self::storeArchive($validated);
        self::storeTransaction($validated, 'STORE');


        return redirect('/components')->with('component_created','Success');
    }

    public function destroy(Component $component)
    {

        $archive = ComponentArchive::findOrFail($component->id);

        $archive->update([ 'active' => true ]);

        $component->delete();

        $component = [
            'id' => $archive->id,
            'user_id' => $archive->user_id,
            'room_id' => $archive->room_id,
            'name' => $archive->name,
            'description' => $archive->description,
            'category' => $archive->category,
            'model_number' => $archive->model_number,
            'status' => $archive->status,
            'submitted_by' => $archive->submitted_by,
            'image' => $archive->image,
        ];

        self::storeTransaction($component, "DELETE");

        return back()->with('component_deleted','Success');
    }

    public function restore(ComponentArchive $archive)
    {

        $archive->update(['active' => false]);

        $component = [
            'id' => $archive->id,
            'user_id' => $archive->user_id,
            'room_id' => $archive->room_id,
            'name' => $archive->name,
            'description' => $archive->description,
            'category' => $archive->category,
            'model_number' => $archive->model_number,
            'status' => $archive->status,
            'submitted_by' => $archive->submitted_by,
            'image' => $archive->image,
        ];

        Component::forceCreate($component);
        self::storeTransaction($component, "RESTORE");

        return redirect('/components')->with('component_restored','Success');
    }




}
