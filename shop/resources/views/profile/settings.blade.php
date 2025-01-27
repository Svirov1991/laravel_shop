@php
    $metaTags = ['title' => __('profile.menu-item-settings')];
@endphp
@extends('profile.index')
@section('profile')
    @if( !empty( session('success') ) )
        <h4 class="mb-4 text-success">{{ session('success') }}</h4>
    @endif
    <form class="row" method="POST" action="{{ route('profile.update') }}">
        @csrf
        <input type="hidden" name="recaptcha_token" value="recaptcha_token" >
        <div class="col-md-6">
            <div class="form-group mb-3">
                <label for="account-fn">{{ __('profile.form.name') }}</label>
                <input class="form-control" type="text" id="account-fn" name="name" value="{{ Auth::user()->name }}"
                       required="">
                @error('name')
                <div class="text-danger">{{ $message }}</div>
                @enderror()
                @if ($errors->has('recaptcha_token'))
                    <div class="text-danger">
                        {{ $errors->first('recaptcha_token') }}
                    </div>
                @endif
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group mb-3">
                <label for="account-ln">{{ __('profile.form.last-name') }}</label>
                <input class="form-control" type="text" id="account-ln" name="last_name"
                       value="{{ Auth::user()->last_name }}" required="">
                @error('last_name')
                <div class="text-danger">{{ $message }}</div>
                @enderror()
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group mb-3">
                <label for="account-email">{{ __('profile.form.email') }}</label>
                <input class="form-control" type="email" id="account-email" value="{{ Auth::user()->email }}"
                       disabled="">

            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group mb-2">
                <label for="account-phone">{{ __('profile.form.phone') }}</label>
                <input class="form-control phone-mask" type="text" id="account-phone" name="phone"
                       value="{{ Auth::user()->phone }}"
                       placeholder="+38 (___) ___-__-__">
                @error('phone')
                <div class="text-danger">{{ $message }}</div>
                @enderror()
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group mb-3">
                <label for="account-pass">{{ __('profile.form.new-password') }}</label>
                <input class="form-control" name="password" type="password" id="account-pass">
                @error('password')
                <div class="text-danger">{{ $message  }}</div>
                @enderror()
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group mb-3">
                <label for="account-confirm-pass">{{ __('profile.form.confirm-password') }}</label>
                <input class="form-control" name="password_confirmation" type="password" id="account-confirm-pass">
            </div>
        </div>
        <div class="col-12">
            <hr class="mt-2 mb-3">
            <div class="d-flex flex-wrap justify-content-between align-items-center">
                <button class="btn btn-style-1 btn-primary" type="submit" data-toast=""
                        data-toast-position="topRight" data-toast-type="success"
                        data-toast-icon="fe-icon-check-circle" data-toast-title="Success!"
                        data-toast-message="Your profile updated successfuly.">{{ __('profile.form.update') }}
                </button>
            </div>
        </div>
    </form>
@endsection
