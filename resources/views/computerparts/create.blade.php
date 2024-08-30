@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-around">
        <h1>Add Computer Parts</h1>
        <a href="/computerparts"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="d-flex justify-content-center py-3">
        <div style="width: 50%">
            <form action="/computerparts/create" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="brand">Brand</label>
                    <input type="text" name="brand" class="form-control @error('brand') is-invalid @enderror" id="brand"
                           aria-describedby="brand" placeholder="Enter brand"
                           value="{{old('brand') ? old('brand'):''}}">
                    @error('brand')
                    <small id="brand" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="model_number">Model Number</label>
                    <input type="text" name="model_number" class="form-control @error('model_number') is-invalid @enderror" id="model_number"
                           aria-describedby="model_number" placeholder="Enter Model Number"
                           value="{{old('model_number') ? old('model_number'):''}}">
                    @error('model_number')
                    <small id="model_number" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="room_id">Room Location</label>
                    @if($rooms->count())
                        <select class="rooms form-control" name="room_id" id="room_id" class="form-control ">
                            <option value="" selected disabled>Please select a room</option>
                            @foreach($rooms as $room)
                                <option href="{{url('not-taken-categories/'.$room->id)}}" value="{{$room->id}}" {{old('room_id') === $room->id ? 'selected':''}}>{{$room->name}}
                                </option>
                            @endforeach
                        </select>

                    @else
                        <div class="alert alert-info">
                            <strong>Heads up!</strong> There are no available rooms yet. Please click <a href="/create/room" class="alert-link">here</a> to create one!
                        </div>

                    @endif
                    @error('room_id')
                    <small id="room_id" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>


                <div class="form-group">
                    <label for="computer_id">PC Number</label>
                    @if($computers->count())
                        <select class="computers form-control"  name="computer_id" id="computer_id">
                            <option value="" disabled="true" selected="true">Please select a PC number</option>
                            @foreach($computers as $computer)
                            <option value="{{$computer->id}}">{{$computer->computer_number}}</option>
                            @endforeach
                        </select>
                    @else
                        <div class="alert alert-info">
                            <strong>Heads up!</strong> There are no available Computers yet. Please click <a href="/create/computer" class="alert-link">here</a> to create one!
                        </div>

                    @endif
                    @error('computer_id')
                    <small id="computer_id" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="computercateg_id">Category</label>
                    <div id="showCategories">
                        @if($computercategs->count())
                            <select  class="form-control @error('computercateg_id') is-invalid @enderror" name="computercateg_id" id="computercateg_id">
                                <option value="" selected disabled>Please select a category</option>
                                @foreach($computercategs as $computercateg)
                            <option value="{{$computercateg->id}}">{{$computercateg->category_name }}</option>
                            @endforeach
                            </select>
                        @else
                            <div class="alert alert-info">
                                <strong>Heads up!</strong> There are no available categories yet. Please click <a href="/create/computercategories" class="alert-link">here</a> to create one!
                            </div>

                        @endif
                    </div>
                    @error('computercateg_id')
                    <small id="computercateg_id" class="form-text text-danger">{{$message}}</small>
                    @enderror
                </div>


                <div class="form-group">
                    <label for="status">Status</label>
                    <select class="form-control @error('status') is-invalid @enderror" name="status" id="status">
                        <option value="" selected disabled>Please select a status</option>
                        <option value="Active"
                            {{old('status') === 'Active' ? 'selected':''}}>Active</option>
                        <option value="UNAVAILABLE"
                            {{old('status') === 'Inactive' ? 'selected':''}}>Inactive</option>
                    </select>
                    @error('status')
                    <small id="status" class="form-text text-danger">{{$message}}</small>
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


                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-info mx-1">Submit</button>
                    <a href="/computerparts" class="btn btn-outline-danger mx-1"> Cancel </a>

                </div>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

                <script type="text/javascript">
                    $(document).ready(function(){


                        $(document).on('change','.rooms',function(){
                            //console.log("hmm its change");

                            var ro_id=$(this).val();
                            // console.log(ro_id);

                            var div=$(this).parent().parent();


                            var op=" ";

                            $.ajax({
                                type:'get',
                                url:'{!!URL::to('findComputerName')!!}',
                                data:{'id':ro_id},
                                success:function(data) {
                                    // console.log('success');

                                    // console.log(data);

                                    // console.log(data.length);
                                    op+='<option value="0" selected disabled>Please Select a PC Number</option>';
                                    for(var i=0;i<data.length;i++){
                                        op+='<option value="'+data[i].id+'">'+data[i].computer_number+'</option>';
                                    }
                                    div.find('.computers').html(" ");
                                    div.find('.computers').append(op);
                                },
                                error:function(){

                                }

                            })
                        });


                        $("#computer_id").on('change',function(){
                            $("#computercateg_id").attr('disabled','true');
                            var roomId = $("#room_id option:selected").attr('href');
                            var url = roomId+'/'+$(this).val();
                            $.ajax({
                                url:url,
                                type:'GET',
                                dataType:'HTML',
                                success:function(res){
                                    $("#showCategories").html(res);
                                }
                            });
                            return false;
                        });
                    });

                </script>
            </form>
        </div>
    </div>
@endsection

