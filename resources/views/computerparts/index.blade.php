@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Computer Parts List</h1>
        <a href="/create/computerparts"> <button class="btn btn-primary mt-2"> <strong>ADD Computer Parts</strong></button> </a>
    </div>

    <div class="container-fluid content py-5">
        @if($computerparts->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Image</th>
                    <th>Brand</th>
                    <th>Model Number</th>
                    <th>Category</th>
                    <th>Room</th>
                    <th>PC Number</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($computerparts as $computerpart)
                    <tr>
                        <td><img src="{{ asset('uploads/components/' . $computerpart->image) }}" class="img-fluid" width="100px;"
                                 height="100px;" alt="{{$computerpart->name}}"></td>
                        <td>{{$computerpart->brand}}</td>
                        <td>{{$computerpart->model_number}}</td>
                        <td>{{$computerpart->computercategArchive->category_name}}</td>
                        <td>{{$computerpart->room->name}}</td>
                        <td>{{$computerpart->computer->computer_number}}</td>
                        @if($computerpart->status == 'Active')
                            <td><font color="green">{{$computerpart->status}}</td>
                        @elseif($computerpart->status == 'Inactive')
                            <td><font color="red">{{$computerpart->status}}</td>
                        @else
                            <td><font color="orange">{{$computerpart->status}}</font></td>
                        @endif
                        <td>
                            <a href="/computerparts/edit/{{$computerpart->id}}" class="btn btn-sm btn-block btn-success"> Edit </a>
                            <button class="btn btn-sm btn-block btn-danger"
                                    onclick="return deleteComputerpart({{$computerpart->id}})">Delete</button>
                            <button class="btn btn-sm btn-block btn-info" data-toggle="modal" data-target=".bd-example-modal-sm"
                                    onclick="return generate_qr({{$computerpart->id}})">Generate QR</button>
                            <a href="/computerparts/report/{{$computerpart->id}}" class="btn btn-sm btn-block btn-warning">Report</a>
                        </td>
                        <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">QR Code</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="container text-center mt-3">
                                        <h5>Scan this!</h5>
                                        <div id="qr"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div style="display:hidden">
                            <form action="/computerparts/delete/{{$computerpart->id}}" method="POST" id="delete{{$computerpart->id}}">
                                @csrf
                                @method('DELETE')
                            </form>
                        </div>
                    </tr>
                @endforeach


                </tbody>
                <tfoot>
                <tr>
                    <th>Image</th>
                    <th>Brand</th>
                    <th>Model Number</th>
                    <th>Category</th>
                    <th>Room</th>
                    <th>PC Number</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
            </table>
        @else
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h4 class="card-title">Oops..</h4>
                    <p class="card-text">There are no computer parts yet. Go and create one!</p>
                </div>
            </div>
        @endif
    </div>

    @push('scripts')
        <script>
            @if(Session::get('computerparts_created'))
            Swal.fire(
                'Success!',
                'You created a computer part!',
                'success'
            )
            @endif

            @if(Session::get('computerparts_updated'))
            Swal.fire(
                'Success!',
                'You updated a computer part!',
                'success'
            )
            @endif


            @if(Session::get('computerparts_deleted'))
            Swal.fire(
                'Deleted!',
                'Computer Part has been deleted and archived',
                'success'
            )
            @endif

            @if(Session::get('computerparts_restored'))
            Swal.fire(
                'Restored!',
                'Computer Part has been restored successfully',
                'success'
            )
            @endif

            @if(Session::get('existRecordErr'))
            Swal.fire(
                'OPPS!',
                'Computer Part has been  already taken'
            )
            @endif


            function generate_qr(id) {
                $.ajax({
                    type: 'post',
                    url: '/generateqrs',
                    data: {
                        "_token": "{{ csrf_token() }}",
                        "id": id
                    },
                    success: function (code) {
                        $('#qr').html(code);
                    }
                });
            }

            function deleteComputerpart(id) {
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
