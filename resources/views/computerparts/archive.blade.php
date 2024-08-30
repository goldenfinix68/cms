@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Archived Computer Parts</h1>
        <a href="/computerparts"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="container-fluid content py-5">
        @if($archives->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Image</th>
                    <th>Brand</th>
                    <th>Model Number</th>
                    <th>Category</th>
                    <th>Room</th>
                    <th>PC Number</th>
                    <th>Date Executed</th>
                </tr>
                </thead>
                <tbody>
                @foreach($archives->reverse() as $archive)
                    <tr>
                        <td><img src="{{ asset('uploads/components/' . $archive->image) }}" class="img-fluid" width="100px;" height="100px;" alt="{{$archive->name}}"></td>
                        <td>{{$archive->brand}}</td>
                        <td>{{$archive->model_number}}</td>
                        <td>{{$archive->computercateg->category_name}}</td>
                        <td>{{$archive->room->name}}</td>
                        <td>{{$archive->computerArchive->computer_number}}</td>
                        <td>{{\Carbon\Carbon::parse($archive->created_at)->format('M d Y h:i A')}}</td>

                    </tr>
                @endforeach


                </tbody>
                <tfoot>
                <tr>
                    <th>Image</th>
                    <th>Brand</th>
                    <th>Model Number</th>
                    <th>Category</th>
                    <th>Room</th>
                    <th>PC Number</th>
                    <th>Date Executed</th>
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

            function  restoreComputerpart(id) {
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
