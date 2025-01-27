@extends('layout.base')
@section('meta-tags')
    @include('includes.meta-tags')
@endsection
@section('content')
    <main class="main-content">
        @if( !empty($breadcrumbs))
            @include('page-header-area')
        @endif
        <!--== Start Product Area Wrapper ==-->
        <section class="product-area shopping-cart-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        @if ( !empty(session('error')) )
                            <h2 class="text-center">{{ session('error') }}</h2>
                        @elseif(empty($cartProducts))
                            <h2 class="text-center">{{ __('messages.cart.cart_is_empty') }}</h2>
                        @else
                        <div class="shopping-cart-wrap">
                            <div class="cart-table table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="indecor-product-remove">{{ __('messages.remove') }}</th>
                                            <th class="indecor-product-thumbnail">{{ __('messages.image') }}</th>
                                            <th class="indecor-product-name">{{ __('messages.product') }}</th>
                                            <th class="indecor-product-price">{{ __('messages.price') }}</th>
                                            <th class="indecor-product-quantity">{{ __('messages.quantity') }}</th>
                                            <th class="indecor-product-subtotal">{{ __('messages.total') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($cartProducts as $product)
                                            <tr class="cart-item cart-item-{{ $product->cart->key }}" data-key="{{ $product->cart->key }}">
                                                <td class="indecor-product-remove">
                                                    <a href="javascript:void(0);" role="button" onclick="removeFromCart( '{{ $product->cart->key }}' )"><i class="fa fa-times"></i></a>
                                                </td>
                                                <td class="indecor-product-thumbnail">
                                                    @php
                                                        $images = json_decode($product->images);
                                                        $image_thumbnails = json_decode($product->image_thumbnails);
                                                    @endphp
                                                    {!! getImage( [
                                                        'image' => ( is_array( $images ) ) ? $images[0] ?? null : null,
                                                        'thumbnails' => ( is_array( $image_thumbnails ) ) ? $image_thumbnails[0] ?? [] : [],
                                                        'main_size' => 160,
                                                        'sizes' => ['default' => '160px'],
                                                        'alt' => $product->title,
                                                        ] ) !!}
                                                </td>
                                                <td class="indecor-product-name">
                                                    <h4 class="title"><a href="{{ Route('single-item', [ $product->category->slug, $product->slug ]) }}" target="_blank">{{ $product->title }}</a></h4>
                                                        @foreach($product->getPrimeAttributesData() as $primeAttribute)
                                                            <div>
                                                                <span>{{ $primeAttribute->name }}:</span>
                                                                <select class="form-select"
                                                                        name="attribute[{{$primeAttribute->id}}]"
                                                                        style="margin-top:10px; width: auto; display: inline; margin-left: 10px;"
                                                                        onchange="changeAttribute('{{ $product->cart->key }}', this );">
                                                                    <option
                                                                        value="">{{ $primeAttribute->name }}</option>
                                                                    @php
                                                                        $cart_attributes = $product->cart->attributes;
                                                                        $cart_attribute = isset($cart_attributes[$primeAttribute->id]) ? $cart_attributes[$primeAttribute->id] : null;
                                                                    @endphp
                                                                    @foreach($primeAttribute->values as $value)
                                                                        <option value="{{ $value->id }}"
                                                                                @if( $cart_attribute && $value->id == $cart_attribute ) selected @endif>{{ $value->value }}</option>
                                                                    @endforeach
                                                                </select>
                                                            </div>
                                                        @endforeach
                                                </td>
                                                <td class="indecor-product-price">{{ $product->getUserPrice() }} {{ $product->getCurrencySymbol() }}</td>
                                                <td class="indecor-product-quantity">
                                                    <div class="pro-qty">
                                                        <input name="count" type="text" title="Quantity" class="product-quantity" value="{{ $product->cart->count }}" onchange="changeAttribute( '{{ $product->cart->key }}', this )" readonly>
                                                    </div>
                                                </td>
                                                <td class="product-subtotal"><span class="price">{!! $product->getUserPrice() * $product->cart->count !!} {{ $product->getCurrencySymbol() }}</span></td>
                                            </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-lg-7 col-12">
                                    <div class="coupon-all">
                                        <div class="coupon">
                                            <a class="button" href="{{ Route('home') }}">{{ __('messages.continue_shopping') }}</a>
                                            <a class="button" href="javascript:void(0);" role="button" onclick="clearCard();">{{ __('messages.empty_cart') }}</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-5 col-12">
                                    <div class="cart-page-total">
                                        <h3>{{ __('messages.in_cart') }}</h3>
                                        <ul>
                                            <li>{{ __('messages.products_count') }} <span class="money cart-count">{{ $totalCount }}</span></li>
                                            <li>{{ __('messages.total') }} <span class="money cart-total-price">{{ $totalPrice }} {{ $userCurrency->symbol }}</span></li>
                                        </ul>
                                        <a class="proceed-to-checkout-btn" href="{{ Route('checkout') }}">{{ __('messages.place_an_order') }}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endif
                    </div>
                </div>
            </div>
        </section>
        <!--== End Product Area Wrapper ==-->
    </main>
@endsection
