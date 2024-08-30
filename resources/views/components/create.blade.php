@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Add component</h1>
        <a href="/components"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/components/create" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" class="form-control @error('name') is-invalid @enderror" id="name"
                           aria-describedby="name" placeholder="Enter name"
                           value="{{old('name') ? old('name'):''}}">
                    @error('name')
                    <small id="name" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <input type="text" name="description" class="form-control @error('description') is-invalid @enderror" id="description"
                           aria-describedby="description" placeholder="Enter description"
                           value="{{old('description') ? old('description'):''}}">
                    @error('description')
                    <small id="description" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="category">Category</label>
                    <select class="form-control @error('category') is-invalid @enderror" name="category" id="category">
                        <option value="" selected disabled>Please select a category</option>
                        <option value="Processing Device"
                            {{old('category') === 'Processing Device' ? 'selected':''}}>Processing Device</option>
                        <option value="Memory Devices"
                            {{old('category') === 'Memory Devices' ? 'selected':''}}>Memory Devices</option>
                        <option value="I/O Devices"
                            {{old('category') === 'I/O Devices' ? 'selected':''}}>I/O Devices</option>
                        <option value="Storage Devices"
                            {{old('category') === 'Storage Devices' ? 'selected':''}}>Storage Devices</option>
                    </select>
                    @error('category')
                    <small id="category" class="form-text text-danger">{{$message}}</small>
                    @enderror

                    <div class="px-5 mt-2">
                        <label for="others">Others</label>
                        <input type="text" name="others" class="form-control" id="others" aria-describedby="others"
                               placeholder="Others please specify...">

                    </div>
                </div>

                <div class="form-group">
                    <label for="model_number">Model Number</label>
                    <input type="text" name="model_number" class="form-control @error('model_number') is-invalid @enderror" id="model_number"
                           aria-describedby="model_number" placeholder="Enter model number"
                           value="{{old('model_number') ? old('model_number'):''}}">
                    @error('model_number')
                    <small id="model_number" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="image">Component Image</label>
                    <br>
                    <small class="text-muted">Maximum image size is 10 MB and accepted file types are jpg, jpeg, png</small>
                    <input type="file" class="form-control @error('image') is-invalid @enderror" name='image' id="image" aria-describedby="fileHelp">
                    @error('image')
                    <small id="image" class="form-text text-danger">{{$message}}</small>
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

                <div class="form-group">
                    <label for="status">Status</label>
                    <select class="form-control @error('status') is-invalid @enderror" name="status" id="status">
                        <option value="" selected disabled>Please select a status</option>
                        <option value="AVAILABLE"
                            {{old('status') === 'AVAILABLE' ? 'selected':''}}>AVAILABLE</option>
                        <option value="UNAVAILABLE"
                            {{old('status') === 'UNAVAILABLE' ? 'selected':''}}>UNAVAILABLE</option>
                        <option value="BORROWED"
                            {{old('status') === 'BORROWED' ? 'selected':''}}>BORROWED</option>
                    </select>
                    @error('status')
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
