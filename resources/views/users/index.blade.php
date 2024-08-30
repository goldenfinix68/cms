@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Users list</h1>
        <div class="mt-2">
            <a href="/users/create"> <button class="btn btn-primary"> <strong>ADD USER</strong></button> </a>
            <button class="btn btn-secondary" data-toggle="modal" data-target="#exportModal"> <strong>EXPORT
                    USERS</strong></button>
        </div>
    </div>

    <form action="/exports/users" method="POST">
        @csrf
        <div class="modal fade" id="exportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Export Users</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="start_date">Start Date</label>
                            <input type="date" name="start_date" class="form-control" id="start_date" value="{{old('start_date') ? old('start_date'):'' }}"
                                   aria-describedby="start_date" placeholder="Enter start_date">

                            @error('start_date')
                            <small id="start_date" class="form-text text-danger">{{$message}}</small>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="end_date">End Date</label>
                            <input type="date" name="end_date" class="form-control" id="end_date" value="{{old('end_date') ? old('end_date'):'' }}"
                                   aria-describedby="end_date" placeholder="Enter end date">

                            @error('end_date')
                            <small id="end_date" class="form-text text-danger">{{$message}}</small>
                            @enderror
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Download</button>
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="container-fluid content py-5">
        @if($users->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>User Image</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Account Type</th>
                    <th>Verified</th>
                    <th>Borrow Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($users->reverse() as $user)
                    <tr>
                        <td>@if($user->image == null)
                                <img src="default.png" class="img-fluid" width="100px;"
                                     height="100px;">
                            @else
                                <img src="{{ asset('uploads/components/' . $user->image) }}" class="img-fluid" width="100px;"
                                     height="100px;">
                            @endif</td>
                        <td>{{$user->name}}</td>
                        <td>{{$user->email}}</td>
                        <td>{{$user->contact_number}}</td>
                        <td>{{$user->account_type}}</td>
                      
                        <td>
                            @if($user->verified)
                                <span class="badge badge-info">Verified</span>
                            @else
                                <span class="badge badge-warning">Not verified</span>
                            @endif
                        </td>
                        <td>
                            @if($user->borrow_status)
                                <span class="badge badge-info">Can borrow</span>
                            @else
                                <span class="badge badge-warning">Cannot borrow</span>
                            @endif
                        </td>
                        <td>
                            <a href="/users/edit/{{$user->id}}" class="btn btn-sm btn-block btn-primary"> Edit </a>
                            <button class="btn btn-sm btn-block btn-danger"
                                    onclick="return deleteUser({{$user->id}})">Delete</button>
                        </td>
                        <div style="display:hidden">
                            <form action="/users/delete/{{$user->id}}" method="POST"
                                  id="delete{{$user->id}}">
                                @csrf
                                @method('DELETE')
                            </form>
                        </div>
                    </tr>

                @endforeach


                </tbody>
                <tfoot>
                <tr>
                    <th>User Image</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Account Type</th>
                    <th>Verified</th>
                    <th>Borrow Status</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
            </table>
        @else
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h4 class="card-title">Oops..</h4>
                    <p class="card-text">There are no users created yet. Go and create one!</p>
                </div>
            </div>
        @endif
    </div>

    @push('scripts')
        <script>
            @if(Session::get('user_updated'))
            Swal.fire(
                'Success!',
                'You have updated a user!',
                'success'
            )
            @endif

            @if(Session::get('user_deleted'))
            Swal.fire(
                'Success!',
                'You have deleted a user',
                'success'
            )
            @endif

            @if(Session::get('user_registered'))
            Swal.fire(
                'Success!',
                'You have registered a user',
                'success'
            )
            @endif

            @if(Session::get('no_users'))
            Swal.fire(
                'Oops!',
                'There are no data with the fields you entered in the exports',
                'error'
            )
            @endif

            @error('start_date')
            $( document ).ready(function() {
                $('#exportModal').modal('show')
            });
            @enderror
            @error('end_date')
            $( document ).ready(function() {
                $('#exportModal').modal('show')
            });
            @enderror

            function deleteUser(id) {
                Swal.fire({
                    title: 'Are you sure?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $("#delete" + id).submit();
                    }
                })
            }

        </script>
    @endpush
@endsection
