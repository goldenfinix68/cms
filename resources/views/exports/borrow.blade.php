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

<h2>Borrow Logs</h2>
<div>
    <h4>From: {{$from}} <span style="margin-left:30%">To: {{$to}}</span></h4>
</div>
<main>
    <table style="width:100%">
        <tr>
            <th>Hardware</th>
            <th>Model</th>
            <th>Category</th>
            <th>Borrower Name</th>
            <th>Account Type</th>
            <th>Date Borrowed</th>
            <th>Return Date</th>
            <th>Reason</th>


        </tr>
        @foreach($borrows as $borrow)
            <tr>
                <td>{{$borrow->component->name}}</td>
                <td>{{$borrow->component->model_number}}</td>
                <td>{{$borrow->component->category}}</td>
                <td>{{$borrow->borrower_name}}</td>
                <td>{{$borrow->borrower_type}}</td>
                <td>{{\Carbon\Carbon::parse($borrow->borrow_date)->format('M d Y h:i A')}}</td>
                <td>{{\Carbon\Carbon::parse($borrow->return_date)->format('M d Y h:i A')}}</td>
                <td>{{$borrow->reason}}</td>
            </tr>
        @endforeach


    </table>
</main>
<div>
    <h4>Prepared by: {{$user->name}} <span style="margin-left:30%">Date prepared: {{$date}}</span></h4>
</div>


</body>

</html>
