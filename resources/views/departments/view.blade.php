@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>View Department</h1>
        <a href="/departments"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">

            <div class="form-group">
                <label for="departmentname"> Department Name</label>
                <input type="text" class="form-control" id="name" aria-describedby="departmentname" placeholder="Enter Department name"
                       value="{{$department->departmentname}}" readonly>
            </div>


            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="text" class="form-control " id="email" aria-describedby="email"
                       value="{{$department->email}}" readonly>
            </div>

            <div class="form-group">
                <label for="contact_number">Contact Number</label>
                <input type="text" class="form-control" id="contact_number" aria-describedby="contact_number"
                       placeholder="Enter Contact Number" value="{{$department->contact_number}}" readonly>
            </div>

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#exampleModalLong">
                View Courses registered in department
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document" style="min-width:60%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Courses</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Course Name</th>
                                    <th>Department</th>
                                    <th>Created At</th>
                                    <th>Updated At</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($department->course  as $course)
                                    <tr>
                                        <th>{{$course->id}}</th>
                                        <td>{{$course->coursename}}</td>
                                        <td>{{$course->department->departmentname}}</td>
                                        <td>{{$course->created_at}}</td>
                                        <td>{{$course->updated_at}}</td>
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
                <a href="/departments" class="btn btn-info mx-1"> Edit </a>
            </div>
        </div>
    </div>


@endsection
