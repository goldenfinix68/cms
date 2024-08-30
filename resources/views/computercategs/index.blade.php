@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Category List</h1>
        <a href="/create/computercategs"> <button class="btn btn-primary mt-2"> <strong>ADD Computer Part Category</strong></button> </a>
    </div>

    <div class="container py-3">
        @if($computercategs->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Category Name</th>
                    <th>Date Created</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($computercategs as $computercateg)
                    <tr>
                        <td>{{$computercateg->id}}</td>
                        <td>{{$computercateg->category_name}}</td>
                        <td>{{\Carbon\Carbon::parse($computercateg->created_at)->format('M d Y h:i A')}}</td>
                        <td>
                            <a href="/computercategs/{{$computercateg->id}}" class="btn btn-sm  btn-info"> View PC Part List </a>
                           
                            <a class="btn btn-sm  btn-danger"
                               onclick="return deleteComputercategory({{$computercateg->id}})">Delete</a>
                        </td>
                        <div style="display:hidden">
                            <form action="/computercategs/delete/{{$computercateg->id}}" method="POST" id="delete{{$computercateg->id}}">
                                @csrf
                                @method('DELETE')
                            </form>
                        </div>
                    </tr>
                @endforeach


                </tbody>
                <tfoot>
                <tr>
                    <th>ID</th>
                    <th>Category Name</th>
                    <th>Date Created</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
            </table>
        @else
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h4 class="card-title">Oops..</h4>
                    <p class="card-text">There are no categories yet. Go and create one!</p>
                </div>
            </div>
        @endif
    </div>

    @push('scripts')
        <script>
            @if(Session::get('computercateg_created'))
            Swal.fire(
                'Success!',
                'You created a computer category!',
                'success'
            )
            @endif

            @if(Session::get('computercateg_updated'))
            Swal.fire(
                'Success!',
                'You updated a computer category' +
                '!',
                'success'
            )
            @endif

            @if(Session::get('computercateg_deleted'))
            Swal.fire(
                'Deleted!',
                'Computer Category has been deleted',
                'success'
            )
            @endif

            function deleteComputercategory(id) {
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
