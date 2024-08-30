@extends('layouts.index')

@section('content')

    <div class="content d-flex flex-column justify-content-center align-items-center">
        <h1>
            Asset Tracking
            (ICT Equipment)
        </h1>
        <br />
        <h5>
            A Laravel Project by: Pingol, Esposa, Enolpe
        </h5>
    </div>

    @push('scripts')
        <script>

            @if(Session::get('account_created'))
            Swal.fire(
                'Success!',
                'Account created! Please wait for the admin to verify your registration.',
                'success'
            )
            @endif

            @if(Session::get('not_verified'))
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'You are not verified yet. Please wait for the admin to verify your account.',
            })
            @endif

        </script>
    @endpush

@endsection
