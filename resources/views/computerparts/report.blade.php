@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Create report</h1>
        <a href="/computerparts"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/reports/creates/{{$computerpart->id}}" method="POST">
                @csrf
                <div class="form-group">
                    <label for="brand">Brand</label>
                    <input type="text" class="form-control" id="brand" aria-describedby="brand"
                           value="{{$computerpart->brand}}" readonly>
                </div>

                <div class="form-group">
                    <label for="model_number">Model Number</label>
                    <input type="text" class="form-control" id="model_number" aria-describedby="model_number"
                           value="{{$computerpart->model_number}}" readonly>
                    <!-- <small id="category" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                </div>

                <div class="form-group">
                    <label for="computercateg_id">Category</label>
                    <input type="text" class="form-control" id=computercateg_id"
                           aria-describedby="computercateg_id" value="{{$computerpart->computercateg->category_name}}" readonly>
                    <!-- <small id="model_number" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                </div>

                <div class="form-group">
                    <label for="room">Room Location</label>
                    <input type="text" class="form-control" id="room" aria-describedby="room"
                           value="{{$computerpart->room->name}}" readonly>
                    <!-- <small id="room" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                </div>

                <div class="form-group">
                    <label for="computer_id">PC Number</label>
                    <input type="text" class="form-control" id="computer_id" aria-describedby="computer_id"
                           value="{{$computerpart->computer->computer_number}}" readonly>
                    <!-- <small id="room" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                </div>

                <div class="form-group">
                    <label for="status">Status</label>
                    <input type="text" class="form-control" id="status" aria-describedby="status"
                           value="{{$computerpart->status}}" readonly>
                    <!-- <small id="room" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                </div>

                <div class="form-group">
                    <label for="issue">Issue Description</label>
                    <textarea class="form-control" id="issue" name='issue' rows="3"></textarea>
                </div>


                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-info mx-1">Submit</button>
                    <a href="/computerparts" class="btn btn-outline-danger mx-1"> Cancel </a>

                </div>
            </form>
        </div>
    </div>
@endsection
