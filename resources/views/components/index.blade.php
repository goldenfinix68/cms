@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Component list</h1>
        @if(Auth::user()->account_type == 'admin' || Auth::user()->account_type == 'working student' )
            <div class="mt-2">
                <a href="/components/create"> <button class="btn btn-primary"> <strong>ADD COMPONENT</strong></button> </a>
                <button class="btn btn-secondary" data-toggle="modal" data-target="#exportModal"> <strong>EXPORT
                        COMPONENTS</strong></button>
            </div>
        @endif
    </div>
    <form action="/exports/components" method="POST">
        @csrf
        <div class="modal fade" id="exportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Export Components</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="start_date">Start Date</label>
                            <input type="date" name="start_date" class="form-control" id="start_date" value="{{old('start_date') ? old('start_date'):'' }}"
                                   aria-describedby="start_date" placeholder="Enter start_date">

                            @error('start_date')
                            <small id="start_date" class="form-text text-danger">{{$message}}</small>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="end_date">End Date</label>
                            <input type="date" name="end_date" class="form-control" id="end_date" value="{{old('end_date') ? old('end_date'):'' }}"
                                   aria-describedby="end_date" placeholder="Enter end date">

                            @error('end_date')
                            <small id="end_date" class="form-text text-danger">{{$message}}</small>
                            @enderror
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Download</button>
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="container-fluid content py-5">
        @if($components->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Model</th>
                    <th>Room Location</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>

                @foreach($components->reverse() as $component)
                    <tr>
                        <td><img src="{{ asset('uploads/components/' . $component->image) }}" class="img-fluid" width="100px;"
                                 height="100px;" alt="{{$component->name}}"></td>
                        <td>{{$component->name}}</td>
                        <td>{{$component->description}}</td>
                        <td>{{$component->category}}</td>
                        <td>{{$component->model_number}}</td>
                        <td>{{$component->room->name}}</td>
                        <td>{{$component->status}}</td>
                        <td>
                            @if(Auth::user()->account_type == 'admin' || Auth::user()->account_type == 'working student' )
                                <a href="/components/edit/{{$component->id}}" class="btn btn-sm btn-block btn-success"> Edit </a>
                                <button class="btn btn-sm btn-block btn-danger"
                                        onclick="return deleteComponent({{$component->id}})">Delete</button>
                                <button class="btn btn-sm btn-block btn-info" data-toggle="modal" data-target=".bd-example-modal-sm"
                                        onclick="return generate_qr({{$component->id}})">Generate QR</button>
                                <a href="/components/report/{{$component->id}}" class="btn btn-sm btn-block btn-warning">Report</a>
                            @endif
                            <a href="/components/borrow/{{$component->id}}">
                                <button class="btn btn-sm btn-block btn-primary mt-2"
                                    {{ $component->status == 'BORROWED' || $component->status == 'UNAVAILABLE'  ? 'disabled':''}}
                                    {{Auth::user()->borrow_status ? '':'disabled'}}> Borrow</button>
                            </a>
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
                            <form action="/components/delete/{{$component->id}}" method="POST" id="delete{{$component->id}}">
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
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Model</th>
                    <th>Room Location</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
            </table>
        @else
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h4 class="card-title">Oops..</h4>
                    <p class="card-text">There are no components uploaded yet</p>
                </div>
            </div>
        @endif
    </div>

    @push('scripts')
        <script>
            @if(Session::get('component_created'))
            Swal.fire(
                'Success!',
                'You created a component!',
                'success'
            )
            @endif

            @if(Session::get('component_updated'))
            Swal.fire(
                'Success!',
                'You have updated a component!',
                'success'
            )
            @endif

            @if(Session::get('component_deleted'))
            Swal.fire(
                'Deleted!',
                'Component has been deleted and archived',
                'success'
            )
            @endif

            @if(Session::get('component_restored'))
            Swal.fire(
                'Restored!',
                'Component has been restored successfully',
                'success'
            )
            @endif

            @if(Session::get('component_borrowed'))
            Swal.fire(
                'Success!',
                'You borrowed a component!',
                'success'
            )
            @endif

            @if(Session::get('no_components'))
            Swal.fire(
                'Oops!',
                'There are no data with the fields you entered in the exports',
                'error'
            )
            @endif



            function generate_qr(id) {
                $.ajax({
                    type: 'post',
                    url: '/generateqr',
                    data: {
                        "_token": "{{ csrf_token() }}",
                        "id": id
                    },
                    success: function (code) {
                        $('#qr').html(code);
                    }
                });
            }

            function deleteComponent(id) {
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

            @error('start_date')
            $( document ).ready(function() {
                $('#exportModal').modal('show')
            });
            @enderror
            @error('end_date')
            $( document ).ready(function() {
                $('#exportModal').modal('show')
            });
            @enderror

        </script>
    @endpush
@endsection
