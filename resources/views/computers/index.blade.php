@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Computer List</h1>
        <a href="/create/computer"> <button class="btn btn-primary mt-2"> <strong>ADD Computer</strong></button> </a>
    </div>

    <div class="container py-3">
        @if($computers->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>PC number</th>
                    <th>Room</th>
                    <th>Serial Number</th>
                    <th>Date Created</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($computers as $computer)
                    <tr>
                        <td>{{$computer->computer_number}}</td>
                        <td>{{$computer->room->name}}</td>
                        <td>{{$computer->serial_number}}</td>
                        <td>{{\Carbon\Carbon::parse($computer->created_at)->format('M d Y h:i A')}}</td>
                        <td>
                            @php $comStatus=\DB::table('computerparts')->where('computer_id',$computer->id)->get(); @endphp
                            @php $comInactive=\DB::table('computerparts')->where('status','Inactive')->where('computer_id',$computer->id)->get(); @endphp
                            @if(count($comStatus)<=9)
                                <span class="badge badge-warning">
                                Incomplete
                            </span>
                            @elseif(count($comInactive)>=1)
                                <span class="badge badge-danger">
                                Inactive
                            </span>
                            @else
                                <span class="badge badge-success">
                               Active
                            </span>
                            @endif
                        </td>
                        <td>
                            <a href="/computers/{{$computer->id}}" class="btn btn-sm  btn-info"> View Computer Parts </a>
                            <button class="btn btn-sm  btn-danger"
                                    onclick="return deleteComputer({{$computer->id}})">Delete</button>
                        </td>
                        <div style="display:hidden">
                            <form action="/computers/delete/{{$computer->id}}" method="POST" id="delete{{$computer->id}}">
                                @csrf
                                @method('DELETE')
                            </form>
                        </div>
                    </tr>
                @endforeach


                </tbody>
                <tfoot>
                <tr>
                    <th>PC number</th>
                    <th>Room</th>
                    <th>Serial Number</th>
                    <th>Date Created</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
            </table>
        @else
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h4 class="card-title">Oops..</h4>
                    <p class="card-text">There are no computers yet. Go and create one!</p>
                </div>
            </div>
        @endif
    </div>

    @push('scripts')
        <script>
            @if(Session::get('computer_created'))
            Swal.fire(
                'Success!',
                'You created a computer!',
                'success'
            )
            @endif

            @if(Session::get('computer_updated'))
            Swal.fire(
                'Success!',
                'You updated a computer!',
                'success'
            )
            @endif


            @if(Session::get('existPcErr'))
            Swal.fire(
                'OPPS!',
                'The PC has been already entered to the room',
                'error'
            )
            @endif

            @if(Session::get('computer_deleted'))
            Swal.fire(
                'Deleted!',
                'Computer  has been deleted and archived',
                'success'
            )
            @endif
            @if(Session::get('computer_restored'))
            Swal.fire(
                'Restored!',
                'Computer has been restored successfully',
                'success'
            )
            @endif


            function deleteComputer(id) {
                Swal.fire({
                    title: 'Are you sure?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $("#delete" + id).submit();
                    }
                })
            }


        </script>
    @endpush
@endsection
