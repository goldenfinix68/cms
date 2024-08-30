@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Add Computer</h1>
        <a href="/computers"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/computers/create" method="POST">
                @csrf

                <div class="form-group">
                    <label for="computer_number">Computer Number</label>
                    <input type="text" name="computer_number" class="form-control @error('computer_number') is-invalid @enderror" id="computer_number" aria-describedby="computer_number"
                           placeholder="Enter Computer Number" value="{{old('computer_number') ? old('computer_number'):''}}">
                    @error('computer_number')
                    <small id="computer_number" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="room">Room Location</label>
                    @if($rooms->count())
                        <select class="form-control @error('room') is-invalid @enderror" name="room" id="room">
                            <option value="" selected disabled>Please select a room</option>
                            @foreach($rooms as $room)
                                <option value="{{$room->id}}" {{old('room') === $room->id ? 'selected':''}}>{{$room->name}}
                                </option>
                            @endforeach
                        </select>
                    @else
                        <div class="alert alert-info">
                            <strong>Heads up!</strong> There are no available rooms yet. Please click <a href="/create/room" class="alert-link">here</a> to create one!
                        </div>

                    @endif
                    @error('room')
                    <small id="room" class="form-text text-danger">{{$message}}</small>
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
