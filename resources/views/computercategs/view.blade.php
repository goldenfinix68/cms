@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>View Computer Category</h1>
        <a href="/computercategs"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">

            <div class="form-group">
                <label for="category_name">Category Name</label>
                <input type="text" class="form-control" id="name" aria-describedby="category_name" placeholder="Enter Category Name"
                       value="{{$computercateg->category_name}}" readonly>
            </div>


            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#exampleModalLong">
                View PC parts
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document" style="min-width:60%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">PC parts</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th>Brand</th>
                                    <th>Model Number</th>
                                    <th>Category</th>
                                    <th>Room</th>
                                    <th>Computer Number</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($computercateg->computerparts as $computerpart)
                                    <tr>
                                        <th>{{$computerpart->brand}}</th>
                                        <td>{{$computerpart->model_number}}</td>
                                        <td>{{$computerpart->computercateg->category_name}}</td>
                                        <td>{{$computerpart->room->name}}</td>
                                        <td>{{$computerpart->computer->computer_number}}</td>
                                        <td>{{$computerpart->status}}</td>
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




            <div class="d-flex justify-content-center mt-3">
                <a href="/rooms" class="btn btn-info mx-1"> Edit </a>
            </div>
        </div>
    </div>


@endsection
