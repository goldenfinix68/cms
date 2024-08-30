@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Borrow component</h1>
        <a href="/components"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/borrow/store/{{$component->id}}" method="POST">
                @csrf
                <div class="form-group">
                    <label for="name">Component name</label>
                    <input type="text" class="form-control" id="name" aria-describedby="name"
                           value="{{$component->name}}" readonly>

                </div>

                <div class="form-group">
                    <label for="category">Category</label>
                    <input type="text" class="form-control" id="category" aria-describedby="category"
                           value="{{$component->category}}" readonly>

                </div>

                <div class="form-group">
                    <label for="model_number">Model Number</label>
                    <input type="text" class="form-control" id="model_number"
                           aria-describedby="model_number" value="{{$component->model_number}}" readonly>

                </div>

                <div class="form-group">
                    <label for="room">Room Location</label>
                    <input type="text" class="form-control" id="room" aria-describedby="room"
                           value="{{$component->room->name}}" readonly>
                </div>

                <div class="form-group">
                    <label for="borrow_date">Borrow Date</label>
                    <input type="datetime-local" name="borrow_date" class="form-control" id="borrow_date"
                           aria-describedby="borrow_date" value="{{old('borrow_date') ? old('borrow_date'):'' }}">
                    @error('borrow_date')
                    <small id="status" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="return_date">Return Date</label>
                    <input type="datetime-local" name="return_date" class="form-control" id="return_date"
                           aria-describedby="return_date" value="{{old('return_date') ? old('borrow_date'):'' }}">
                    @error('return_date')
                    <small id="status" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="reason">Reason for borrowing</label>
                    <textarea class="form-control" name="reason" id="reason" rows="3">{{old('reason') ? old('reason'):'' }}</textarea>
                    @error('reason')
                    <small id="status" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>



                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-info mx-1">Submit</button>
                    <a href="/components" class="btn btn-outline-danger mx-1"> Cancel </a>

                </div>
            </form>
        </div>
    </div>
@endsection
