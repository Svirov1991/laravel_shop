<div class="product-item product-item-list @if( ! $product->isPublished() ) not_available @endif">
    <div class="inner-content">
        <div class="row">
            <div class="col-md-4">
                <div class="product-thumb">
                    <a href="{{ Route('single-item', [ $product->category->slug, $product->slug ]) }}">
                        @php
                            $images = json_decode($product->images);
                            $image_thumbnails = json_decode($product->image_thumbnails);
                        @endphp
                        {!! getImage( [
                    'image' => ( is_array( $images ) ) ? $images[0] ?? null : null,
                    'thumbnails' => ( is_array( $image_thumbnails ) ) ? $image_thumbnails[0] ?? [] : [],
                    'main_size' => 370,
                    'sizes' => [ 767 => 100, 1200 => 33, 'default' => '370px'],
                    'alt' => $product->title,
                    'class' => 'w-100'
                    ] ) !!}
                    </a>
                    @if( $product->getOldPrice() )
                        <span class="sale-title sticker">{{ __('messages.sale') }}</span>
                    @endif
                </div>
            </div>
            <div class="col-md-8">
                <div class="product-desc">
                    <div class="product-info">
                        <h4 class="title"><a href="{{ Route('single-item', [ $product->category->slug, $product->slug ]) }}"> {{ $product->title }}</a></h4>
                        <div class="prices">
                            @if( $product->isPublished() )
                                @if( $product->getPrice() )
                                    <span class="price">{{ $product->getPrice() }} {{ $product->getCurrencySymbol() }}</span>
                                @endif
                                @if( $product->getOldPrice() )
                                    <span class="price-old">{{ $product->getOldPrice() }} {{ $product->getCurrencySymbol() }}</span>
                                @endif
                                @if( $product->getWPrice() )
                                        <div><b>{{ __('messages.w-price') }} <span class="price price-w">{{ $product->getWPrice() }} {{ $product->getCurrencySymbol() }}</span></b></div>
                                @endif
                            @else
                                <span>{{ __('messages.not_available') }}</span>
                            @endif
                        </div>
                        {!! $product->description !!}
                        <div class="product-action">
                            <div class="addto-wrap">
                                @if( $product->isPublished() )
                                    <a class="add-cart" href="javascript:void(0);"  role="button" onclick="addToCart({{ $product->id }});">
                                        <i class="zmdi zmdi-shopping-cart-plus icon"></i>
                                    </a>
                                @endif
                                <a class="add-wishlist @if( isFavorites( $product->id ))active @endif" href="javascript:void(0);"  role="button" onclick="toogleFavorit({{ $product->id }}, this );">
                                    <i class="zmdi zmdi-favorite-outline zmdi-hc-fw icon"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
