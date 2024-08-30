<!DOCTYPE html>
<html>

<head>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;

        }

        h2 {
            text-align: center;

        }

        h4 {
            text-align: center;
        }

        p {
            text-align: center;
        }

        .page-break {
            page-break-after: always;
        }

        .responsive {
            width: 55%;
            height: auto;
        }

    </style>
</head>

<body>

<div style="display:block">
    <img src="usc_logo_header.png" alt="usc_logo" class="responsive">
    <img src="dcism_logo.jpg" alt="dcism_logo" width='300' height='100' style="margin-top:20px">
</div>

<h2>Components List</h2>
<div>
    <h4>From: {{$from}} <span style="margin-left:30%">To: {{$to}}</span></h4>
</div>
<main>
    <table style="width:100%">
        <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Model</th>
            <th>Room</th>
            <th>Status</th>
            <th>Submitted By</th>
            <th>Date Created</th>


        </tr>
        @foreach($materials as $mat)
            <tr>
                <td>{{$mat->name}}</td>
                <td>{{$mat->category}}</td>
                <td>{{$mat->model_number}}</td>
                <td>{{$mat->room->name.' - '.$mat->room->type}}</td>
                <td>{{$mat->status}}</td>
                <td>{{$mat->submitted_by}}</td>
                <td>{{\Carbon\Carbon::parse($mat->created_at)->format('M d Y h:i A')}}</td>
            </tr>
        @endforeach


    </table>
</main>
<div>
    <h4>Prepared by: {{$user->name}} <span style="margin-left:30%">Date prepared: {{$date}}</span></h4>
</div>


</body>

</html>
