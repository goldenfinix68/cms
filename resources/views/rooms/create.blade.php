@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Add room</h1>
        <a href="/rooms"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/rooms/create" method="POST">
                @csrf

                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" class="form-control @error('name') is-invalid @enderror" id="name" aria-describedby="name"
                           placeholder="Enter name" value="{{old('name') ? old('name'):''}}">
                    @error('name')
                    <small id="name" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>


                <div class="form-group">
                    <label for="description">Description</label>
                    <input type="text" name="description" class="form-control @error('description') is-invalid @enderror" id="description" aria-describedby="description"
                           placeholder="Enter description" value="{{old('description') ? old('description'):''}}">
                    @error('description')
                    <small id="description" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>


                <div class="form-group">
                    <label for="type">Room Type</label>
                    <select class="form-control @error('type') is-invalid @enderror" name="type" id="type">
                        <option value="" selected disabled>Please select a room type</option>
                        <option value="Classroom"
                            {{old('type') === 'Classroom' ? 'selected':''}}>Classroom</option>
                        <option value="Laboratory"
                            {{old('type') === 'Laboratory' ? 'selected':''}}>Laboratory</option>
                        <option value="Control Room"
                            {{old('type') === 'Control Room' ? 'selected':''}}>Control Room</option>
                        <option value="Storage Room"
                            {{old('type') === 'Storage Room' ? 'selected':''}}>Storage Room</option>
                    </select>
                    @error('type')
                    <small id="type" class="form-text text-danger">{{$message}}</small>
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
