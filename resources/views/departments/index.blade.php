@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Department list</h1>
    </div>
    <div class="container-fluid content py-5">
        @if($departments->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Department Name</th>
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>

                @foreach($departments->reverse() as $department)
                    <tr>
                        <td>{{$department->departmentname}}</td>
                        <td>{{$department->email}}</td>
                        <td>{{$department->contact_number}}</td>
                        <td>
                            @if(Auth::user()->account_type == 'admin' || Auth::user()->account_type == 'working student' )
                                <a href="/departments/{{$department->id}}" class="btn btn-sm btn-block btn-warning"> View </a>
                                <a href="/departments/edit/{{$department->id}}" class="btn btn-sm btn-block btn-success"> Edit </a>
                                <button class="btn btn-sm btn-block btn-danger"
                                        onclick="return deleteDepartment({{$department->id}})">Delete</button>
                            @endif

                        </td>
                        <form action="/departments/delete/{{$department->id}}" method="POST" id="delete{{$department->id}}">
                            @csrf
                            @method('DELETE')
                        </form>
    </div>
    </tr>
    @endforeach

    </tbody>
    <tfoot>
    <tr>

        <th>Department Name</th>
        <th>Email</th>
        <th>Contact Number</th>
    </tr>
    </tfoot>
    </table>
    @else
        <div class="card text-white bg-info mb-3">
            <div class="card-body">
                <h4 class="card-title">Oops..</h4>
                <p class="card-text">There are no Departments uploaded yet</p>
            </div>
        </div>
        @endif
        </div>

        @push('scripts')
            <script>
                @if(Session::get('department_created'))
                Swal.fire(
                    'Success!',
                    'You created a department!',
                    'success'
                )
                @endif

                @if(Session::get('department_updated'))
                Swal.fire(
                    'Success!',
                    'You have updated a department!',
                    'success'
                )
                @endif

                @if(Session::get('departments_deleted'))
                Swal.fire(
                    'Deleted!',
                    'Department has been deleted and archived',
                    'success'
                )
                @endif

                @if(Session::get('departments_restored'))
                Swal.fire(
                    'Restored!',
                    'Department has been restored successfully',
                    'success'
                )
                @endif


                function deleteDepartment(id) {
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
