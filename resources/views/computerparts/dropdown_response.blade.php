@if($computercategs->count())
    <select class="form-control @error('computercateg_id') is-invalid @enderror" name="computercateg_id" id="computercateg_id">
        <option value="" selected disabled>Please select a category</option>
        @foreach($computercategs as $computercateg)
            @php $takenCat = \DB::table('computerparts')->where('room_id',$roomId)->where('computer_id',$pcId)->where('computercateg_id',$computercateg->id)->get(); @endphp
            <option value="{{$computercateg->id}}"  @if(@isset($takenCat[0]->computercateg_id)) @if($takenCat[0]->computercateg_id==$computercateg->id)  style="display:none"  @endif @endif    >{{$computercateg->category_name}}

            </option>
        @endforeach
    </select>
@else
    <div class="alert alert-info">
        <strong>Heads up!</strong> There are no available categories yet. Please click <a href="/create/computercategories" class="alert-link">here</a> to create one!
    </div>
@endif
