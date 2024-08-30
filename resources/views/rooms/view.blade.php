@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>View room</h1>
        <a href="/rooms"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" aria-describedby="name" placeholder="Enter name"
                       value="{{$room->name}}" readonly>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <input type="text" class="form-control " id="description" aria-describedby="description"
                       value="{{$room->description}}" readonly>
            </div>

            <div class="form-group">
                <label for="room_type">Room Type</label>
                <input type="text" class="form-control" id="room_type" aria-describedby="room_type"
                       placeholder="Enter room_type" value="{{$room->type}}" readonly>
            </div>

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#exampleModalLong">
                View components
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document" style="min-width:60%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Components</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Component Name</th>
                                    <th>Model Number</th>
                                    <th>Category</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($room->components as $component)
                                    <tr>
                                        <th>{{$component->id}}</th>
                                        <td>{{$component->name}}</td>
                                        <td>{{$component->model_number}}</td>
                                        <td>{{$component->category}}</td>
                                        <td>{{$component->status}}</td>
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
