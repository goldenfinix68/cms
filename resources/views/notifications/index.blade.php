@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between">
        <h1>Notification list</h1>
        @if(Auth::user()->notifications->count())
            <a href="/read"> <button class="btn btn-success mt-2"> <strong>Mark all as read</strong></button> </a>
        @endif
    </div>

    <div class="container-fluid content py-5">
        @if(Auth::user()->notifications->count())
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Subject</th>
                    <th>Message</th>
                    <!-- <th>URL</th> -->
                    <th>Date received</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach(Auth::user()->unreadNotifications as $notification)
                    <tr>
                        <td>{{$notification->data['subject']}}</td>
                        <td>{{$notification->data['message']}}</td>
                        <!-- <td>Sample url</td> -->
                        <td>{{$notification->created_at->diffForHumans()}}</td>
                        <td>
                            <span class="badge badge-warning">Unread</span>
                        </td>
                        <td>
                            <a href="{{$notification->data['url']}}" class="btn btn-sm btn-block btn-info"> Go to url </a>
                            <!-- <a href="#" ><button class="btn btn-sm btn-block btn-success" disabled>Mark as read</button> </a> -->
                        </td>
                    </tr>
                @endforeach

                @foreach(Auth::user()->readNotifications as $notification)
                    <tr>
                        <td>{{$notification->data['subject']}}</td>
                        <td>{{$notification->data['message']}}</td>
                        <!-- <td>Sample url</td> -->
                        <td>{{$notification->created_at->diffForHumans()}}</td>
                        <td>
                            <span class="badge badge-info">Read</span>
                        </td>
                        <td>
                            <a href="{{$notification->data['url']}}" class="btn btn-sm btn-block btn-info"> Go to url </a>
                            <!-- <a href="#" ><button class="btn btn-sm btn-block btn-success" disabled>Mark as read</button> </a> -->
                        </td>
                    </tr>
                @endforeach


                </tbody>
                <tfoot>
                <tr>
                    <th>Subject</th>
                    <th>Message</th>
                    <!-- <th>URL</th> -->
                    <th>Date received</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
            </table>
        @else
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h4 class="card-title">Oops..</h4>
                    <p class="card-text">There are no notifications yet</p>
                </div>
            </div>
        @endif
    </div>
@endsection
