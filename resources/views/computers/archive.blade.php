@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Archived Computers</h1>
        <a href="/computers"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="container py-3">
        @if($archives->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>PC number</th>
                    <th>Room</th>
                    <th>Serial Number</th>
                    <th>Computer Specifications</th>
                    <th>Date Created</th>
                </tr>
                </thead>
                <tbody>
                @foreach($archives->reverse() as $archive)
                    <tr>
                        <td>{{$archive->computer_number}}</td>
                        <td>{{$archive->room->name}}</td>
                        <td>{{$archive->serial_number}}</td>
                        <td>{{$archive->computer_specification}}</td>
                        <td>{{\Carbon\Carbon::parse($archive->created_at)->format('M d Y h:i A')}}</td>



                    </tr>
                @endforeach


                </tbody>
                <tfoot>
                <tr>
                    <th>Name</th>
                    <th>Room</th>
                    <th>Serial Number</th>
                    <th>Computer Specifications</th>
                    <th>Date Created</th>
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

            function  restoreComputer(id) {
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
