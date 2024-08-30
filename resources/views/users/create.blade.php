@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Create user</h1>
        <a href="/users"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/create/user" method="POST">
                @csrf

                <div class="form-group">
                    <label for="school_id">School ID</label>
                    <input type="text" name="school_id" class="form-control" id="school_id" aria-describedby="school_id"
                           placeholder="Enter school id" value="{{ old('school_id') ? old('school_id') : '' }}">
                    @error('school_id')
                    <small id="school_id" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" class="form-control" id="name" aria-describedby="name"
                           placeholder="Enter name" value="{{ old('name') ? old('name') : '' }}">
                    @error('name')
                    <small id="name" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" name="email" class="form-control" id="email" aria-describedby="email"
                           placeholder="Enter email" value="{{ old('email') ? old('email') : '' }}">
                    @error('email')
                    <small id="email" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="contact_number">Contact Number</label>
                    <input type="text" name="contact_number" class="form-control" id="contact_number" aria-describedby="contact_number"
                           placeholder="Enter contact number" value="{{ old('contact_number') ? old('contact_number') : '' }}">
                    @error('contact_number')
                    <small id="contact_number" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="birthdate">Birthdate</label>
                    <input type="date" name="birthdate" class="form-control" id="birthdate" aria-describedby="birthdate"
                           placeholder="Enter birthdate" value="{{ old('birthdate') ? old('birthdate') : '' }}">
                    @error('birthdate')
                    <small id="birthdate" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>
                <div class="form-group row">
                    <label for="department_id"><strong class='text-danger'>*</strong>Department</label>
                    @if($department->count())
                        <select class="departments form-control" name='department_id' id="room_id" class="form-control">
                            <option value="" selected disabled>Please select a Department</option>
                            @foreach($department as $depart)
                                <option value="{{$depart->id}}">{{$depart->departmentname}}</option>
                            @endforeach

                        </select>

                    @else
                        <div class="alert alert-info">
                            <strong>Heads up!</strong> There are no available departments yet. Please click <a href="/departments/create" class="alert-link">here</a> to create one!
                        </div>
                    @endif
                    @error('department_id')
                    <small id="department_id" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="course_id"><strong class='text-danger'>*</strong>Course/Faculty</label>
                    @if($courses->count())
                        <select class="courses form-control" name='course_id' id="course_id">
                            <option value="" disabled="true" selected="true">Course/Faculty</option>
                        </select>
                    @else
                        <div class="alert alert-info">
                            <strong>Heads up!</strong> There are no available courses yet. Please click <a href="/create/course" class="alert-link">here</a> to create one!
                        </div>
                    @endif
                    @error('course_id')
                    <small id="course_id" class="form-text text-danger">{{$message}}</small>
                    @enderror

                </div>


                <div class="form-group">
                    <label for="account_type">Account Type</label>
                    <select class="form-control" name="account_type" id="account_type">
                        <option value="" selected disabled>Please select an account type</option>
                        <option value="admin" {{ old('account_type') == 'admin' ? 'selected':''}}>Admin</option>
                        <option value="working student" {{ old('working') == 'admin' ? 'selected':''}}>Working Student</option>
                        <option value="faculty" {{ old('faculty') == 'admin' ? 'selected':''}}>Faculty</option>
                        <option value="student" {{ old('student') == 'admin' ? 'selected':''}}>Student</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="text" name="password" class="form-control" id="password" aria-describedby="password"
                           disabled>
                    <small id="password" class="form-text">Default password of this user is <strong>PASSWORD</strong> in uppercase letters</small>
                </div>

                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-info mx-1">Submit</button>
                    <a href="/users" class="btn btn-outline-danger mx-1"> Cancel </a>

                </div>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

                <script type="text/javascript">
                    $(document).ready(function () {

                        $(document).on('change','.departments',function() {
                            console.log("hmm its change");

                            var dept_id=$(this).val();
                            // console.log(dept_id);

                            var div=$(this).parent().parent();

                            var op=" "

                            $.ajax({
                                type:'get',
                                url:'{!!URL::to('findCourseName')!!}',
                                data:{'id':dept_id},
                                success:function (data) {
                                    //console.log('success');

                                    //console.log(data);

                                    //console.log(data.length);
                                    op+='<option value="0" selected disabled>Course/Faculty</option>';
                                    for(var i=0;i<data.length;i++) {
                                        op += '<option value="' + data[i].id + '">' + data[i].coursename + '</option>';
                                    }
                                    div.find('.courses').html(" ");
                                    div.find('.courses').append(op);


                                },
                                error:function(){

                                }

                            });
                        });
                    });
                </script>
            </form>
        </div>
    </div>
@endsection
