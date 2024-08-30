<?php

namespace App\Http\Controllers;

use App\Department;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use App\User;
use App\Course;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function notifications()
    {
        return view('notifications.index');
    }

    public function profile()
    {
        $courses = Course::all();
        $department = Department::all();
        $users = User::all();
        return view('users.profile', compact('courses', 'users','department'));
    }
    public function findCourseName(Request $request){

        $data = Course::select('coursename','id')->where('department_id', $request->id)->take(100)->get();
        return response()->json($data);
    }

    public function updateProfile(User $user)
    {

        $validated = request()->validate([
            'name' => 'required|string|min:3',
            'school_id' => 'required|string|min:3',
            'email' => 'required|email|min:3',
            'contact_number' => 'required|string|min:3',
            'birthdate' => 'required',
            'course_id' => 'required|string',
            'department_id' => 'required|string',
            'image' => 'sometimes|mimes:jpg,jpeg,png|max:10000',
            'password' => 'sometimes|nullable|min:6|confirmed',
        ]);

        if(request()->hasfile('image')) {
            $file = request()->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = Carbon::now()->format('YmdHis') . '.' . $extension;
            $file->move('uploads/components/', $filename);

            $validated['image'] = $filename;
        }

        if($validated['password'] == null){
            unset($validated['password']);
        }else{
            $password = $validated['password'];
            $validated['password'] = Hash::make($password);
        }
        $user->update($validated);

        return back()->with('profile_updated','Success');

    }
}
