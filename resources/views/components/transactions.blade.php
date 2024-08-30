@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Transaction history</h1>
        <a href="/components"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="container-fluid content py-5">
        @if($transactions->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Model</th>
                    <th>Room Location</th>
                    <th>Status</th>
                    <th>Performed by</th>
                    <th>Date Executed</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                @foreach($transactions->reverse() as $tran)
                    <tr>
                        <td>{{$tran->id}}</td>
                        <td><img src="{{ asset('uploads/components/' . $tran->image) }}" class="img-fluid" width="100px;" height="100px;" alt="{{$tran->name}}"></td>
                        <td>{{$tran->name}}</td>
                        <td>{{$tran->description}}</td>
                        <td>{{$tran->category}}</td>
                        <td>{{$tran->model_number}}</td>
                        <td>{{$tran->room->name}}</td>
                        <td>{{$tran->status}}</td>
                        <td>{{$tran->submitted_by}}</td>
                        <td>{{\Carbon\Carbon::parse($tran->created_at)->format('M d Y h:i A')}}</td>
                        <td>{{$tran->action}}</td>
                    </tr>
                @endforeach


                </tbody>
                <tfoot>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Model</th>
                    <th>Room Location</th>
                    <th>Status</th>
                    <th>Performed by</th>
                    <th>Date Executed</th>
                    <th>Action</th>
                </tr>
                </tfoot>
            </table>
        @else
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h4 class="card-title">Oops..</h4>
                    <p class="card-text">There are no component transactions yet...</p>
                </div>
            </div>
        @endif
    </div>
@endsection
