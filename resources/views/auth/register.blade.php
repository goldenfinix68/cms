@extends('layouts.index')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Register new users</div>

                <div class="card-body">
                <p>Fields with an <strong class='text-danger'>*</strong> is required</p>
                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="schoolId" class="col-md-4 col-form-label text-md-right"><strong class='text-danger'>*</strong> School ID</label>

                            <div class="col-md-6">
                                <input id="schoolId" type="text" class="form-control{{ $errors->has('schoolId') ? ' is-invalid' : '' }}" name="schoolId" value="{{ old('schoolId') }}" required autofocus>

                                @if ($errors->has('schoolId'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('schoolId') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right"><strong class='text-danger'>*</strong> Name</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" required autofocus>

                                @if ($errors->has('name'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right"><strong class='text-danger'>*</strong> Email Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required>

                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>

                        </div>

                        <div class="form-group row">
                            <label for="contactNum" class="col-md-4 col-form-label text-md-right"><strong class='text-danger'>*</strong> Contact Number</label>

                            <div class="col-md-6">
                                <input id="contactNum" type="text" class="form-control{{ $errors->has('contactNum') ? ' is-invalid' : '' }}" name="contactNum" value="{{ old('contactNum') }}" required autofocus>

                                @if ($errors->has('contactNum'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('contactNum') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="birthdate" class="col-md-4 col-form-label text-md-right"><strong class='text-danger'>*</strong> Birth Date</label>

                            <div class="col-md-6">
                                <input id="birthdate" type="date" class="form-control{{ $errors->has('birthdate') ? ' is-invalid' : '' }}" name="birthdate" value="{{ old('birthdate') }}" required autofocus>

                                @if ($errors->has('birthdate'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('birthdate') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="department_id" class="col-md-4 col-form-label text-md-right"><strong class='text-danger'>*</strong>Department</label>

                            <div class="col-md-6">
                                <select class="department_id" name='department_id' aria-label="Default select example"  style="width: 200px">
                                    <option value="0" disabled="true" selected="true">-Select-</option>
                                    @foreach($department as $depart)
                                        <option value="{{$depart->id}}">{{$depart->departmentname}}</option>
                                    @endforeach

                                </select>

                            </div>

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


                        <div class="form-group row">
                            <label for="accountType" class="col-md-4 col-form-label text-md-right"><strong class='text-danger'>*</strong> Account Type</label>

                            <div class="col-md-6">
                                <select class="form-select" name='account_type' aria-label="Default select example">
                                    <option value="admin" selected>Admin</option>
                                    <option value="working student">Working Student</option>
                                    <option value="faculty">Faculty</option>
                                    <option value="student">Student</option>

                                </select>

                            </div>

                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right"><strong class='text-danger'>*</strong> Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password"  disabled>
                                <p class='m-0'>Default password of the user is <strong>PASSWORD</strong> in uppercase letters</p>


                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>



                        <div class="form-group d-flex mb-0 justify-content-center align-items-center">

                                <button type="submit" class="btn btn-primary mr-2">
                                    {{ __('Register') }}
                                </button>


                                <a href="/" class="btn btn-outline-danger">
                                    Cancel
                                </a>

                        </div>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

                        <script type="text/javascript">
                            $(document).ready(function () {

                                $(document).on('change','.department_id',function () {
                                       //console.log("hmm its change");

                                        var dept_id=$(this).val();
                                       console.log(dept_id);

                                    var div=$(this).parent().parent().parent().;

                                    var op=" "

                                    $.ajax({
                                        type:'get',
                                        url:'{!!URL::to('findCourseName')!!}',
                                        data:{'id':dept_id},
                                        success:function (data) {
                                           //console.log('success');

                                           // console.log(data);

                                          // console.log(data.length);
                                            op+='<option value="0" selected disabled>Course/Faculty</option>';
                                            for(var i=0;i<data.length;i++) {
                                                op += '<option value="' + data[i].id + '">' + data[i].coursename + '</option>';
                                             }
                                            div.find('.course_id').html(" ");
                                            div.find('.course_id').append(op);

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
        </div>
    </div>
</div>
@endsection
