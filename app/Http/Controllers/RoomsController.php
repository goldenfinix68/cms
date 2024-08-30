<?php

namespace App\Http\Controllers;

use App\RoomArchive;
use Illuminate\Http\Request;
use App\Http\Middleware\CheckAccountType;
use Carbon\Carbon;
use App\Room;
use App\Component;
use App\Computer;

class RoomsController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth']);
    }

    private function storeArchive($data)
    {
        return RoomArchive::forceCreate($data);
    }

    public function index()
    {
        $rooms = Room::all();
        return view('rooms.index',compact('rooms'));
    }

    public function create()
    {
        return view('rooms.create');
    }

    public function store()
    {

        $validated = request()->validate([
            'name' => 'required|string|min:3|max:100',
            'description' => 'required|string|min:5|max:255',
            'type' => 'required|string',
        ]);
        $validated['id'] = Carbon::now()->format('YmdHis');
        Room::forceCreate($validated);
        self::storeArchive($validated);
        return redirect('/rooms')->with('room_created','Success');

    }
    private function updateArchive($id, $data)
    {
        $room = RoomArchive::findOrFail($id);

        return $room->update($data);

    }

    public function view(Room $room)
    {
        return view('rooms.view', compact('room'));
    }

    public function pc(Room $room)
    {
        return view('rooms.pc', compact('room'));
    }

    public function edit(Room $room)
    {
        return view('rooms.edit', compact('room'));
    }

    public function update(Room $room)
    {
        //dd(request()->all());
        $validated = request()->validate([
            'name' => 'required|min:3',
            'description' => 'required|min:5',
            'type' => 'required|min:3'


        ]);

        $room->update($validated);
        self::updateArchive($room->id, $validated);
        return redirect('/rooms')->with('room_updated','Success');
    }
}
