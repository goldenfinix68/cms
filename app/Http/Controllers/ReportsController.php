<?php

namespace App\Http\Controllers;

use App\Computerpart;
use App\Notifications\SubmitComputerPartReport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;
use App\Notifications\SubmitReport;
use Carbon\Carbon;
use App\User;
use App\Component;
use App\Report;
use App\ReportTransaction;
use App\ReportArchive;

class ReportsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $reports = Report::where('type', true)->get();
        return view('reports.index', compact('reports'));
    }
    public function indexes()
    {
        $reports = Report::where('type', false)->get();
        return view('computerpartsreports.index', compact('reports'));
    }

    public function view(Report $report)
    {
        return view('reports.view', compact('report'));
    }
    public function viewing(Report $report)
    {
        return view('computerpartsreports.view', compact('report'));
    }

    public function edit(Report $report)
    {
        return view('reports.edit', compact('report'));
    }
    public function fix(Report $report)
    {
        return view('reports.fix', compact('report'));
    }


    public function editing(Report $report)
    {
        return view('computerpartsreports.edit', compact('report'));
    }

    public function fixing(Report $report)
    {
        return view('computerpartsreports.fix', compact('report'));
    }

    public function update(Report $report)
    {
        $validated = request()->validate([
            'issue' => 'required|min:5|max:255|string'
        ]);

        $report->update($validated);
        $reportArchive = ReportArchive::findOrFail($report->id);
        $reportArchive->update($validated);

        $validated['component_id'] = $report->componentArchive->id;
        $validated['user_id'] = Auth::user()->id;
        $validated['report_id'] = $report->id;
        $validated['fix'] = $report->fix;
        $validated['submitted_by'] = Auth::user()->name;
        self::storeTransaction($validated, 'UPDATE');

        return redirect('/reports')->with('report_updated','Success');
    }
    public function fixupdate(Report $report)
    {
        $validated = request()->validate([
            'fix' => 'required|min:5|max:255|string'
        ]);

        $report->update($validated);
        $reportArchive = ReportArchive::findOrFail($report->id);
        $reportArchive->update($validated);

        $validated['component_id'] = $report->componentArchive->id;
        $validated['user_id'] = Auth::user()->id;
        $validated['report_id'] = $report->id;
        $validated['submitted_by'] = Auth::user()->name;
        $validated['issue'] = $report->issue;
        self::storeTransaction($validated, 'UPDATE');

        return redirect('/reports')->with('report_updated','Success');
    }

    public function updating(Report $report)
    {
        $validated = request()->validate([
            'issue' => 'required|min:5|max:255|string'
        ]);

        $report->update($validated);
        $reportArchive = ReportArchive::findOrFail($report->id);
        $reportArchive->update($validated);

        $validated['component_id'] = $report->computerpartArchive->id;
        $validated['user_id'] = Auth::user()->id;
        $validated['report_id'] = $report->id;
        $validated['fix'] = $report->fix;
        $validated['submitted_by'] = Auth::user()->name;
        self::storeTransaction($validated, 'UPDATE');

        return redirect('/computerpartsreports')->with('report_updated','Success');
    }
    public function fixupdating(Report $report)
    {
        $validated = request()->validate([
            'fix' => 'required|min:5|max:255|string'
        ]);

        $report->update($validated);
        $reportArchive = ReportArchive::findOrFail($report->id);
        $reportArchive->update($validated);

        $validated['component_id'] = $report->computerpartArchive->id;
        $validated['user_id'] = Auth::user()->id;
        $validated['report_id'] = $report->id;
        $validated['issue'] = $report->issue;
        $validated['submitted_by'] = Auth::user()->name;
        self::storeTransaction($validated, 'UPDATE');

        return redirect('/computerpartsreports')->with('report_updated','Success');
    }

    public function transactions()
    {
        $transactions = ReportTransaction::where('type', true)->get();
        return view('reports.transactions', compact('transactions'));
    }

    public function transact()
    {
        $transactions = ReportTransaction::where('type', false)->get();
        return view('computerpartsreports.transactions', compact('transactions'));
    }

    public function archives()
    {
        $archives = ReportArchive::where([
            ['active', true],
            ['type', true]
        ])
            ->get();
        return view('reports.archive', compact('archives'));
    }

    public function arch()
    {
        $archives = ReportArchive::where([
            ['active', true],
            ['type', false]
        ])
            ->get();
        return view('computerpartsreports.archive', compact('archives'));
    }


    private function storeTransaction($data, $action)
    {
        $data['id'] = Carbon::now()->format('YmdHis');
        $data['action'] = $action;
        return ReportTransaction::forceCreate($data);
    }

    public function store(Component $component)
    {
        $component->update([ 'status' => 'UNAVAILABLE' ]);
        $validate = request()->validate([
            'issue' => 'required|min:3|max:255',
        ]);
        $validate['id'] = Carbon::now()->format('YmdHis');
        $validate['component_id'] = $component->id;
        $validate['type'] = true;
        $validate['fix'] = 'Not Yet Fixed';
        $validate['user_id'] = Auth::user()->id;
        $validate['submitted_by'] = Auth::user()->name;

        Report::forceCreate($validate);
        ReportArchive::forceCreate($validate);

        $validate['report_id'] = $validate['id'];
        self::storeTransaction($validate, 'STORE');

        $user = User::where('account_type', 'admin')->orWhere('account_type', 'working student')->get();
        Notification::send($user, new SubmitReport($component, $validate['submitted_by']));

        return redirect('/reports')->with('report_created',' Success');
    }

    public function stores(Computerpart $computerpart)
    {
        $computerpart->update([ 'status' => 'Inactive' ]);
        $validate = request()->validate([
            'issue' => 'required|min:3|max:255',
        ]);
        $validate['id'] = Carbon::now()->format('YmdHis');
        $validate['component_id'] = $computerpart->id;
        $validate['type'] = false;
        $validate['fix'] = 'Not Yet Fixed';
        $validate['user_id'] = Auth::user()->id;
        $validate['submitted_by'] = Auth::user()->name;

        Report::forceCreate($validate);
        ReportArchive::forceCreate($validate);

        $validate['report_id'] = $validate['id'];
        self::storeTransaction($validate, 'STORE');

        $user = User::where('account_type', 'admin')->orWhere('account_type', 'working student')->get();
        Notification::send($user, new SubmitComputerPartReport($computerpart, $validate['submitted_by']));

        return redirect('/computerpartsreports')->with('report_created',' Success');
    }

    public function destroy(Report $report)
    {
        $reportArchive = ReportArchive::findOrFail($report->id);
        $reportArchive->update([
            'active' => true
        ]);

        $validated['component_id'] = $report->componentArchive->id;
        $validated['user_id'] = Auth::user()->id;
        $validated['report_id'] = $report->id;
        $validated['submitted_by'] = Auth::user()->name;
        $validated['issue'] = $report->issue;
        $validated['fix'] = $report->fix;
        self::storeTransaction($validated, 'DELETE');

        $report->delete();

        return redirect('/reports')->with('report_deleted', 'Success');

    }
    public function destroyer(Report $report)
    {
        $reportArchive = ReportArchive::findOrFail($report->id);
        $reportArchive->update([
            'active' => true
        ]);

        $validated['component_id'] = $report->computerpartArchive->id;
        $validated['user_id'] = Auth::user()->id;
        $validated['report_id'] = $report->id;
        $validated['submitted_by'] = Auth::user()->name;
        $validated['issue'] = $report->issue;
        $validated['fix'] = $report->fix;
        self::storeTransaction($validated, 'DELETE');

        $report->delete();

        return redirect('/computerpartsreports')->with('report_deleted', 'Success');

    }

    public function restore(ReportArchive $archive)
    {

        $data = [
            'id' => $archive->id,
            'component_id' => $archive->component_id,
            'user_id' => $archive->user_id,
            'issue' => $archive->issue,
            'fix' => $archive->fix,
            'type' => true,
            'submitted_by' =>  $archive->submitted_by,
        ];

        $archive->update(['active' => false]);
        Report::forceCreate($data);

        $data['report_id'] = $data['id'];
        self::storeTransaction($data, 'RESTORE');

        return redirect('/reports')->with('report_restored','Success');

    }
    public function restoring(ReportArchive $archive)
    {

        $data = [
            'id' => $archive->id,
            'component_id' => $archive->component_id,
            'user_id' => $archive->user_id,
            'issue' => $archive->issue,
            'fix' => $archive->fix,
            'type' => false,
            'submitted_by' =>  $archive->submitted_by,
        ];

        $archive->update(['active' => false]);
        Report::forceCreate($data);

        $data['report_id'] = $data['id'];
        self::storeTransaction($data, 'RESTORE');

        return redirect('/computerpartsreports')->with('report_restored','Success');

    }

}
