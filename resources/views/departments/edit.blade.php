@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Edit Department</h1>
        <a href="/departments"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/departments/update/{{$department->id}}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="form-group">
                    <label for="departmentname">Department Name</label>
                    <input type="text" name="departmentname" class="form-control @error('departmentname') is-invalid @enderror" id="departmentname"
                           aria-describedby="departmentname" placeholder="Enter Department Name"
                           value="{{old('departmentname') ? old('departmentname'):$department->departmentname}}">
                    @error('departmentname')
                    <small id="departmentname" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="text" name="email" class="form-control @error('email') is-invalid @enderror" id="email"
                           aria-describedby="email" placeholder="Enter Email Address"
                           value="{{old('email') ? old('email'):$department->email}}">
                    @error('email')
                    <small id="email" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="contact_number">Contact Number</label>
                    <input type="text" name="contact_number" class="form-control @error('contact_number') is-invalid @enderror" id="contact_number"
                           aria-describedby="contact_number" placeholder="Enter Contact Number"
                           value="{{old('Contact_number') ? old('contact_number'):$department->contact_number}}">
                    @error('contact_number')
                    <small id="contact_number" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-info mx-1">Submit</button>
                    <a href="/departments" class="btn btn-outline-danger mx-1"> Cancel </a>

                </div>
            </form>
        </div>
    </div>
@endsection
