@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Transaction history</h1>
        <a href="/computerpartsreports"> <button class="btn btn-outline-warning mt-2"> <strong>Go back</strong></button> </a>
    </div>

    <div class="container-fluid content py-5">
        @if($transactions->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Image</th>
                    <th>Brand</th>
                    <th>Category</th>
                    <th>Model</th>
                    <th>Room Location</th>
                    <th>Submitted By</th>
                    <th>Submitted At</th>
                    <th>Issue Description</th>
                    <th>Fix</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($transactions->reverse() as $transaction)
                    <tr>
                        <td><img src="{{ asset('uploads/components/' . $transaction->computerpartArchive->image) }}" class="img-fluid"
                                 width="100px;" height="100px;" alt="{{$transaction->computerpartArchive->brand}}"></td>
                        <td>{{$transaction->computerpartArchive->brand}}</td>

                        <td>{{$transaction->computerpartArchive->computercateg->category_name}}</td>
                        <td>{{$transaction->computerpartArchive->model_number}}</td>
                        <td>{{$transaction->computerpartArchive->room->name}}</td>
                        <td>{{$transaction->submitted_by}}</td>
                        <td>{{\Carbon\Carbon::parse($transaction->created_at)->format('M d Y h:i A')}}</td>
                        <td>{{$transaction->issue}}</td>
                        <td>{{$transaction->fix}}</td>
                        <td>{{$transaction->action}}</td>
                    </tr>
                @endforeach

                </tbody>
                <tfoot>
                <tr>
                    <th>Image</th>
                    <th>Brand</th>
                    <th>Category</th>
                    <th>Model</th>
                    <th>Room Location</th>
                    <th>Submitted By</th>
                    <th>Submitted At</th>
                    <th>Issue Description</th>
                    <th>Fix</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
            </table>
        @else
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h4 class="card-title">Oops..</h4>
                    <p class="card-text">There are no report transactions yet..</p>
                </div>
            </div>
        @endif
    </div>
@endsection
