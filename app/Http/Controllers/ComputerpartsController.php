<?php

namespace App\Http\Controllers;

use App\Computer;
use App\Computercateg;
use App\ComputerCategory;
use App\Computerpart;
use App\ComputerpartTransaction;
use App\Room;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\ComputerpartArchive;
use Illuminate\Support\Facades\Auth;

class ComputerpartsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $computerparts = Computerpart::all();
        return view('computerparts.index',compact('computerparts'));
    }

    private function storeTransaction($data, $action)
    {
        $data['id'] = Carbon::now()->format('YmdHis');
        $data['action'] = $action;
        return ComputerpartTransaction::forceCreate($data);
    }
    private function storeArchive($data)
    {
        return ComputerpartArchive::forceCreate($data);
    }

    private function updateTransaction($data)
    {
        $data['id'] = Carbon::now()->format('YmdHis');
        $data['action'] = "UPDATE";
        return ComputerpartTransaction::forceCreate($data);
    }
    private function updateArchive($id, $data)
    {
        $computerparts = ComputerpartArchive::findOrFail($id);

        return $computerparts->update($data);

    }

    public function create()
    {

        $rooms = Room::all();
        $computers = Computer::all();
        $computercategs = Computercateg::all();
        return view('computerparts.create' ,compact('rooms','computers','computercategs'));
    }

    public function store()
    {

        $validated = request()->validate([
            'brand' => 'required|string|min:3|max:100',
            'model_number' => 'required|string|max:255',
            'image' => 'sometimes|mimes:jpg,jpeg,png|max:10000',
            'room_id' => 'required|unique:computerparts,model_number',
            'computer_id'=>'required',
            'computercateg_id' =>'required',
            'status' => 'required'
        ]);


        if(request()->hasfile('image')) {
            $file = request()->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = Carbon::now()->format('YmdHis') . '.' . $extension;
            $file->move('uploads/components/', $filename);

            $validated['image'] = $filename;
        }

        $computer = Computer::find(request()->computer_id);
        $validated['submitted_by'] = Auth::user()->name;
        $validated['id'] = Carbon::now()->format('YmdHis');
        $part = Computerpart::forceCreate($validated);
        if(!empty($computer)){
            $part->computer_serialnumber = $computer->serial_number;
            $part->save();

        }
        self::storeArchive($validated);
        self::storeTransaction($validated, 'STORE');

        return redirect('/computerparts')->with('computerparts_created','Success');

    }
    public function generateQR()
    {
        $id = request('id');

        echo "<img src=' https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=$id,0' height=250 width=250/>";
    }

    public function edit(Computerpart $computerparts)
    {
        $rooms = Room::all();
        $computers = Computer::all();
        $computercategs = Computercateg::all();
        return view('computerparts.edit' ,compact('computerparts','rooms','computers','computercategs'));
    }
    public function update(Computerpart $computerparts)
    {
        // dd(request()->all());

        $validated = request()->validate([
            'brand' => 'required|string|min:3|max:100',
            'model_number' => 'required|string|max:255',
            'image' => 'sometimes|mimes:jpg,jpeg,png|max:10000',
            'room_id' => 'required',
            'computer_id'=> 'required',
            'computercateg_id'=>'required',
            'status' => 'required'
        ]);

        $picture = false;

        if(request()->hasfile('image')) {
            $file = request()->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = Carbon::now()->format('YmdHis') . '.' . $extension;
            $file->move('uploads/components/', $filename);

            $validated['image'] = $filename;
            $picture = true;
        }
        $validated['submitted_by'] = $computerparts->submitted_by;
        $computerparts->update($validated);

        if(!$picture){
            $validated['image'] = $computerparts->image;
        }
        self::updateArchive($computerparts->id, $validated);
        self::updateTransaction($validated);
        return redirect('/computerparts')->with('computerparts_updated','Success');


    }
    public function transactions()
    {
        $transactions = ComputerpartTransaction::all();
        return view('computerparts.transactions', compact('transactions'));
    }
    public function archive()
    {
        $archives = ComputerpartArchive::where('active', true)->get();
        return view('computerparts.archive', compact('archives'));
    }

    public function destroy(Computerpart $computerpart)
    {

        $archive = ComputerpartArchive::findOrFail($computerpart->id);

        $archive->update([ 'active' => true ]);
        $archive->update([ 'status' => 'Archived' ]);

        $computerpart->delete();

        $computerpart = [
            'id' => $archive->id,
            'room_id' => $archive->room_id,
            'brand' => $archive->brand,
            'computer_id' => $archive->computer_id,
            'computercateg_id' => $archive->computercateg_id,
            'model_number' => $archive->model_number,
            'status' => $archive->status,
            'submitted_by' => $archive->submitted_by,
            'image' => $archive->image,
        ];

        self::storeTransaction($computerpart, "DELETE");

        return back()->with('computerparts_deleted','Success');
    }

    public function restore(ComputerpartArchive $archive)
    {

        $archive->update(['active' => false]);
        $archive->update(['status' => 'Inactive']);

        $computerpart = [
            'id' => $archive->id,
            'room_id' => $archive->room_id,
            'brand' => $archive->brand,
            'computer_id' => $archive->computer_id,
            'computercateg_id' => $archive->computercateg_id,
            'model_number' => $archive->model_number,
            'status' => $archive->status,
            'submitted_by' => $archive->submitted_by,
            'image' => $archive->image,
        ];

        Computerpart::forceCreate($computerpart);
        self::storeTransaction($computerpart, "RESTORE");

        return redirect('/computerparts')->with('computerparts_restored','Success');
    }

    public function findComputerName(Request $request)
    {

        $data= Computer::select('computer_number','id')->where('room_id',$request->id)->take(100)->get();
        return response()->json($data);//then sent this data to ajax success
    }
    public function report(Computerpart $computerpart)
    {
        return view('computerparts.report', compact('computerpart'));
    }

    public function notTakenCategories($roomId,$pcId)
    {
        $computercategs = Computercateg::all();
        $takenCat = \DB::table('computerparts')->where('room_id',$roomId)->where('computer_id',$pcId)->get();
        return view('computerparts.dropdown_response' ,compact('computercategs','roomId','pcId'));
    }

}
