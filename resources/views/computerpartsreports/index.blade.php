@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Computer Parts Report list</h1>
        <div class="mt-2">
            <button class="btn btn-secondary" data-toggle="modal" data-target="#exportModal"> <strong>EXPORT
                    REPORTS</strong></button>
        </div>
    </div>
    <form action="/exports/computerpartsreports" method="POST">
        @csrf
        <div class="modal fade" id="exportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Export Reports</h5>
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
        @if($reports->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Image</th>
                    <th>Brand</th>
                    <th>Category</th>
                    <th>Model</th>
                    <th>Room Location</th>
                    <th>PC Number</th>
                    <th>Issue Description</th>
                    <th>Fix</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($reports->reverse() as $report)

                    <tr>

                        <td><img src="{{ asset('uploads/components/' . $report->computerpartArchive->image) }}" class="img-fluid"
                                 width="100px;" height="100px;" alt="{{$report->computerpartArchive->brand}}"></td>
                        <td>{{$report->computerpartArchive->brand}}</td>
                        <td>{{$report->computerpartArchive->computercateg->category_name}}</td>
                        <td>{{$report->computerpartArchive->model_number}}</td>
                        <td>{{$report->computerpartArchive->room->name}}</td>
                        <td>{{$report->computerpartArchive->computerArchive->computer_number}}</td>
                        <td>{{$report->issue}}</td>
                        <td>{{$report->fix}}</td>
                        <td>
                            <a href="/computerpartsreports/{{$report->id}}" class="btn btn-sm btn-block btn-info"> View </a>
                            <a href="/computerpartsreports/edit/{{$report->id}}" class="btn btn-sm btn-block btn-success"> Edit </a>
                            <a href="/computerpartsreports/fix/{{$report->id}}" class="btn btn-sm btn-block btn-warning">Fix</a>
                            <button class="btn btn-sm btn-block btn-danger" onclick="return deleteReport({{$report->id}})">Archive</button>
                            <!-- <button class="btn btn-sm btn-block btn-warning">History</button> -->
                        </td>

                        <div style="display:hidden">
                            <form action="/computerpartsreports/delete/{{$report->id}}" method="POST" id="delete{{$report->id}}">
                                @csrf
                                @method('DELETE')
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
                    <th>Model</th>
                    <th>Room Location</th>
                    <th>PC Number</th>
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
                    <p class="card-text">There are no reports submitted yet..</p>
                </div>
            </div>
        @endif
    </div>

    @push('scripts')
        <script>
            @if(Session::get('report_created'))
            Swal.fire(
                'Success!',
                'You submitted a report',
                'success'
            )
            @endif

            @if(Session::get('report_updated'))
            Swal.fire(
                'Success!',
                'You updated a report',
                'success'
            )
            @endif

            @if(Session::get('report_deleted'))
            Swal.fire(
                'Success!',
                'You deleted a report',
                'success'
            )
            @endif

            @if(Session::get('report_restored'))
            Swal.fire(
                'Success!',
                'You restored a report',
                'success'
            )
            @endif

            @if(Session::get('no_reports'))
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

            function deleteReport(id) {
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
