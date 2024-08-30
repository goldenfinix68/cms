@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>View report</h1>
        <a href="/reports"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">

            <div class="form-group">
                <label for="name">Component name</label>
                <input type="text" class="form-control" id="name" aria-describedby="name"
                       value="{{$report->componentArchive->name}}" readonly>
            </div>


            <div class="form-group">
                <label for="category">Category</label>
                <input type="text" class="form-control" id="category" aria-describedby="category"
                       value="{{$report->componentArchive->category}}" readonly>
            </div>

            <div class="form-group">
                <label for="model_number">Model Number</label>
                <input type="text" class="form-control" id="model_number" aria-describedby="model_number"
                       value="{{$report->componentArchive->model_number}}" readonly>
            </div>

            <div class="form-group">
                <label for="room">Room Location</label>
                <input type="text" class="form-control" id="room" aria-describedby="room"
                       value="{{$report->componentArchive->room->name}}" readonly>
            </div>

            <div class="form-group">
                <label for="submitted_by">Submitted by</label>
                <input type="text" class="form-control" id="submitted_by" aria-describedby="submitted_by"
                       value="{{$report->submitted_by}}" readonly>
            </div>

            <div class="form-group">
                <label for="submitted_at">Submitted at</label>
                <input type="text" class="form-control" id="submitted_at" aria-describedby="submitted_at"
                       value="{{\Carbon\Carbon::parse($report->created_at)->format('M d Y h:i A')}}" readonly>
            </div>

            <div class="form-group">
                <label for="issue">Issue Description</label>
                <textarea class="form-control" id="issue" name='issue' rows="3" readonly>{{$report->issue}}</textarea>
            </div>

            <div class="container my-3">
                <button type="button" class="btn btn-success btn-block" data-toggle="modal" data-target="#exampleModal">
                    View Report History
                </button>
            </div>



            <div class="d-flex justify-content-center">

                <a href='/reports/edit/{{$report->id}}' class="btn btn-info mx-1">Edit</a>

                <!-- Button trigger modal -->


                <a href='/reports' class="btn btn-warning mx-1">Back</a>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" style="min-width: 80%">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Report History</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                    <tr>
                                        <th scope="col">Component Name</th>
                                        <th scope="col">Issue</th>
                                        <th scope="col">Fix</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Model Number</th>
                                        <th scope="col">Location</th>
                                        <th scope="col">Performed by</th>
                                        <th scope="col">Date Executed</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($report->transactions as $transaction)
                                        <tr>
                                            <td>{{$transaction->componentArchive->name}}</td>
                                            <td>{{$transaction->issue}}</td>
                                            <td>{{$transaction->fix}}</td>
                                            <td>{{$transaction->componentArchive->category}}</td>
                                            <td>{{$transaction->componentArchive->model_number}}</td>
                                            <td>{{$transaction->componentArchive->room->name}}</td>
                                            <td>{{$transaction->submitted_by}}</td>
                                            <td>{{\Carbon\Carbon::parse($transaction->created_at)->format('M d Y h:i A')}}</td>
                                            <td>{{$transaction->action}}</td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




        </div>
    </div>
@endsection
