@php
    $metaTags = ['title' => __('profile.menu-item-wholesaler') ];
@endphp
@extends('profile.index')
@section('profile')

    @if( $user->isWholesaler() )
        <p>{!! __('profile.wholesaler') !!}</p>
    @elseif( $user->isWholesalerRequest() )
        <p>{!! __('profile.wholesaler-request') !!}</p>
    @else
        <p>{!! __('profile.wholesaler-get') !!}</p>
        <a href="{{ Route('profile.get-wholesaler') }}" class="btn btn-style-1 btn-primary mb-3">{{ __('profile.wholesaler-button') }}</a>
    @endif
    @if(!empty(session('error')))
        <p class="text-danger">{{ session('error') }}</p>
    @endif
    @if(!empty(session('message')))
        <p class="text-success">{{ session('message') }}</p>
    @endif

@endsection
