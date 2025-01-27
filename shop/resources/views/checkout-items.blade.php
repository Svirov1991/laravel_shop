
@foreach($products as $product)
        <div class="shipping-cart-item">
            <div class="thumb">
                @php
                    $images = json_decode($product->images);
                    $image_thumbnails = json_decode($product->image_thumbnails);
                @endphp
                {!! getImage( [
                            'image' => ( is_array( $images ) ) ? $images[0] ?? null : null,
                            'thumbnails' => ( is_array( $image_thumbnails ) ) ? $image_thumbnails[0] ?? [] : [],
                            'main_size' => 100,
                            'sizes' => ['default' => '100px'],
                            'alt' => $product->title,
                        ] ) !!}
                <span class="quantity">{{ $product->cart->count }}</span>
            </div>
            <div class="content">
                <h4 class="title">{{ $product->title }}</h4>
                @php
                 $cartAttributes = $product->cart->attributes;
                @endphp
                @foreach($product->getPrimeAttributesData() as $primeAttribute)
                    @if( isset( $cartAttributes[$primeAttribute->id] ) && !empty($primeAttribute->values) )
                        @foreach( $primeAttribute->values as $value )
                            @if($value->id == $cartAttributes[$primeAttribute->id])
                                <span class="info"><b>{{ $primeAttribute->name }}:</b> {{ $value->value }}. </span>
                            @endif
                        @endforeach
                    @endif
                @endforeach
                <span class="price">{!! $product->getUserPrice() * $product->cart->count !!} {{ $product->getCurrencySymbol() }}</span>
            </div>
        </div>
@endforeach
<div class="shipping-subtotal">
    <p><span>{{ __('messages.cart.order_cost') }}</span><span><strong>{{ $totalPrice }} {{ $userCurrency->symbol }}</strong></span></p>
    <p><span>{{ __('messages.delivery') }}</span><span>{{ __('messages.delivery_price') }}</span></p>
</div>
<div class="shipping-total">
    <p class="total">{{ __('messages.total') }}</p>
    <p class="price">{{ $totalPrice }} {{ $userCurrency->symbol }}</p>
</div>
