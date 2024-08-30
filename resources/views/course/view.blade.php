@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>View Course</h1>
        <a href="/course"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">

            <div class="form-group">
                <label for="coursename"> Course Name</label>
                <input type="text" class="form-control" id="coursename" aria-describedby="coursename" placeholder="Enter  Course name"
                       value="{{$course->coursename}}" readonly>
            </div>


            <div class="form-group">
                <label for="department">Department</label>
                <input type="text" class="form-control " id="department" aria-describedby="department"
                       value="{{$course->departmentArchive->departmentname}}" readonly>
            </div>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#exampleModalLong">
                View Students Enrolled in this Course
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document" style="min-width:60%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Enrolled Students</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th>School ID</th>
                                    <th>Student Name</th>
                                    <th>Email</th>
                                    <th>Contact Number</th>
                                    <th>Account Type</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($course->archiveUsers as $user)
                                    <tr>
                                        <th>{{$user->school_id}}</th>
                                        <td>{{$user->name}}</td>
                                        <td>{{$user->email}}</td>
                                        <td>{{$user->contact_number}}</td>
                                        <td>{{$user->account_type}}</td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>




            <div class="d-flex justify-content-center mt-3">
                <a href="/course" class="btn btn-info mx-1"> Edit </a>
            </div>
        </div>
    </div>




    </div>
    </div>


@endsection
