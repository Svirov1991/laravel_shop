<a class="action-item" href="{{ route('cart') }}">
    <i class="zmdi zmdi-shopping-cart-plus icon"></i>
    <span class="cart-quantity" id="cart-count">{{ $totalCount }}</span>
</a>
@if( !empty( $products) )
    <div class="mini-cart-dropdown">
        @foreach( $products as $product)
                <div class="cart-item cart-item-{{ $product->cart->key }}">
                    <div class="thumb">
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
                            'class' => 'w-100'
                        ] ) !!}
                    </div>
                    <div class="content">
                        <h5 class="title"><a href="{{ Route('single-item', [ $product->category->slug, $product->slug ]) }}">{{ $product->title }}</a></h5>
                        @foreach($product->getPrimeAttributesData() as $primeAttribute)
                            <select class="form-select" name="attribute[{{$primeAttribute->id}}]" style="margin-bottom: 8px;" onchange="changeAttribute('{{ $product->cart->key }}', this );">
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
                        @endforeach
                        <input type="hidden" name="count" value="{{ $product->cart->count }}">
                        <span class="product-quantity">{{ $product->cart->count }} ×</span>
                        @if( $product->getPrice() )
                            <span class="product-price">{{ $product->getPrice() }} {{ $product->getCurrencySymbol() }}</span>
                        @endif
                        <a class="cart-trash" href="javascript:void(0);" role="button" onclick="removeFromCart( '{{ $product->cart->key }}' )"><i class="fa fa-trash"></i></a>
                    </div>
                </div>
        @endforeach
        <div class="cart-total-money">
            <h5>{{ __('messages.total') }}: <span class="money cart-total-price">{{ $totalPrice }} {{ $userCurrency->symbol }}</span></h5>
        </div>
        <div class="cart-btn">
            <a href="{{ route('cart') }}">{{ __('messages.cart_n') }}</a>
            <a href="{{ route('checkout') }}">{{ __('messages.place_an_order') }}</a>
        </div>
    </div>
@endif
