@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Add Course</h1>
        <a href="/course"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/course/create" method="POST">
                @csrf

                <div class="form-group">
                    <label for="coursename"> Course Name</label>
                    <input type="text" name="coursename" class="form-control @error('coursename') is-invalid @enderror" id="name" aria-describedby="coursename"
                           placeholder="Enter Course name" value="{{old('coursename') ? old('coursename'):''}}">
                    @error('coursename')
                    <small id="coursename" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="department_id">Departments</label>
                    @if($departments->count())
                        <select class="form-control @error('department_id') is-invalid @enderror" name="department_id" id="department_id">
                            <option value="" selected disabled>Please select a department</option>
                            @foreach($departments as $department)
                                <option value="{{$department->id}}" {{old('department_id') === $department->id ? 'selected':''}}>{{$department->departmentname}}
                                </option>
                            @endforeach
                        </select>
                    @else
                        <div class="alert alert-info">
                            <strong>Heads up!</strong> There are no available rooms yet. Please click <a href="/create/department" class="alert-link">here</a> to create one!
                        </div>

                    @endif
                    @error('department')
                    <small id="department" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-info mx-1">Submit</button>
                    <a href="/course" class="btn btn-outline-danger mx-1"> Cancel </a>

                </div>
            </form>
        </div>
    </div>


@endsection
