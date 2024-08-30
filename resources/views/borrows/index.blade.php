@extends('layouts.app')

@section('content')
<div class="d-flex justify-content-between">
    <h1>Borrow logs</h1>
    @if(Auth::user()->account_type == 'admin' || Auth::user()->account_type == 'working student' )
    <div class="mt-2">
        <a href="/borrow/notify"> <button class="btn btn-primary"> <strong>NOTIFY BORROWERS</strong></button> </a>
        <button class="btn btn-secondary" data-toggle="modal" data-target="#exportModal"> <strong>EXPORT
                COMPONENTS</strong></button>
    </div>
    @endif
</div>

<form action="/exports/borrows" method="POST">
    @csrf
    <div class="modal fade" id="exportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Export Borrow   Logs</h5>
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

<div class="container py-3">
    @if($logs->count())
        <table id="example" class="table table-striped table-bordered" style="width:100%">
            <thead>
                <tr>
                    <th>Component Name</th>
                    <th>Image</th>
                    <th>Model</th>
                    <th>Category</th>
                    <th>Borrower Name</th>
                    <th>Borrower Type</th>
                    <th>Reason</th>
                    <th>Date Borrowed</th>
                    <th>Return Date</th>
                    <th>Return Status</th>
                    <th>Return Condition</th>
                    <th>Status</th>
                    @if(Auth::user()->account_type == 'admin' || Auth::user()->account_type == 'working student')
                    <th>Actions</th>
                    @endif
                </tr>
            </thead>
            <tbody>
                @foreach($logs->reverse() as $log)
                <tr>
                    <td>{{$log->component->name}}</td>
                    <td><img src="{{ asset('uploads/components/' . $log->component->image) }}" class="img-fluid" width="100px;"
                        height="100px;" alt="{{$log->component->name}}"></td>
                    <td>{{$log->component->model_number}}</td>
                    <td>{{$log->component->category}}</td>
                    <td><a href="/users/edit/{{$log->user->id}}"> {{$log->borrower_name}} </a></td>
                    <td>{{$log->borrower_type}}</td>
                    <td>{{$log->reason}}</td>
                    <td>{{\Carbon\Carbon::parse($log->borrow_date)->format('M d Y h:i A')}}</td>
                    <td>{{\Carbon\Carbon::parse($log->return_date)->format('M d Y h:i A')}}</td>
                    <td>{{$log->returnstatus}}</td>
                    <td>{{$log->returncondition}}</td>
                    <td>
                        @if($log->status == 'APPROVED')
                            <span class="badge badge-info">APPROVED</span>
                        @elseif($log->status == 'PENDING')
                            <span class="badge badge-warning">PENDING</span>
                        @elseif($log->status == 'DENIED')
                            <span class="badge badge-danger">DENIED</span>
                        @elseif($log->status == 'RETURNED')
                            <span class="badge badge-success">RETURNED</span>
                        @endif
                    </td>
                    @if(Auth::user()->account_type == 'admin' || Auth::user()->account_type == 'working student')
                    <td>
                        <a href="/borrows/edit/{{$log->id}}" class="btn btn-sm btn-block  btn-success"> Edit </a>
                        <a href="/borrows/return/{{$log->id}}" class="btn btn-sm btn-block  btn-info"> Return </a>
                    </td>
                    @endif
                </tr>
                @endforeach


            </tbody>
            <tfoot>
                <tr>
                    <th>Component Name</th>
                    <th>Image</th>
                    <th>Model</th>
                    <th>Category</th>
                    <th>Borrower Name</th>
                    <th>Borrower Type</th>
                    <th>Reason</th>
                    <th>Date Borrowed</th>
                    <th>Return Date</th>
                    <th>Return Status</th>
                    <th>Return Condition</th>
                    <th>Status</th>
                    @if(Auth::user()->account_type == 'admin' || Auth::user()->account_type == 'working student')
                    <th>Actions</th>
                    @endif
                </tr>
            </tfoot>
        </table>
    @else
        <div class="card text-white bg-info mb-3">
            <div class="card-body">
                <h4 class="card-title">Oops..</h4>
                <p class="card-text">There are no borrow logs yet. Click <a href="/components" class="text-light">here</a> to borrow components. </p>
            </div>
        </div>
    @endif
</div>

@push('scripts')
<script>
    @if(Session::get('borrow_updated'))
    Swal.fire(
        'Success!',
        'You updated a borrow log!',
        'success'
    )
    @endif

    @if(Session::get('borrowers_notified'))
    Swal.fire(
        'Success!',
        'You have notified the borrowers!',
        'success'
    )
    @endif

    @if(Session::get('no_borrows'))
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

</script>
@endpush
@endsection
