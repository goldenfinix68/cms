@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Archived reports</h1>
        <a href="/computerpartsreports"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="container-fluid content py-5">
        @if($archives->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Image</th>
                    <th>Brand</th>
                    <th>Category</th>
                    <th>Model Number</th>
                    <th>Room Location</th>
                    <th>Performed by</th>
                    <th>Date Archived</th>
                    <th>Issue Description</th>
                    <th>Fix</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($archives->reverse() as $archive)
                    <tr>

                        <td><img src="{{ asset('uploads/components/' . $archive->computerpartArchive->image) }}" class="img-fluid" width="100px;"
                                 height="100px;" alt="{{$archive->computerpartArchive->brand}}"></td>
                        <td>{{$archive->computerpartArchive->brand}}</td>
                        <td>{{$archive->computerpartArchive->computercateg->category_name}}</td>
                        <td>{{$archive->computerpartArchive->model_number}}</td>
                        <td>{{$archive->computerpartArchive->room->name}}</td>
                        <td>{{$archive->submitted_by}}</td>
                        <td>{{\Carbon\Carbon::parse($archive->created_at)->format('M d Y h:i A')}}</td>
                        <td>{{$archive->issue}}</td>
                        <td>{{$archive->fix}}</td>

                        <td>
                            <button class="btn btn-block btn-info" onclick="return restoreReport({{$archive->id}})">Restore</button>

                        </td>

                        <div style="display:hidden">
                            <form action="/computerpartsreports/restore/{{$archive->id}}" method="POST"
                                  id="restore{{$archive->id}}">
                                @csrf
                            </form>
                        </div>
                    </tr>
                @endforeach

                </tbody>
                <tfoot>
                <tr>
                    <th>Image</th>
                    <th>Brand</th>
                    <th>Category</th>
                    <th>Model Number</th>
                    <th>Room Location</th>
                    <th>Performed by</th>
                    <th>Date Archived</th>
                    <th>Issue Description</th>
                    <th>Fix</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
            </table>
        @else
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h4 class="card-title">Oops..</h4>
                    <p class="card-text">There are no archived reports yet..</p>
                </div>
            </div>
        @endif
    </div>

    @push('scripts')
        <script>

            function restoreReport(id) {
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
