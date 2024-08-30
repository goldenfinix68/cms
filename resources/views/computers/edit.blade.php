@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Edit Computer</h1>
        <a href="/computers"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">

        <div style="width: 50%">

            <form action="/computers/update/{{$computer->id}}" method="POST">
                @csrf
                @method('PUT')
                <div class="form-group">
                    <label for="computer_number">Computer Number</label>
                    <input type="text" name="computer_number" class="form-control @error('computer_number') is-invalid @enderror" id="computer_number" aria-describedby="computer_number"
                           placeholder="Enter Computer Number" value="{{old('computer_number') ? old('computer_number'):$computer->computer_number}}">
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
                                <option value="{{$room->id}}" {{old('room') === $room->id || $computer->room->id === $room->id ? 'selected':''}}>{{$room->name}}
                                </option>
                            @endforeach
                        </select>
                    @else
                        <div class="alert alert-info">
                            <strong>Heads up!</strong> There are no available rooms yet. Please click <a href="/rooms/create" class="alert-link">here</a> to create one!
                        </div>

                    @endif
                    @error('room')
                    <small id="room" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" name="status" class="custom-control-input" id="customCheck1" {{$computer->status ? 'checked':''}}>
                        <label class="custom-control-label" for="customCheck1"><h6>Active</h6></label>
                    </div>
                </div>

                <div class="d-flex justify-content-center mt-3">
                    <button class="btn btn-info mx-1" type="submit"> Submit </button>
                    <a href="/computers" class="btn btn-outline-danger mx-1"> Cancel </a>
                </div>
            </form>
        </div>

    </div>


@endsection
