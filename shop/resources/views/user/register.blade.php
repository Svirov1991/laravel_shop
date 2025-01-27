@extends('layout.base')
@section('meta-tags')
    @include('includes.meta-tags' )
@endsection
@section('content')
    <main class="main-content">
        <!--== Start Account Area Wrapper ==-->
        <section class="account-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-8 m-auto">
                        <div class="account-form-wrap">
                            <!--== Start Login Form ==-->
                            <div class="login-form">
                                <div class="content">
                                    <h4 class="title">{{ __('profile.register') }}</h4>
                                    <p>{{ __('profile.register-subtitle') }}</p>
                                    @if ($errors->has('recaptcha_token'))
                                        <div class="text-danger">
                                            {{ $errors->first('recaptcha_token') }}
                                        </div>
                                    @endif
                                </div>
                                <form method="POST" action="{{ route('register-save') }}">
                                    @csrf
                                    <input type="hidden" name="recaptcha_token" value="recaptcha_token" >
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <input class="form-control" name="name" type="text" placeholder="{{ __('profile.form.name') }}*" value="{{ old('name') }}">
                                                @error('name')
                                                <div class="text-danger">{{ $message  }}</div>
                                                @enderror()
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <input class="form-control" name="email" type="email" placeholder="{{ __('profile.form.email') }}*" value="{{ old('email') }}">
                                                @error('email')
                                                <div class="text-danger">{{ $message  }}</div>
                                                @enderror()
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <input class="form-control" name="password" type="password" placeholder="{{ __('profile.form.password') }}*">
                                                @error('password')
                                                <div class="text-danger">{{ $message  }}</div>
                                                @enderror()
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <input class="form-control" name="password_confirmation" type="password" placeholder="{{ __('profile.form.confirm-password') }}*">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="login-form-group">
                                                <button class="btn-sign" type="submit">{{ __('profile.register') }}</button>
                                                <a class="btn-pass-forgot" href="{{ Route( 'login' ) }}">{{ __('profile.form.sign-in') }}</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--== End Login Form ==-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--== End Account Area Wrapper ==-->
    </main>
@endsection
