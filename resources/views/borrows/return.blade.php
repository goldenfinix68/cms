@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Edit borrowed component</h1>
        <a href="/borrowlogs"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/borrow/returnupdate/{{$borrow->id}}" method="POST">
                @csrf
                @method('PUT')
                <div class="form-group">
                    <label for="name">Component name</label>
                    <input type="text" class="form-control" id="name" aria-describedby="name"
                           value="{{$borrow->component->name}}" readonly>

                </div>

                <div class="form-group">
                    <label for="category">Category</label>
                    <input type="text" class="form-control" id="category" aria-describedby="category"
                           value="{{$borrow->component->category}}" readonly>

                </div>

                <div class="form-group">
                    <label for="model_number">Model Number</label>
                    <input type="text" class="form-control" id="model_number"
                           aria-describedby="model_number" value="{{$borrow->component->model_number}}" readonly>

                </div>

                <div class="form-group">
                    <label for="room">Room Location</label>
                    <input type="text" class="form-control" id="room" aria-describedby="room"
                           value="{{$borrow->component->room->name}}" readonly>
                </div>

                <div class="form-group">
                    <label for="borrow_date">Borrow Date</label>
                    <input type="datetime-local" name="borrow_date" class="form-control" id="borrow_date"
                           aria-describedby="borrow_date" value="{{old('borrow_date') ? old('borrow_date'):$borrow->return_date }}" readonly>
                    @error('borrow_date')
                    <small id="status" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="return_date">Return Date</label>
                    <input type="datetime-local" name="return_date" class="form-control" id="return_date"
                           aria-describedby="return_date" value="{{old('return_date') ? old('return_date'):$borrow->return_date }}" readonly>
                    @error('return_date')
                    <small id="status" class="form-text text-danger" readonly">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="reason">Reason for borrowing</label>
                    <textarea class="form-control" name="reason" id="reason" rows="3" readonly>{{old('reason') ? old('reason'):$borrow->reason }}</textarea>
                    @error('reason')
                    <small id="status" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                @if(Auth::user()->account_type == 'admin')
                    <div class="form-group">
                        <label for="returncondition">Return Condition</label>
                        <select class="form-control @error('returncondition') is-invalid @enderror" name="returncondition" id="returncondition">
                            <option value="" selected disabled>Please select a Condition</option>
                                <option value="Good"
                                {{old('returncondition') === 'Good' || $borrow->returncondition == 'Good' ? 'selected':''}}>In Good Condition</option>
                            <option value="Damaged"
                                {{old('returncondition') === 'Damaged' || $borrow->returncondition == 'Damaged' ? 'selected':''}}>Damaged</option>
                            <option value="Replaced"
                                    {{old('returncondition') === 'Replaced' || $borrow->returncondition == 'Replaced' ? 'selected':''}}>Replaced</option>
                        </select>
                        @error('returncondition')
                        <small id="status" class="form-text text-danger">{{$message}}</small>
                        @enderror
                    </div>
                @endif



                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-info mx-1">Submit</button>
                    <a href="/borrowlogs" class="btn btn-outline-danger mx-1"> Cancel </a>

                </div>
            </form>
        </div>
    </div>
@endsection
