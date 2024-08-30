@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Edit report</h1>
        <a href="/reports"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">

            <div class="form-group">
                <label for="name">Computer</label>
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
            <form action="/reports/update/{{$report->id}}" method="POST" id='editReport'>
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
