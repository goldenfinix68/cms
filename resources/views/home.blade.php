@extends('layouts.app')

@section('content')
    <html lang="en">

    <main role="main">

        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron">
            <div class="container">
                <h1 class="display-3">Welcome to the USC Laboratory</h1>
                <p></p>
            </div>
        </div>

        <div class="container">
            <!-- Example row of columns -->
            <div class="row">
                <div class="col-md-4">
                    <h2>About Us</h2>
                    <p>This system was developed for the purpose of efficiently tracking the ICT components/equipment from the Department of Computer, Information Sciences and Mathematics. This system also helps faculty and students to efficiently borrow specific components from the department. </p>
                </div>
                <div class="col-md-4">
                    <h2>Contact Us</h2>
                    <p>Department of Computer, Information Sciences and Mathematics</p>
                    <p>Control Room, 4th Floor, Bunzel Building, Talamban, Cebu City</p>
                </div>
                <div class="col-md-4">
                    <h2>Links</h2>
                    <a href="https://www.facebook.com/groups/106783636058773"
                    <label style="color:black"><i class="fa fa-globe"></i></label>
                    DCISM - USC SAS Group
                    </a><br>
                    <a href="http://www.usc.edu.ph/category/section/15/academic"
                    <label style="color:black"><i class="fa fa-globe"></i></label>
                    Academic Calendar</a>
                </div>
            </div>

            <hr>

        </div> <!-- /container -->

    </main>

    <footer class="container">
        <p>&copy; Asset Tracking and Maintenance Recording</p>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    </body>




    @push('scripts')
        <script>

            @if(Session::get('user_created'))
            Swal.fire(
                'Success!',
                'You created a user!',
                'success'
            )
            @endif



        </script>
    @endpush
@endsection
