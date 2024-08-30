<?php

namespace App\Http\Controllers;
use App\Course;
use App\CourseArchive;
use App\Department;
use App\User;

use App\ReportArchive;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CourseController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $course = Course::all();
        return view('course.index',compact('course'));
    }

    private function storeArchive($data)
    {
        return CourseArchive::forceCreate($data);
    }

    private function updateArchive($id, $data)
    {
        $course = CourseArchive::findOrFail($id);

        return $course->update($data);

    }

    public function create()
    {
        $departments = Department::all();
        return view('course.create' , compact('departments'));
    }

    public function edit(Course $course)
    {
        $departments = Department::all();
        return view('course.edit', compact('course','departments'));
    }
    public function update(Course $course)
    {
        //dd(request()->all());
        $validated = request()->validate([
            'coursename' => 'required',
            'department_id' => 'required',
        ]);

        $course->update($validated);
        self::updateArchive($course->id, $validated);
        return redirect('/course')->with('course_updated','Success');
    }

    public function archive()
    {
        $archive = CourseArchive::where('active', true)->get();
        return view('course.archive', compact('archive'));
    }

    public function store()
    {

        $validated = request()->validate([
            'coursename' => 'required',
            'department_id' => 'required',
        ]);



        Course::forceCreate($validated);
        self::storeArchive($validated);

        return redirect('/course')->with('course_created','Success');

    }


    public function view(Course $course)
    {
        return view('course.view', compact('course'));
    }


    public function destroy(Course $course)
    {

        $archive = CourseArchive::findOrFail($course->id);

        $archive->update([ 'active' => true ]);

        $course->delete();

        $course = [
            'id' => $archive->id,
            'coursename' => $archive->coursename,
            'department_id' => $archive->department_id,
        ];


        return back()->with('course_deleted','Success');
    }


    public function restore(CourseArchive $archive)
    {
        $archive->update(['active' => false]);

        $course = [
            'id' => $archive->id,
            'coursename' => $archive->coursename,
            'department_id' => $archive->department_id,

        ];

        Course::forceCreate($course);


        return redirect('/course')->with('course_restored','Success');
    }



}
