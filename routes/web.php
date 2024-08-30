<?php
use App\Http\Middleware\CheckAccountType;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/findCourseName','Auth\RegisterController@findCourseName');
//Component routes

Route::get('/components', 'ComponentsController@index');
Route::get('/components/create', 'ComponentsController@create')->middleware('auth', CheckAccountType::class);
Route::get('/components/report/{component}', 'ComponentsController@report')->middleware('auth', CheckAccountType::class);
Route::get('/components/borrow/{component}', 'ComponentsController@borrow');
Route::get('/components/edit/{component}', 'ComponentsController@edit')->middleware('auth', CheckAccountType::class);
Route::get('/components/archives', 'ComponentsController@archive')->middleware('auth', CheckAccountType::class);
Route::get('/components/transactions', 'ComponentsController@transactions')->middleware('auth', CheckAccountType::class);
Route::post('/generateqr', 'ComponentsController@generateQR');
Route::post('/components/create', 'ComponentsController@store');
Route::put('/components/update/{component}', 'ComponentsController@update');
Route::delete('/components/delete/{component}', 'ComponentsController@destroy');
Route::post('/components/restore/{archive}', 'ComponentsController@restore');

//Department routes
Route::get('/departments/archives', 'DepartmentsController@archive');
Route::get('/departments', 'DepartmentsController@index');
Route::get('/departments/create', 'DepartmentsController@create')->middleware('auth', CheckAccountType::class);
Route::post('/departments/create', 'DepartmentsController@store');
Route::get('/departments/edit/{department}', 'DepartmentsController@edit')->middleware('auth', CheckAccountType::class);
Route::put('/departments/update/{department}', 'DepartmentsController@update');
Route::get('/departments/{department}', 'DepartmentsController@view');
Route::delete('/departments/delete/{department}', 'DepartmentsController@destroy');
Route::post('/departments/restore/{archive}', 'DepartmentsController@restore');




// Report routes

Route::get('/reports', 'ReportsController@index');
Route::get('/computerpartsreports', 'ReportsController@indexes');
Route::get('/reports/{report}', 'ReportsController@view');
Route::get('/computerpartsreports/{report}', 'ReportsController@viewing');
Route::get('/reports/edit/{report}', 'ReportsController@edit');
Route::get('/reports/fix/{report}', 'ReportsController@fix');
Route::get('/computerpartsreports/edit/{report}', 'ReportsController@editing');
Route::get('/computerpartsreports/fix/{report}', 'ReportsController@fixing');
Route::get('/computerpartsreports-archives', 'ReportsController@arch');
Route::get('/reports-archives', 'ReportsController@archives');
Route::get('/reports-transactions', 'ReportsController@transactions');
Route::get('/computerpartsreports-transactions', 'ReportsController@transact');

Route::post('/reports/create/{component}', 'ReportsController@store');
Route::post('/reports/creates/{computerpart}', 'ReportsController@stores');
Route::put('/reports/update/{report}', 'ReportsController@update');
Route::put('/reports/updatefix/{report}', 'ReportsController@fixupdate');
Route::put('/computerpartsreports/update/{report}', 'ReportsController@updating');
Route::put('/computerpartsreports/updatefix/{report}', 'ReportsController@fixupdating');
Route::delete('/reports/delete/{report}', 'ReportsController@destroy');
Route::delete('/computerpartsreports/delete/{report}', 'ReportsController@destroyer');
Route::post('/reports/restore/{archive}', 'ReportsController@restore');
Route::post('/computerpartsreports/restore/{archive}', 'ReportsController@restoring');

// User routes

Route::get('/users', 'UsersController@index');
Route::get('/users/create', 'UsersController@create');
Route::get('/users/edit/{user}', 'UsersController@edit');
Route::get('/profile', 'HomeController@profile');
Route::put('/profile/update/{user}', 'HomeController@updateProfile');
Route::get('/findCourseName','HomeController@findCourseName');
Route::get('/findCourseName','UsersController@findCourseName');
Route::put('/users/update/{user}', 'UsersController@update');
Route::delete('/users/delete/{user}', 'UsersController@destroy');
Route::post('/create/user', 'UsersController@store');

//Course routes
Route::delete('/course/delete/{course}', 'CourseController@destroy');
Route::get('/course/archive', 'CourseController@archive');
Route::get('/course', 'CourseController@index');
Route::get('/course/edit/{course}', 'CourseController@edit');
Route::put('/course/update/{course}', 'CourseController@update');
Route::get('/course/{course}', 'CourseController@view');
Route::get('/create/course', 'CourseController@create');
Route::post('/course/create', 'CourseController@store');
Route::post('/course/restore/{archive}', 'CourseController@restore');


// Rooms routes
Route::get('/rooms', 'RoomsController@index');
Route::get('/rooms/{room}', 'RoomsController@view');
Route::get('/rooms/pc/{room}', 'RoomsController@pc');
Route::get('/create/room', 'RoomsController@create');
Route::post('/rooms/create', 'RoomsController@store');
Route::get('/rooms/edit/{room}', 'RoomsController@edit');
Route::put('/rooms/update/{room}', 'RoomsController@update');

//Computer routes
Route::get('/computers/archive', 'ComputersController@archive');
Route::get('/computers', 'ComputersController@index');
Route::post('/computers/create', 'ComputersController@store');
Route::get('/create/computer', 'ComputersController@create');
Route::get('/computers/{computer}', 'ComputersController@view');
Route::get('/computers/edit/{computer}', 'ComputersController@edit');
Route::put('/computers/update/{computer}', 'ComputersController@update');
Route::delete('/computers/delete/{computer}', 'ComputersController@destroy');
Route::post('/computers/restore/{archive}', 'ComputersController@restore');

//ComputerParts routes
Route::get('/computerparts', 'ComputerpartsController@index');
Route::get('/create/computerparts', 'ComputerpartsController@create')->middleware('auth', CheckAccountType::class);
Route::post('/computerparts/create', 'ComputerpartsController@store');
Route::post('/generateqrs', 'ComputerpartsController@generateQR');
Route::get('/computerparts/edit/{computerparts}', 'ComputerpartsController@edit')->middleware('auth', CheckAccountType::class);
Route::put('/computerparts/update/{computerparts}', 'ComputerpartsController@update');
Route::get('/findComputerName', 'ComputerpartsController@findComputerName');
Route::get('/computerparts/transactions', 'ComputerpartsController@transactions')->middleware('auth', CheckAccountType::class);
Route::get('/computerparts/archives', 'ComputerpartsController@archive')->middleware('auth', CheckAccountType::class);
Route::delete('/computerparts/delete/{computerpart}', 'ComputerpartsController@destroy');
Route::post('/computerparts/restore/{archive}', 'ComputerpartsController@restore');
Route::get('/computerparts/report/{computerpart}', 'ComputerpartsController@report')->middleware('auth', CheckAccountType::class);


//ComputerCategories routes
Route::post('/computercategs/create', 'ComputercategsController@store');
Route::get('/create/computercategs', 'ComputercategsController@create');
Route::get('/computercategs', 'ComputercategsController@index');
Route::get('/computercategs/{computercateg}', 'ComputercategsController@view');
Route::get('/computercategs/edit/{computercateg}', 'ComputercategsController@edit');
Route::delete('/computercategs/delete/{computercateg}', 'ComputercategsController@destroy');
Route::put('/computercategs/update/{computercateg}', 'ComputercategsController@update');
Route::get('/computercategs/archives', 'ComputercategsController@archive');

//Borrow routes
Route::get('/borrowlogs', 'BorrowController@logs');
Route::get('/borrows/edit/{borrow}', 'BorrowController@edit')->middleware('auth', CheckAccountType::class);;
Route::get('/borrows/return/{borrow}', 'BorrowController@return')->middleware('auth', CheckAccountType::class);;
Route::get('/borrow/notify', 'BorrowController@notify')->middleware('auth', CheckAccountType::class);

Route::post('/borrow/store/{component}', 'BorrowController@store');
Route::put('/borrow/update/{borrow}', 'BorrowController@update');
Route::put('/borrow/returnupdate/{borrow}', 'BorrowController@returnupdate');


// Notification routes

Route::get('/notifications', 'HomeController@notifications');
Route::get('/read', function(){
    auth()->user()->unreadNotifications->markAsRead();
    return back();
});

// Export routes

Route::post('/exports/components', 'ExportsController@component');
Route::post('/exports/borrows', 'ExportsController@borrows');
Route::post('/exports/reports', 'ExportsController@report');
Route::post('/exports/users', 'ExportsController@user');
Route::post('/exports/computerpartsreports', 'ExportsController@computerpartsreports');

// Schedule run test
Route::get('/schedule-run', function() {
    $exitCode = Artisan::call('schedule:run');
    return '<h1>Schedule ran</h1>';
});


Route::get('not-taken-categories/{roomId}/{pcId}','ComputerpartsController@notTakenCategories');



