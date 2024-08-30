@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>View report</h1>
        <a href="/computerpartsreports"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">

            <div class="form-group">
                <label for="brand">Brand</label>
                <input type="text" class="form-control" id="brand" aria-describedby="brand"
                       value="{{$report->computerpartArchive->brand}}" readonly>
            </div>
            <div class="form-group">
                <label for="model_number">Model Number</label>
                <input type="text" class="form-control" id="model_number" aria-describedby="model_number"
                       value="{{$report->computerpartArchive->model_number}}" readonly>
            </div>

            <div class="form-group">
                <label for="category">Category</label>
                <input type="text" class="form-control" id="category" aria-describedby="category"
                       value="{{$report->computerpartArchive->computercateg->category_name}}" readonly>
            </div>

            <div class="form-group">
                <label for="room">Room Location</label>
                <input type="text" class="form-control" id="room" aria-describedby="room"
                       value="{{$report->computerpartArchive->room->name}}" readonly>
            </div>

            <div class="form-group">
                <label for="computer">PC Number</label>
                <input type="text" class="form-control" id="computer" aria-describedby="computer"
                       value="{{$report->computerpartArchive->computer->computer_number}}" readonly>
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

                <a href='/computerpartsreports/edit/{{$report->id}}' class="btn btn-info mx-1">Edit</a>

                <!-- Button trigger modal -->


                <a href='/computerpartsreports' class="btn btn-warning mx-1">Back</a>

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
                                        <th scope="col">Computer Part Brand</th>
                                        <th scope="col">Model Number</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Room</th>
                                        <th scope="col">PC Number</th>
                                        <th scope="col">Issue</th>
                                        <th scope="col">Fix</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($report->transactions as $transaction)
                                        <tr>
                                            <td>{{$transaction->computerpartArchive->brand}}</td>
                                            <td>{{$transaction->computerpartArchive->model_number}}</td>
                                            <td>{{$transaction->computerpartArchive->computercateg->category_name}}</td>
                                            <td>{{$transaction->computerpartArchive->room->name}}</td>
                                            <td>{{$transaction->computerpartArchive->computer->computer_number}}</td>
                                            <td>{{$transaction->issue}}</td>
                                            <td>{{$transaction->fix}}</td>
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
