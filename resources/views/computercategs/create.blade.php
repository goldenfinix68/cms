@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Add Computer Part Category</h1>
        <a href="/computercategs"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/computercategs/create" method="POST">
                @csrf

                <div class="form-group">
                    <label for="category_name">Category Name</label>
                    <input type="text" name="category_name" class="form-control @error('category_name') is-invalid @enderror" id="category_name" aria-describedby="category_name"
                           placeholder="Enter Computer Category Name" value="{{old('category_name') ? old('category_name'):''}}">
                    @error('category_name')
                    <small id="name" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-info mx-1">Submit</button>
                    <a href="/rooms" class="btn btn-outline-danger mx-1"> Cancel </a>

                </div>
            </form>
        </div>
    </div>


@endsection
