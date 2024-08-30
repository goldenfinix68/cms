@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Create report</h1>
        <a href="/components"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/reports/create/{{$component->id}}" method="POST">
                @csrf
                <div class="form-group">
                    <label for="name">Component name</label>
                    <input type="text" class="form-control" id="name" aria-describedby="name"
                           value="{{$component->name}}" readonly>
                    <!-- <small id="name" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                </div>

                <div class="form-group">
                    <label for="category">Category</label>
                    <input type="text" class="form-control" id="category" aria-describedby="category"
                           value="{{$component->category}}" readonly>
                    <!-- <small id="category" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                </div>

                <div class="form-group">
                    <label for="model_number">Model Number</label>
                    <input type="text" class="form-control" id="model_number"
                           aria-describedby="model_number" value="{{$component->model_number}}" readonly>
                    <!-- <small id="model_number" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                </div>

                <div class="form-group">
                    <label for="room">Room Location</label>
                    <input type="text" class="form-control" id="room" aria-describedby="room"
                           value="{{$component->room->name}}" readonly>
                    <!-- <small id="room" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                </div>

                <div class="form-group">
                    <label for="issue">Issue Description</label>
                    <textarea class="form-control" id="issue" name='issue' rows="3"></textarea>
                </div>


                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-info mx-1">Submit</button>
                    <a href="/components" class="btn btn-outline-danger mx-1"> Cancel </a>

                </div>
            </form>
        </div>
    </div>
@endsection
