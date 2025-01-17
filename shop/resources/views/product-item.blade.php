<div class="product-item @if( ! $product->isPublished() ) not_available @endif">
    <div class="inner-content">
        <div class="product-thumb">
            <a href="{{ Route('single-item', [ $product->category->slug, $product->slug ]) }}" >
                @php
                    $images = json_decode($product->images);
                    $image_thumbnails = json_decode($product->image_thumbnails);
                @endphp

                @if( isset($img) && $img == 4 )
                    {!! getImage( [
                    'image' => ( is_array( $images ) ) ? $images[0] ?? null : null,
                    'thumbnails' => ( is_array( $image_thumbnails ) ) ? $image_thumbnails[0] ?? [] : [],
                    'main_size' => 270,
                    'sizes' => [ 575 => 100, 991 => 50, 1200 => 33, 'default' => '270px'],
                    'alt' => $product->title,
                    'class' => 'w-100'
                    ] ) !!}
                @else
                    {!! getImage( [
                    'image' => ( is_array( $images ) ) ? $images[0] ?? null : null,
                    'thumbnails' => ( is_array( $image_thumbnails ) ) ? $image_thumbnails[0] ?? [] : [],
                    'main_size' => 370,
                    'sizes' => [ 575 => 100, 991 => 50, 1200 => 33, 'default' => '370px'],
                    'alt' => $product->title,
                    'class' => 'w-100'
                    ] ) !!}
                @endif
            </a>
            @if( $product->getOldPrice() )
                <span class="sale-title sticker">{{ __('messages.sale') }}</span>
            @endif
            <div class="product-action">
                <div class="addto-wrap">
                    @if( $product->isPublished() )
                        <a class="add-cart" href="javascript:void(0);"  role="button" onclick="addToCart({{ $product->id }});">
                            <i class="zmdi zmdi-shopping-cart-plus icon"></i>
                        </a>
                    @endif
                    <a class="add-wishlist @if( isFavorites( $product->id ) ) active @endif" href="javascript:void(0);" role="button" onclick="toogleFavorit({{ $product->id }}, this );">
                        <i class="zmdi zmdi-favorite-outline zmdi-hc-fw icon"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="product-desc">
            <div class="product-info">
                <h4 class="title"><a href="{{ Route('single-item', [ $product->category->slug, $product->slug ]) }}">{{ $product->title }}</a></h4>
                <div class="star-content" data-id="{{ $product->id }}">
                    @for($i=1;$i<6;$i++)
                        <i class="fa @if($i < $product->rating || $i == $product->rating) fa-star @else fa-star-o @endif " data-index="{{ $i }}"></i>
                    @endfor
                </div>
                @if( $product->isPublished() )
                    <div class="prices">
                        @if( $product->getPrice() )
                            <span class="price">{{ $product->getPrice() }} {{ $product->getCurrencySymbol() }}</span>
                        @endif
                        @if( $product->getOldPrice() )
                            <span class="price-old">{{ $product->getOldPrice() }} {{ $product->getCurrencySymbol() }}</span>
                        @endif
                    </div>
                @else
                    <span>{{ __('messages.not_available') }}</span>
                @endif

            </div>
        </div>
    </div>
</div>
