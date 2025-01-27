@extends('layout.base')
@section('meta-tags')
    @include('includes.meta-tags')
@endsection
@section('content')
<main class="main-content">
    <!--== Start Product Area Wrapper ==-->
    <section class="product-area product-information-area">
        <div class="container">
            <div class="product-information">
                <div class="row">
                    <div class="col-lg-7">
{{--                        <div class="edit-checkout-head">--}}
{{--                            <div class="header-logo-area">--}}
{{--                                <a href="index.html">--}}
{{--                                    <img class="logo-main" src="/assets/img/logo.png" alt="Logo">--}}
{{--                                </a>--}}
{{--                            </div>--}}
{{--                            <div class="breadcrumb-area">--}}
{{--                                <ul>--}}
{{--                                    <li><a class="active" href="cart.html">Cart</a><i class="fa fa-angle-right"></i></li>--}}
{{--                                    <li>Payment</li>--}}
{{--                                </ul>--}}
{{--                            </div>--}}
{{--                        </div>--}}
                        @if ( !empty(session('success')) )
                            <h4 class="title">{{ session('success') }}</h4>
                            <p>{{ __('messages.cart.thanks_for_your_order') }}</p>
                        @else
                        <form method="POST" action="{{ route('make-order') }}" class="recaptcha">
                            @csrf
                            <input type="hidden" name="recaptcha_token" value="recaptcha_token" >
                            <div class="edit-checkout-information">
                                <h4 class="title">{{ __('messages.contact_information') }}</h4>
                                <p>{{ __('messages.delivery_information') }}</p>
                                <div class="edit-checkout-form">
                                    <h4 class="title">{{ __('messages.delivery_address') }}</h4>
                                    @if ($errors->has('recaptcha_token'))
                                        <div class="text-danger">
                                            {{ $errors->first('recaptcha_token') }}
                                        </div>
                                    @endif
                                    <div class="row row-gutter-12">
                                        <div class="col-lg-6">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="floatingInputGrid" placeholder="{{ __('messages.name') }}" name="first_name" value="{{ old('first_name', auth()->check() ? auth()->user()->name : '') }}" >
                                                <label for="floatingInputGrid">{{ __('messages.name') }}*</label>
                                                @if ($errors->has('first_name'))
                                                    <div class="text-danger">
                                                        {{ $errors->first('first_name') }}
                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="floatingInput2Grid" placeholder="name" name="last_name" value="{{ old('last_name', auth()->check() ? auth()->user()->last_name : '') }}">
                                                <label for="floatingInput2Grid">{{ __('messages.last_name') }}*</label>
                                                @if ($errors->has('last_name'))
                                                    <div class="text-danger">
                                                        {{ $errors->first('last_name') }}
                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" placeholder="name" name="email" value="{{ old('email', auth()->check() ? auth()->user()->email : '') }}">
                                                <label for="floatingInput2Grid">{{ __('messages.email') }}</label>
                                                @if ($errors->has('email'))
                                                    <div class="text-danger">
                                                        {{ $errors->first('email') }}
                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-floating">
                                                <div class="form-group position-relative">
                                                    <label for="phoneInput" >{{ __('messages.phone') }}*</label>
                                                    <input type="tel" id="phoneInput" class="form-control phone-mask" placeholder="+38 (___) ___-__-__" name="phone"  value="{{ old('phone', auth()->check() ? auth()->user()->phone : '') }}" >
                                                    @if ($errors->has('phone'))
                                                        <div class="text-danger">
                                                            {{ $errors->first('phone') }}
                                                        </div>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-floating">
                                                <div class="form-group position-relative">
                                                    <label for="suggestionsInput">{{ __('messages.locality') }}*</label>
                                                    <input type="hidden" id="suggestionsKey" name="settlement_code" value="{{ old('settlement_code') }}">
                                                    <input type="text" id="suggestionsInput" class="form-control" placeholder="{{ __('messages.min_two_latter') }}" name="settlement" value="{{ old('settlement') }}">
                                                    <ul class="list-group position-absolute w-100" id="suggestions" style="display: none;"></ul>
                                                    @if ($errors->has('settlement'))
                                                        <div class="text-danger">
                                                            {{ $errors->first('settlement') }}
                                                        </div>
                                                    @endif
                                                    @if ($errors->has('settlement_code'))
                                                        <div class="text-danger">
                                                            {{ $errors->first('settlement_code') }}
                                                        </div>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-floating">
                                                <div class="form-group position-relative">
                                                    <label for="officesInput">{{ __('messages.new_post_office') }}*</label>
                                                    <input type="hidden" id="officesKey" name="office_code" value="{{ old('office_code') }}">
                                                    <input type="text" id="officesInput" class="form-control" placeholder="Выберите отделение" name="office"  value="{{ old('office') }}">
                                                    <ul class="list-group position-absolute w-100" id="offices" style="display: none;"></ul>
                                                    @if ($errors->has('office_code'))
                                                        <div class="text-danger">
                                                            {{ $errors->first('office_code') }}
                                                        </div>
                                                    @endif
                                                    @if ($errors->has('office'))
                                                        <div class="text-danger">
                                                            {{ $errors->first('office') }}
                                                        </div>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="btn-box">
                                                <button class="btn-shipping" type="submit">{{ __('messages.confirm_the_order') }}</button>
                                                <a class="btn-return" href="{{ route('cart') }}">{{ __('messages.back_to_cart') }}</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        @endif
                    </div>
                    @if ( empty(session('success')) )
                        <div class="col-lg-5">
                            <div class="shipping-cart-subtotal-wrapper">
                                <div class="shipping-cart-subtotal">
                                    @include('checkout-items')
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </section>
</main>
@endsection
<style>
    #suggestions, #offices {
        max-height: 400px; /* Ограничиваем высоту */
        overflow-y: auto;  /* Включаем вертикальный скролл */
        overflow-x: hidden; /* Отключаем горизонтальный скролл */
        z-index: 1000; /* Убедитесь, что список перекрывает другие элементы */
        background-color: #fff; /* Для хорошего контраста */
        border: 1px solid #ddd; /* Граница */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Легкая тень */
        position: absolute; /* Устанавливаем абсолютное позиционирование */
        margin-top: 5px; /* Отступ от поля ввода */
        border-radius: 4px; /* Закругленные углы */
    }
</style>
@push('scripts')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
    <script src="/assets/js/checkout.js"></script>
@endpush
