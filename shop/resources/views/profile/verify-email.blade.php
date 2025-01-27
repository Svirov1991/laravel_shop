@extends('profile.index')
@section('profile')
    @if( !empty( session('success') ) )
        <h4 class="mb-4 text-success">{{ session('success') }}</h4>
    @endif
    <p>{{ __('profile.verify-message') }}</p>
    <a href="{{ Route('verification.resend') }}" class="btn btn-light" role="button">{{ __('profile.verify-resent') }}</a>
@endsection
