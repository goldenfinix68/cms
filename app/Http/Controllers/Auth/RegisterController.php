<?php

namespace App\Http\Controllers\Auth;

use App\Department;
use App\User;
use App\Course;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Notification;
use App\Notifications\CreateUser;
use Carbon\Carbon;


class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'schoolId' => ['required', 'string', 'max:15', 'unique:users,school_id'],
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'course_id' => ['required', 'string'],
            'department_id' => ['required', 'string'],
            'contactNum' => ['required', 'string', 'max:15',],
            'birthdate' => ['required', 'date', 'max:255'],
            'account_type' => ['required', 'string'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
         // session(['Created' => 'User created successfully']);
         session()->flash('user_created', 'User created successfully');

         $user = [
            'name' => $data['name'],
            'email' => $data['email'],
            'school_id' => $data['schoolId'],
            'contact_number' => $data['contactNum'],
            'birthdate' => $data['birthdate'],
            'account_type' => $data['account_type'],
            'password' => Hash::make("PASSWORD"),
            'course_id' => $data['course_id'],
             'department_id' => $data['department_id'],
            'borrow_status' => true,
            'verified' => false
         ];

         if($data['account_type'] == 'admin' && $data['name'] == 'Administrator'){
            $user['verified'] = true;
         }
         $user['id'] = Carbon::now()->format('YmdHis');

         $newUser = User::create($user);
         $admins = User::where('account_type', 'admin')->get();
         if($user['verified'] == false){
             Notification::send($admins, new CreateUser($newUser));
         }

         return $newUser;
    }
    public function  showRegistrationForm()
    {
        $department = Department::all();
        return view('auth.register',compact('department'));
    }

    public function findCourseName(Request $request){

        $data = Course::select('coursename','id')->where('department_id', $request->id)->take(100)->get();
        return response()->json($data);
    }


}
