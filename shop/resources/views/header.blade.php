<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    @yield('meta-tags')

    <!--== Favicon ==-->
    <link rel="shortcut icon" href="/storage/{{ setting('site.favicon') }}" type="image/x-icon" />

    <!--== Google Fonts ==-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,500,500i,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,500,600,700" rel="stylesheet">

    <!--== Bootstrap CSS ==-->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--== Headroom CSS ==-->
    <link href="/assets/css/headroom.css" rel="stylesheet" />
    <!--== Animate CSS ==-->
    <link href="/assets/css/animate.css" rel="stylesheet" />
    <!--== Ionicons CSS ==-->
    <link href="/assets/css/ionicons.css" rel="stylesheet" />
    <!--== Material Icon CSS ==-->
    <link href="/assets/css/material-design-iconic-font.css" rel="stylesheet" />
    <!--== Elegant Icon CSS ==-->
    <link href="/assets/css/elegant-icons.css" rel="stylesheet" />
    <!--== Font Awesome Icon CSS ==-->
    <link href="/assets/css/font-awesome.min.css" rel="stylesheet" />
    <!--== Swiper CSS ==-->
    <link href="/assets/css/swiper.min.css" rel="stylesheet" />
    <!--== Fancybox Min CSS ==-->
    <link href="/assets/css/fancybox.min.css" rel="stylesheet" />
    <!--== Slicknav Min CSS ==-->
    <link href="/assets/css/slicknav.css" rel="stylesheet" />

    <!--== Main Style CSS ==-->
    <link href="/assets/css/style.css" rel="stylesheet" />

    @stack('style')
    <script>
        var urlAddToCart = '{{ route('add-to-cart') }}';
        var urlRemoveFromCart = '{{ route('remove-from-cart') }}';
        var urlCart = '{{ route('cart') }}';
        var urlUpdateCart = '{{ route('update-cart') }}';
        var urlClearCart = '{{ route('clear-cart') }}';
        var urlCheckoutItems = '{{ route('checkout-items') }}';
        var urlNp = '{{ route('get-np-data') }}';
        var urlFavorites = '{{ route('toggle-favorites') }}';
        var urlSetCurrency = '{{ route('set-currency') }}';
        var urlUpdateProductRating = '{{ route('update-product-rating') }}';
		var recaptcha_site_key = '{{ config('services.recaptcha.site_key') }}';
    </script>
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    @php
        $recaptcha_site_key = config('services.recaptcha.site_key');
    @endphp
    @if( !empty($recaptcha_site_key))
        <script
            src="https://www.google.com/recaptcha/api.js?render={{ config('services.recaptcha.site_key') }}"></script>
        <script>
            document.addEventListener( 'DOMContentLoaded', function () {
                // Привязка обработчика к событиям отправки форм
                document.querySelectorAll( 'form.recaptcha' ).forEach( function ( form ) {
                    form.addEventListener( 'submit', function ( e ) {
                        e.preventDefault();

                        let recaptchaField = form.querySelector( 'input[name="recaptcha_token"]' ); // Найти скрытое поле
                        if ( !recaptchaField ) {
                            console.error( 'reCAPTCHA field not found in form:', form.id );
                            return;
                        }

                        grecaptcha.ready( function () {
                            grecaptcha.execute( '{{ config('services.recaptcha.site_key') }}', {action: form.id} ).then( function ( token ) {
                                recaptchaField.value = token;
                                form.submit();
                            } );
                        } );
                    } );
                } );
            } );
        </script>
    @endif
</head>

<body>

<!--wrapper start-->
<div class="wrapper">

    <!--== Start Preloader Content ==-->
    <div class="preloader-wrap">
        <div class="preloader">
            <span class="dot"></span>
            <div class="dots">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!--== End Preloader Content ==-->

    <!--== Start Header Wrapper ==-->
    <header class="header-area header-default sticky-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-5 col-sm-4 col-lg-3">
                    <div class="header-logo-area">
                        <a href="{{ route('home') }}">
                            <img class="logo-main" src="/storage/{{ setting('site.logo') }}" alt="Logo" style="max-width: 100px;"/>
                            <img class="logo d-none" src="/storage/{{ setting('site.logo') }}" alt="Logo" />
                        </a>
                    </div>
                </div>
                {{ menu('Site', 'menu') }}
                <div class="col-5 col-sm-7 col-lg-2 d-sm-block text-end">
                    <div class="header-action-area">
                        <ul class="header-action">
                            <li class="account-menu">
                                <a class="action-item @if( auth()->check() ) active @endif" @if( auth()->check() ) href="{{ Route('profile') }}" @else href="{{ Route('login') }}" @endif ><i class="zmdi zmdi-account icon"></i></a>
                            </li>
                            <li class="currency-menu">
                                @include('currency-menu')
                            </li>
                            <li class="favorites">
                                <a class="action-item" href="{{ route('favorites') }}">
                                    <i class="zmdi zmdi-favorites-plus icon"></i>
                                    <span class="favorites-quantity" id="favorites_count" >{{ count($favorites) }}</span>
                                </a>
                            </li>
                            <li class="mini-cart">
                                @include('mini-cart')
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-2 col-sm-1 d-block d-lg-none text-end">
                    <button class="btn-menu" type="button"><i class="zmdi zmdi-menu"></i></button>
                </div>
            </div>
        </div>
    </header>
    <!--== End Header Wrapper ==-->
