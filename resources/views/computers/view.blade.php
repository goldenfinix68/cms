@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>View Computer</h1>
        <a href="/computers"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">

            <div class="form-group">
                <label for="computer_number">Computer Number</label>
                <input type="text" class="form-control" id="name" aria-describedby="computer_number" placeholder="Enter Computer Number"
                       value="{{$computer->computer_number}}" readonly>
            </div>

            <div class="form-group">
                <label for="room_id">Room</label>
                <input type="text" class="form-control " id="room_id" aria-describedby="room_id"
                       value="{{$computer->room->name}}" readonly>
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
                                @foreach($computer->computerparts as $computerpart)
                                    <tr>
                                        <th>{{$computerpart->brand}}</th>
                                        <td>{{$computerpart->model_number}}</td>
                                        <td>{{$computerpart->computercategArchive->category_name}}</td>
                                        <td>{{$computerpart->room->name}}</td>
                                        <td>{{$computerpart->computer->computer_number}}</td>
                                        @if($computerpart->status == 'Active')
                                            <td bgcolor= "green">{{$computerpart->status}}</td>
                                        @else
                                            <td bgcolor= "red">{{$computerpart->status}}</td>
                                        @endif

)
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


@endsection
