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

<h2>Report List</h2>
<div>
    <h4>From: {{$from}} <span style="margin-left:30%">To: {{$to}}</span></h4>
</div>
<main>
    <table style="width:100%">
        <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Model Number</th>
            <th>Room</th>
            <th>Issue</th>
            <th>Fix</th>
            <th>Submitted By</th>
            <th>Submitted At</th>


        </tr>
        @foreach($reports as $report)
            <tr>
                <td>{{$report->componentArchive->name}}</td>
                <td>{{$report->componentArchive->category}}</td>
                <td>{{$report->componentArchive->model_number}}</td>
                <td>{{$report->componentArchive->room->name}}</td>
                <td>{{$report->issue}}</td>
                <td>{{$report->fix}}</td>
                <td>{{$report->submitted_by}}</td>
                <td>{{\Carbon\Carbon::parse($report->created_at)->format('M d Y h:i A')}}</td>
            </tr>
        @endforeach


    </table>
</main>
<div>
    <h4>Prepared by: {{$user->name}} <span style="margin-left:30%">Date prepared: {{$date}}</span></h4>
</div>


</body>

</html>
