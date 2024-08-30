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

<h2>Users List</h2>
<div>
    <h4>From: {{$from}} <span style="margin-left:30%">To: {{$to}}</span></h4>
</div>
<main>
    <table style="width:100%">
        <tr>
            <th>School ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Course</th>
            <th>Contact #</th>
            <th>Birth Date</th>
            <th>Account Type</th>
            <th>Created At</th>


        </tr>
        @foreach($users as $use)
            <tr>
                <td>{{$use->school_id}}</td>
                <td>{{$use->name}}</td>
                <td>{{$use->email}}</td>
                <td>{{$use->course->coursename}}</td>
                <td>{{$use->contact_number}}</td>
                <td>{{\Carbon\Carbon::parse($use->birthdate)->format('M d Y')}}</td>
                <td>{{$use->account_type}}</td>
                <td>{{\Carbon\Carbon::parse($use->created_at)->format('M d Y')}}</td>
            </tr>
        @endforeach


    </table>
</main>
<div>
    <h4>Prepared by: {{$user->name}} <span style="margin-left:30%">Date prepared: {{$date}}</span></h4>
</div>


</body>

</html>
