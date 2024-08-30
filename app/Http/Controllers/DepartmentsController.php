<?php

namespace App\Http\Controllers;
use App\Department;
use App\DepartmentArchive;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class DepartmentsController extends Controller
{
    public function index()
    {
        $departments = Department::all();
        return view('departments.index', compact('departments'));
    }

    public function archive()
    {
        $archive = DepartmentArchive::where('active', true)->get();
        return view('departments.archive', compact('archive'));
    }


    private function storeArchive($data)
    {
        return DepartmentArchive::forceCreate($data);
    }

    private function updateArchive($id, $data)
    {
        $department = DepartmentArchive::findOrFail($id);

        return $department->update($data);

    }

    public function create()
    {
        return view('departments.create');
    }

    public function store()
    {
        $validated = request()->validate([
            'departmentname' => 'required|string|min:3|max:100',
            'email' => 'required|string|min:5|max:255',
            'contact_number' => 'required|string|min:3|max:50',
        ]);

        $validated['id'] = Carbon::now()->format('YmdHis');
        self::storeArchive($validated);
        Department::forceCreate($validated);

        return redirect('/departments')->with('deparment_created','Success');
    }

    public function edit(Department $department)
    {
        return view('departments.edit', compact('department'));
    }

    public function update(Department $department)
    {
        // dd(request()->all());
        $validated = request()->validate([
            'departmentname' => 'required',
            'email' => 'required',
            'contact_number' => 'required',
        ]);

        $department->update($validated);
        self::updateArchive($department->id, $validated);
        return redirect('/departments')->with('department_updated', 'Success');
    }
    public function view(Department $department)
    {
        return view('departments.view', compact('department'));
    }
    public function destroy(Department $department)
    {

        $archive = DepartmentArchive::findOrFail($department->id);

        $archive->update([ 'active' => true ]);

        $department->delete();

        $department = [
            'id' => $archive->id,
            'departmentname' => $archive->departmentname,
            'email' => $archive->email,
            'contact_number' => $archive->contact_number,
        ];

        return back()->with('departments_deleted','Success');
    }

    public function restore(DepartmentArchive $archive)
    {
        $archive->update(['active' => false]);

        $department = [
            'id' => $archive->id,
            'departmentname' => $archive->departmentname,
            'email' => $archive->email,
            'contact_number' => $archive->contact_number,

        ];

        Department::forceCreate($department);


        return redirect('/departments')->with('departments_restored','Success');
    }
}
