@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Course list</h1>
    </div>


    <div class="container-fluid content py-5">
        @if($course->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>

                    <th>Course Name</th>
                    <th>Department</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                @foreach($course->reverse() as $course)

                    <tr>
                        <td>{{$course->coursename}}</td>
                        <td>{{$course->departmentArchive->departmentname}}</td>
                       

                        <td>
                            <a href="/course/{{$course->id}}" class="btn btn-sm btn-block btn-info"> View </a>
                            @if(Auth::user()->account_type == 'admin' || Auth::user()->account_type == 'working student' )
                                <a href="/course/edit/{{$course->id}}" class="btn btn-sm btn-block btn-success"> Edit </a>
                                <button class="btn btn-sm btn-block btn-danger"
                                        onclick="return deleteCourse({{$course->id}})">Delete</button>
                                @endif
                                </a>
                        </td>
                    </tr>
                    <div style="display:hidden">
                        <form action="/course/delete/{{$course->id}}" method="POST" id="delete{{$course->id}}">
                            @csrf
                            @method('DELETE')
                        </form>
                    </div>
                @endforeach


                </tbody>
                <tfoot>
                <tr>

                    <th>Course Name</th>
                    <th>Department</th>
                    <th>Submitted By</th>

                </tr>
                </tfoot>
            </table>
        @else
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h4 class="card-title">Oops..</h4>
                    <p class="card-text">There are no courses created yet..</p>
                </div>
            </div>
        @endif
    </div>

    @push('scripts')
        <script>
            @if(Session::get('course_created'))
            Swal.fire(
                'Success!',
                'You created a course',
                'success'
            )
            @endif

            @if(Session::get('course_updated'))
            Swal.fire(
                'Success!',
                'You updated a course',
                'success'
            )
            @endif

            @if(Session::get('course_deleted'))
            Swal.fire(
                'Success!',
                'You deleted a course',
                'success'
            )
            @endif

            @if(Session::get('course_restored'))
            Swal.fire(
                'Success!',
                'You restored a course',
                'success'
            )
            @endif

            @if(Session::get('no_courses'))
            Swal.fire(
                'Oops!',
                'There are no data with the fields you entered in the exports',
                'error'
            )
            @endif

            function deleteCourse(id) {
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
