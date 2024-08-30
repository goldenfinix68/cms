@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Edit report</h1>
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

            <form action="/computerpartsreports/update/{{$report->id}}" method="POST" id='editReport'>
                @csrf
                @method('PUT')
                <div class="form-group">
                    <label for="issue">Issue Description</label>
                    <textarea class="form-control" id="issue" name='issue' rows="3">{{old('issue') ? old('issue'):$report->issue}}</textarea>
                </div>
            </form>


            <div class="d-flex justify-content-center">

                <button onclick="document.getElementById('editReport').submit();" class="btn btn-info mx-1">Submit</button>

                <a href='/reports' class="btn btn-outline-danger mx-1">Cancel</a>
            </div>




        </div>
    </div>
@endsection
