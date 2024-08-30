<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use PDF;
use Carbon\Carbon;
use App\Component;
use App\Borrow;
use App\Report;
use App\User;

class ExportsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function component()
    {

        $validated = request()->validate([
            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date'
        ]);

        $materials = Component::whereBetween('created_at', [Carbon::parse($validated['start_date']),Carbon::parse($validated['end_date'])])->get();

        if($materials->count()){
            $materials->reverse();

            $user = Auth::user();
            $date = Carbon::today()->format('F d Y');
            $from = Carbon::parse($validated['start_date'])->format('F d Y');
            $to = Carbon::parse($validated['end_date'])->format('F d Y');

            $pdf = PDF::loadView('exports.components', compact('materials','user','date', 'from', 'to'));

            return $pdf->download('Components List '. Carbon::now()->format('Ymd') .'.pdf');
        } else {
            return back()->with('no_components','Success');
        }

    }

    public function borrows()
    {
        $validated = request()->validate([
            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date'
        ]);

        $borrows = Borrow::whereBetween('created_at', [Carbon::parse($validated['start_date']),Carbon::parse($validated['end_date'])])->get();

        if($borrows->count()){
            $borrows->reverse();

            $user = Auth::user();
            $date = Carbon::today()->format('F d Y');
            $from = Carbon::parse($validated['start_date'])->format('F d Y');
            $to = Carbon::parse($validated['end_date'])->format('F d Y');

            $pdf = PDF::loadView('exports.borrow', compact('borrows','user','date', 'from', 'to'));

            return $pdf->download('Borrow Logs '. Carbon::now()->format('Ymd') .'.pdf');
        } else {
            return back()->with('no_borrows','Success');
        }
    }

    public function report()
    {
        $validated = request()->validate([
            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date'
        ]);

        $reports = Report::where('type', true)->whereBetween('created_at', [Carbon::parse($validated['start_date']),Carbon::parse($validated['end_date'])])->get();

        if($reports->count()){

            $reports->reverse();

            $user = Auth::user();
            $date = Carbon::today()->format('F d Y');
            $from = Carbon::parse($validated['start_date'])->format('F d Y');
            $to = Carbon::parse($validated['end_date'])->format('F d Y');

            $pdf = PDF::loadView('exports.reports', compact('reports','user','date', 'from', 'to'));

            return $pdf->download('Reports '. Carbon::now()->format('Ymd') .'.pdf');

        } else {
            return back()->with('no_reports','Success');
        }
    }

    public function user()
    {
        $validated = request()->validate([
            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date'
        ]);

        $users = User::whereBetween('created_at', [Carbon::parse($validated['start_date']),Carbon::parse($validated['end_date'])])->get();

        if($users->count()){

            $users->reverse();

            $user = Auth::user();
            $date = Carbon::today()->format('F d Y');
            $from = Carbon::parse($validated['start_date'])->format('F d Y');
            $to = Carbon::parse($validated['end_date'])->format('F d Y');

            $pdf = PDF::loadView('exports.users', compact('users','user','date', 'from', 'to' ));

            return $pdf->download('Users '. Carbon::now()->format('Ymd') .'.pdf');

        } else {
            return back()->with('no_users','Success');
        }
    }
    public function computerpartsreports()
    {
        $validated = request()->validate([
            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date'
        ]);

        $reports = Report::where('type', false)->whereBetween('created_at', [Carbon::parse($validated['start_date']),Carbon::parse($validated['end_date'])])->get();

        if($reports->count()){

            $reports->reverse();

            $user = Auth::user();
            $date = Carbon::today()->format('F d Y');
            $from = Carbon::parse($validated['start_date'])->format('F d Y');
            $to = Carbon::parse($validated['end_date'])->format('F d Y');

            $pdf = PDF::loadView('exports.computerpartsreports', compact('reports','user','date', 'from', 'to'));

            return $pdf->download('Reports '. Carbon::now()->format('Ymd') .'.pdf');

        } else {
            return back()->with('no_reports','Success');
        }
    }

}
