<?php

namespace App\Http\Controllers;
use App\Course;
use App\Department;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Middleware\CheckAccountType;
use App\Notifications\AcceptUser;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Hash;
use App\User;

class UsersController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', CheckAccountType::class]);
    }

    public function index()
    {
        $users = User::where('active', true)->get();
        return view('users.index', compact('users'));
    }

    public function create()
    {
        $department = Department::all();
        $courses = Course::all();
        return view('users.create',compact('department','courses'));
    }

    public function edit(User $user)
    {
        $department = Department::all();
        $courses = Course::all();
        return view('users.edit', compact('user','courses','department'));
    }

    public function update(User $user)
    {

        $validated = request()->validate([
            'name' => 'required|string|min:3',
            'school_id' => 'required|string|min:3',
            'email' => 'required|email|min:3',
            'contact_number' => 'required|string|min:3',
            'birthdate' => 'required',
            'account_type' => 'required',
            'image' => 'sometimes|max:10000',
            'course_id' => 'required',
            'department_id' => 'required',
        ]);

        // dd($user->verified, $user->borrow_status);
        if(request('verified')){
            $validated['verified'] = true;

            Notification::send($user, new AcceptUser($user));

        } else {
            $validated['verified'] = false;
        }

        if(request('borrow_status')) {
            $validated['borrow_status'] = true;
        } else {
            $validated['borrow_status'] = false;
        }


        if(request()->hasfile('image')) {
            $file = request()->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = Carbon::now()->format('YmdHis') . '.' . $extension;
            $file->move('uploads/components/', $filename);

            $validated['image'] = $filename;
            $picture = true;
        }
        $user->update($validated);

        return redirect('/users')->with('user_updated','Success');
    }

    public function destroy(User $user)
    {
        $user->update([ 'active' => false]);
        $user->update([ 'verified' => false]);
        $user->update([ 'borrow_status' => false]);

        return back()->with('user_deleted', 'Success');
    }

    public function store(User $user)
    {
        //dd(request()->all());
        $validated = request()->validate([
            'name' => 'required|min:3',
            'school_id' => 'required|min:3',
            'contact_number' => 'required|min:5',
            'email' => 'required|email',
            'birthdate' => 'required|date',
            'account_type' => 'required',
            'image' => 'sometimes|max:10000',
            'department_id' => 'required',
            'course_id' => 'required'
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
        $validated['verified'] = true;
        $validated['borrow_status'] = true;
        $validated['password'] = Hash::make('PASSWORD');

        $user = User::forceCreate($validated);

        Notification::send($user, new AcceptUser($user));

        return redirect('/users')->with('user_registered','Success');
    }
    public function  showRegistrationForm()
    {
        $department = Department::all();
        return view('auth.register',compact('department'));
        $course = Course::all();
        return view('auth.register',compact('course'));
    }
    public function findCourseName(Request $request){

        $data = Course::select('coursename','id')->where('department_id', $request->id)->take(100)->get();
        return response()->json($data);
    }

}
