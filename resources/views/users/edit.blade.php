@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Edit user</h1>
        <a href="/users"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/users/update/{{$user->id}}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')

                <div class="form-group">
                    <label for="school_id">School ID</label>
                    <input type="text" name="school_id" class="form-control @error('school_id') is-invalid @enderror"
                           id="school_id" aria-describedby="school_id" placeholder="Enter school_id"
                           value="{{old('school_id') ? old('school_id'):$user->school_id}}">
                    @error('school_id')
                    <small id="school_id" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" class="form-control @error('name') is-invalid @enderror" id="name"
                           aria-describedby="name" placeholder="Enter name" value="{{old('name') ? old('name'):$user->name}}">
                    @error('name')
                    <small id="name" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" name="email" class="form-control @error('email') is-invalid @enderror" id="email"
                           aria-describedby="email" placeholder="Enter email"
                           value="{{old('email') ? old('email'):$user->email}}">
                    @error('email')
                    <small id="email" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="contact_number">Contact Number</label>
                    <input type="text" name="contact_number"
                           class="form-control @error('contact_number') is-invalid @enderror" id="contact_number"
                           aria-describedby="contact_number" placeholder="Enter contact_number"
                           value="{{old('contact_number') ? old('contact_number'):$user->contact_number}}">
                    @error('contact_number')
                    <small id="contact_number" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="birthdate">Birthdate</label>
                    <input type="date" name="birthdate" class="form-control @error('birthdate') is-invalid @enderror"
                           id="birthdate" aria-describedby="birthdate" placeholder="Enter birthdate"
                           value="{{old('birthdate') ? old('birthdate'):$user->birthdate}}">
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
                    <label for="category">Account Type</label>
                    <select class="form-control @error('account_type') is-invalid @enderror" name="account_type"
                            id="account_type">
                        <option value="" selected disabled>Please select a category</option>
                        <option value="admin"
                            {{old('account_type') === 'admin' || $user->account_type == 'admin' ? 'selected':''}}>Admin
                        </option>
                        <option value="working student"
                            {{old('account_type') === 'working student' || $user->account_type == 'working student' ? 'selected':''}}>
                            Working Student</option>
                        <option value="faculty"
                            {{old('account_type') === 'faculty' || $user->account_type == 'faculty' ? 'selected':''}}>
                            Faculty</option>
                        <option value="student"
                            {{old('account_type') === 'student' || $user->account_type == 'student' ? 'selected':''}}>
                            Student</option>
                    </select>
                    @error('account_type')
                    <small id="account_type" class="form-text text-danger">{{$message}}</small>
                    @enderror


                </div>

                <div class="form-group">
                    <label for="image">User Image</label>
                    <br>
                    <small class="text-muted">Maximum image size is 10 MB and accepted file types are jpg, jpeg, png</small>
                    <input type="file" class="form-control @error('image') is-invalid @enderror" name='image' id="image" aria-describedby="fileHelp">
                    @error('image')
                    <small id="image" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" name="verified" class="custom-control-input" id="customCheck1" {{$user->verified ? 'checked':''}}>
                        <label class="custom-control-label" for="customCheck1"><h6>Verified</h6></label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" name="borrow_status" class="custom-control-input" id="check2" {{$user->borrow_status ? 'checked':''}}>
                        <label class="custom-control-label" for="check2"><h6>Borrow Status</h6></label>
                    </div>
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
