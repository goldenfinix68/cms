<?php

namespace App\Http\Controllers;

use App\ComponentArchive;
use App\Computer;
use App\Computercateg;
use App\ComputercategArchive;
use App\ComputerCategory;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ComputercategsController extends Controller
{
    public function create()
    {
        return view('computercategs.create');
    }

    private function storeArchive($data)
    {
        return ComputercategArchive::forceCreate($data);
    }

    private function updateArchive($id, $data)
    {
        $computercateg = ComputercategArchive::findOrFail($id);

        return $computercateg->update($data);

    }

    public function archive()
    {
        $archives =  ComputercategArchive::where('active', true)->get();
        return view('computercateg.archive', compact('archives'));
    }

    public function store()
    {

        $validated = request()->validate([
            'category_name' => 'required|string|min:3|max:100',
        ]);
        $validated['id'] = Carbon::now()->format('YmdHis');
        Computercateg::forceCreate($validated);
        self::storeArchive($validated);

        return redirect('/computercategs')->with('computercateg_created','Success');

    }

    public function index()
    {
        $computercategs = Computercateg::all();
        return view('computercategs.index',compact('computercategs'));
    }

    public function view(Computercateg $computercateg)
    {
        return view('computercategs.view', compact('computercateg'));
    }

    public function edit(Computercateg $computercateg)
    {

        return view('computercategs.edit', compact('computercateg'));
    }

    public function update(Computercateg $computercateg)
    {
        //dd(request()->all());
        $validated = request()->validate([
            'category_name' => 'required',

        ]);
        $computercateg->update($validated);
        self::updateArchive($computercateg->id, $validated);

        return redirect('/computercategs')->with('computercateg_updated','Success');
    }
    public function destroy(Computercateg $computercateg)
    {
        $computercateg->delete();
        return back()->with('computercateg_deleted','Success');
    }
}
