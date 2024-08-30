<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;
use App\Notifications\BorrowComponent;
use App\Notifications\BorrowRequest;
use App\Notifications\NotifyBorrower;
use App\Notifications\OverdueBorrower;
use Carbon\Carbon;
use App\Component;
use App\Borrow;
use App\User;

class BorrowController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function store(Component $component)
    {
        $validated = request()->validate([
            'borrow_date' => 'required|date|after_or_equal:today',
            'return_date' => 'required|date|after_or_equal:borrow_date',
            'reason' => 'required|string|min:5|max:255'
        ]);

        $validated['id'] = Carbon::now()->format('YmdHis');
        $validated['user_id'] = Auth::user()->id;
        $validated['component_archive_id'] = $component->id;
        $validated['borrower_name'] = Auth::user()->name;
        $validated['borrower_type'] = Auth::user()->account_type;
        $validated['status'] = 'PENDING';


        $component->update([ 'status' => 'BORROWED']);

        $users = User::where('account_type','admin')->get();

        Notification::send($users, new BorrowComponent($component, Auth::user()->name));

        Borrow::forceCreate($validated);

        return redirect('/components')->with('component_borrowed', 'Success');
    }

    public function logs()
    {
        if(Auth::user()->account_type == 'admin' || Auth::user()->account_type == 'working student'){
            $logs = Borrow::all();
        } else {
            $logs = Borrow::where('user_id', Auth::user()->id)->get();
        }

        return view('borrows.index', compact('logs'));
    }

    public function edit(Borrow $borrow)
    {
        return view('borrows.edit', compact('borrow'));
    }
    public function return(Borrow $borrow)
    {
        return view('borrows.return', compact('borrow'));
    }


    public function update(Borrow $borrow)
    {

        $validated = request()->validate([
            'borrow_date' => 'required|date|after_or_equal:today',
            'return_date' => 'required|date|after_or_equal:borrow_date',
            'reason' => 'required|string|min:5|max:255',
            'status' => 'sometimes|string',
        ]);

        $user = User::findOrFail($borrow->user_id);
        if(request('status') == 'APPROVED'){
            Notification::send($user, new BorrowRequest($borrow->component, true));
        } else if(request('status') == 'DENIED') {
            Notification::send($user, new BorrowRequest($borrow->component, false));
        }

        $borrow->update($validated);

        return redirect('/borrowlogs')->with('borrow_updated', 'Success');
    }

    public function returnupdate(Borrow $borrow)
    {
        $borrow->update([ 'status' => 'RETURNED']);

        if($borrow->return_date >= Carbon::today()){
            $borrow->update(['returnstatus' => 'On Time']);
        } else {
            $borrow->update(['returnstatus' => 'Overdue']);
        }

        $validated = request()->validate([
            'returncondition' => 'required',
        ]);


        $borrow->update($validated);

        return redirect('/borrowlogs')->with('borrow_updated', 'Success');
    }

    public function notify()
    {
        $borrows = Borrow::whereBetween('return_date', [Carbon::today(),Carbon::today()->addDays(3)])
            ->where('status', 'APPROVED')->get();

        $overdue = Borrow::whereDate('return_date', '<', Carbon::today())
            ->where('status', 'APPROVED')->get();

        if($borrows->count()){
            foreach($borrows as $borrow){
                $borrow->user->notify(new NotifyBorrower($borrow));
            }
        }

        if($overdue->count()){
            foreach($overdue as $borrow){
                $borrow->user->notify(new OverdueBorrower($borrow));
            }
        }



        return back()->with('borrowers_notified', 'Success');
    }
}
