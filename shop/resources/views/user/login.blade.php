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
                                    <h4 class="title">{{ __('profile.login') }}</h4>
                                    <p>{{ __('profile.login-subtitle') }}</p>
                                    @if( session('status'))
                                        <p class="text-success">{{ session('status') }}</p>
                                    @endif
                                    @if( session('status'))
                                        <p class="text-success">{{ session('status') }}</p>
                                    @endif
                                    @if ($errors->has('recaptcha_token'))
                                        <div class="text-danger">
                                            {{ $errors->first('recaptcha_token') }}
                                        </div>
                                    @endif
                                    @error('login')
                                        <div class="text-danger">{{ $message  }}</div>
                                    @enderror()
                                </div>

                                <form method="POST" action="{{ route('attempt-to-login') }}">
                                    @csrf
                                    <input type="hidden" name="recaptcha_token" value="recaptcha_token" >
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <input class="form-control" type="email" name="email" placeholder="{{ __('profile.form.email') }}" value="{{ old('email') }}">
                                                @error('email')
                                                <div class="text-danger">{{ $message  }}</div>
                                                @enderror()
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <input class="form-control" name="password" type="password" placeholder="{{ __('profile.form.password') }}">
                                                @error('password')
                                                <div class="text-danger">{{ $message  }}</div>
                                                @enderror()
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <input name="remember" type="checkbox" checked />
                                                <label>{{ __('profile.form.remember') }}</label>
                                                @error('remember')
                                                <div class="text-danger">{{ $message  }}</div>
                                                @enderror()
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="login-form-group">
                                                <button class="btn-sign" type="submit">{{ __('profile.form.sign-in') }}</button>
                                                <a class="btn-pass-forgot" href="{{ Route('password.request') }}">{{ __('profile.form.forgot-password') }}</a>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="account-optional-group">
                                                <a class="btn-create" href="{{ Route( 'register' ) }}">{{ __('profile.form.create-account') }}</a>
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
