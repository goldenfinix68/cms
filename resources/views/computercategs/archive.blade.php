@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Archived Computer Parts Categories</h1>
        <a href="/computercategs"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="container py-3">
        @if($archives->count())
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
                @foreach($archives as $archive)
                    <tr>
                        <td>{{$archive->id}}</td>
                        <td>{{$archive->category_name}}</td>
                        <td>{{\Carbon\Carbon::parse($archive->created_at)->format('M d Y h:i A')}}</td>

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
