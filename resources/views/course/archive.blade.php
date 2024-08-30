@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Archived Courses</h1>
        <a href="/course"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="container-fluid content py-5">
        @if($archive->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Department</th>
                    <th>Date Archived</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($archive->reverse() as $archive)
                    <tr>
                        <td>{{$archive->coursename}}</td>
                        <td>{{$archive->departmentArchive->departmentname}}</td>
                        <td>{{\Carbon\Carbon::parse($archive->created_at)->format('M d Y h:i A')}}</td>
                        <td>
                            <button class="btn btn-block btn-info"
                                    onclick="return restoreComponent({{$archive->id}})">Restore</button>

                        </td>

                        <div style="display:hidden">
                            <form action="/course/restore/{{$archive->id}}" method="POST"
                                  id="restore{{$archive->id}}">
                                @csrf
                            </form>
                        </div>
                    </tr>
                @endforeach


                </tbody>
                <tfoot>
                <tr>
                    <th>Course Name</th>
                    <th>Department</th>
                    <th>Date Archived</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
            </table>
        @else
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h4 class="card-title">Oops..</h4>
                    <p class="card-text">There are no archives yet..</p>
                </div>
            </div>

        @endif
    </div>

    @push('scripts')
        <script>

            function restoreComponent(id) {
                Swal.fire({
                    title: 'Are you sure?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, restore it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $("#restore" + id).submit();
                    }
                })
            }

        </script>
    @endpush
@endsection
