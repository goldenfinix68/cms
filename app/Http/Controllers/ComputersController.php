<?php

namespace App\Http\Controllers;


use App\ComputerTrasaction;
use App\RoomArchive;
use Illuminate\Http\Request;
use App\ComputerArchive;
use App\Computer;
use App\Room;
use App\ComputerpartArchive;
use Carbon\Carbon;
use App\Computerpart;

class ComputersController extends Controller
{
    public function index()
    {
        $computers = Computer::all();

        return view('computers.index',compact('computers'));
    }
    private function storeArchive($data)
    {
        return ComputerArchive::forceCreate($data);
    }

    private function storeTransaction($data, $action)
    {
        $data['id'] = Carbon::now()->format('YmdHis');
        $data['action'] = $action;
        return ComputerTrasaction::forceCreate($data);
    }

    private function updateTransaction($data)
    {
        $data['id'] = Carbon::now()->format('YmdHis');
        $data['action'] = "UPDATE";
        return ComputerTrasaction::forceCreate($data);
    }
    public function store()
    {

        $validated = request()->validate([
            'computer_number' => 'required|string|max:100',
            'room' => 'required'



        ]);
        $existRec = \DB::table('computers')->where('room_id',$validated['room'])->where('computer_number',$validated['computer_number'])->get();
        if(count($existRec)>0)
        {
            return redirect('/computers')->with('existPcErr','Success');
        }
        else
        {
            $validated['room_id'] = $validated['room'];
            unset($validated['room']);
            $validated['id'] = Carbon::now()->format('YmdHis');
            $validated['serial_number'] = random_int(100000, 999999);
            Computer::forceCreate($validated);
            self::storeArchive($validated);
            self::storeTransaction($validated, 'STORE');
            return redirect('/computers')->with('computer_created','Success');
        }

    }
    public function create()
    {

        $rooms = Room::all();
        return view('computers.create', compact('rooms'));
    }
    private function updateArchive($id, $data)
    {
        $computer = ComputerArchive::findOrFail($id);

        return $computer->update($data);

    }


    public function view(Computer $computer)
    {

        return view('computers.view', compact('computer'));
    }
    public function edit(Computer $computer)
    {
        $rooms = Room::all();
        return view('computers.edit', compact('computer','rooms'));
    }
    public function update(Computer $computer)
    {
        //dd(request()->all());
        $validated = request()->validate([
            'computer_number' => 'required',
            'room' => 'required',
        ]);
        if(request('status')) {
            $validated['status'] = true;
        } else {
            $validated['status'] = false;
        }
        $existRec = \DB::table('computers')->where('room_id',$validated['room'])->where('computer_number',$validated['computer_number'])->get();
        if(count($existRec)>0)
        {
            return redirect('/computers')->with('existPcErr','Success');
        }
        else {
            $validated['room_id'] = $validated['room'];
            unset($validated['room']);
            $computer->update($validated);
            self::updateArchive($$computer->id, $validated);
            self::updateTransaction($validated);
            return redirect('/computers')->with('computer_updated', 'Success');
        }
    }

    public function destroy(Computer $computer)
    {
        $archive = ComputerArchive::findOrFail($computer->id);

        $archive->update([ 'active' => true ]);
        $archive->update([ 'status' => 'Archived' ]);
        $computerParts = Computerpart::where('computer_id',$computer->id)->get();
        $text = [];
        if(!empty($computerParts)){
            foreach($computerParts as $part){
                $text[] = ['id'=>$part->id,'brand'=>$part->brand,'model_number'=>$part->model_number];
                $part->delete();
            }
        }
        $computerPartsArchive = ComputerpartArchive::where('computer_id',$computer->id)->get();
        if(!empty($computerPartsArchive)){
            foreach($computerPartsArchive as $archivepart){
                $archivepart->update(['active'=> true]);
                $archive->update([ 'status' => 'Archived' ]);
            }
        }
        $archive->update([ 'computer_specification' => json_encode($text) ]);
        $computer->delete();

        $computer = [
            'id' => $archive->id,
            'computer_number' => $archive->computer_number,
            'room_id' => $archive->room_id,
            'status' => $archive->status,
        ];
        self::storeTransaction($computer, "DELETE");
        return back()->with('computer_deleted','Success');
    }
    public function restore(ComputerArchive $archive)
    {

        $archive->update(['active' => false]);
        $archive->update(['status' => 'Inactive']);

        $computer = [
            'id' => $archive->id,
            'computer_number' => $archive->computer_number,
            'room_id' => $archive->room_id,
            'serial_number' =>$archive->serial_number
        ];

        Computer::forceCreate($computer);

        return redirect('/computers')->with('computer_restored','Success');
    }
    public function archive()
    {
        $archives = ComputerArchive::where('active', true)->get();
        return view('computers.archive', compact('archives'));
    }
}
