@extends('layout.base')
@section('meta-tags')
    @include('includes.meta-tags')
@endsection
@section('content')
    <main class="main-content">
        @if( !empty($breadcrumbs))
            @include('page-header-area', $breadcrumbs)
        @endif
        <!--== Start Product Single Area Wrapper ==-->
        <section class="product-area product-single-area">
            <div class="container pt-60 pb-0">
                <div class="row">
                    <div class="col-12">
                        <div class="product-single-item" data-margin-bottom="63">
                            <div class="row">
                                <div class="col-lg-6">
                                    <!--== Start Product Thumbnail Area ==-->
                                    <div class="product-thumb">
                                        <div class="swiper-container single-product-thumb-slider">
                                            <div class="swiper-wrapper">
                                                @php
                                                $images = json_decode( $product->images );
                                                $image_thumbnails = json_decode( $product->image_thumbnails );
                                                @endphp
                                                @foreach( $images as $k => $img)
                                                    <div class="swiper-slide">
                                                        <div class="zoom zoom-hover">
                                                            <a class="lightbox-image" data-fancybox="gallery" href="{!! Storage::disk( config('voyager.storage.disk') )->url($img) !!}">
                                                                {!! getImage( [
                                                                    'image' => $img,
                                                                    'thumbnails' => $image_thumbnails[$k] ?? [],
                                                                    'main_size' => 570,
                                                                    'sizes' => [ 991 => 100, 1200 => 50, 'default' => '570px'],
                                                                    'alt' => $product->title,
                                                                    'class' => 'w-100'
                                                                    ] ) !!}
                                                            </a>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                    <!--== End Product Thumbnail Area ==-->

                                    <!--== Start Product Nav Area ==-->
                                    <div class="swiper-container single-product-nav-slider product-nav">
                                        <div class="swiper-wrapper">
                                            @foreach( $images as $k => $img)
                                                <div class="swiper-slide">
                                                    {!! getImage( [
                                                        'image' => $img,
                                                        'thumbnails' => $image_thumbnails[$k] ?? [],
                                                        'main_size' => 114,
                                                        'sizes' => [ 991 => 16, 1200 => 9, 'default' => '114px'],
                                                        'alt' => $product->title,
                                                        ] ) !!}
                                                </div>
                                            @endforeach
                                        </div>
                                        <!--== Add Swiper navigation Buttons ==-->
                                        <div class="swiper-button-prev"><i class="ei ei-icon_arrow_carrot-left"></i></div>
                                        <div class="swiper-button-next"><i class="ei ei-icon_arrow_carrot-right"></i></div>
                                    </div>
                                    <!--== End Product Nav Area ==-->
                                </div>
                                <div class="col-lg-6">
                                    <!--== Start Product Info Area ==-->
                                    <div class="product-single-info">
                                        <h4 class="title">{{ $product->title }}</h4>

                                        <div class="prices">
                                            @if( $product->isPublished() )
                                                @if( $product->getPrice() )
                                                    <span class="price">{{ $product->getPrice() }} {{ $product->getCurrencySymbol() }}</span>
                                                @endif
                                                @if( $product->getOldPrice() )
                                                    <span class="price-old">{{ $product->getOldPrice() }} {{ $product->getCurrencySymbol() }}</span>
                                                @endif
                                            @else
                                                <span>{{ __('messages.not_available') }}</span>
                                            @endif
                                        </div>

                                        <div class="rating-box-wrap">
                                            <div class="rating-box" data-id="{{ $product->id }}">
                                                @for($i=1;$i<6;$i++)
                                                    <i class="fa @if($i < $product->rating || $i == $product->rating) fa-star @else fa-star-o @endif " data-index="{{ $i }}"></i>
                                                @endfor
                                            </div>
                                        </div>
                                        {!! $product->description !!}
                                        @foreach($product->getRegularAttributesData() as $attribute)
                                            <p>{{ $attribute->name }}: @foreach($attribute->values as $value) {{ $value->value }}@endforeach</p>
                                        @endforeach
                                        @if( $product->isPublished() )
                                            <form id="product-form">
                                                <div class="product-select-action">
                                                    @foreach( $product->getPrimeAttributesData() as $attribute )
                                                        <div class="select-item">
                                                            <label for="attribute_{{ $attribute->id }}">{{ $attribute->name }}:</label>
                                                            <select class="form-select" name="attribute[{{ $attribute->id }}]" id="attribute_{{ $attribute->id }}" >
                                                                @php $i = 0; @endphp
                                                                @foreach($attribute->values as $value)
                                                                    @php $i++; @endphp
                                                                        <option value="{{ $value->id }}" @if($i = 1) selected @endif>{{ $value->value }}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    @endforeach
                                                </div>
                                                <div class="product-action-simple">
                                                    <div class="product-quick-action">
                                                        <div class="product-quick-qty">
                                                            <div class="pro-qty">
                                                                <input type="text" name="count" id="quantity" title="Quantity" value="1">
                                                            </div>
                                                        </div>
                                                        <input type="hidden" name="product_id" value="{{ $product->id }}">
                                                        <a class="btn-product-add product_form" href="javascript:void(0);" data-type="0">{{ __('messages.add_to_cart') }}</a>
                                                    </div>
                                                    @if(!isFavorites($product->id ))
                                                        <div class="product-wishlist">
                                                            <a href="javascript:void(0);"
                                                               onclick="toogleFavorit({{ $product->id }}, this );"
                                                               class="btn-wishlist">{{ __('messages.in_favorites') }}</a>
                                                        </div>
                                                    @endif
                                                    <div class="payment-button">
                                                        <a href="javascript:void(0);" class="btn-payment product_form" data-type="1">{{ __('messages.buy_now') }}</a>
                                                    </div>
        {{--                                            <div class="social-sharing">--}}
        {{--                                                <span>Share:</span>--}}
        {{--                                                <div class="social-icons">--}}
        {{--                                                    <a href="#/"><i class="fa fa-facebook"></i></a>--}}
        {{--                                                    <a href="#/"><i class="fa fa-twitter"></i></a>--}}
        {{--                                                    <a href="#/"><i class="fa fa-pinterest"></i></a>--}}
        {{--                                                    <a href="#/"><i class="fa fa-google-plus"></i></a>--}}
        {{--                                                </div>--}}
        {{--                                            </div>--}}
                                                </div>
                                            </form>
                                        @endif
                                    </div>
                                    <!--== End Product Info Area ==-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="product-review-tabs-content">
                            <ul class="nav product-tab-nav" id="ReviewTab" role="tablist">
                                @php $active_tab = true; @endphp
                                @if( !empty( $product->full_description))
                                    <li role="presentation">
                                        <a @if($active_tab) class="active" @endif id="description-tab" data-bs-toggle="pill" href="#description" role="tab" aria-controls="description" aria-selected="true">{{ __('messages.description') }}</a>
                                    </li>
                                    @php $active_tab = false; @endphp
                                @endif
                                @if( !empty( setting('site.shipping_policy') ))
                                    <li role="presentation">
                                        <a @if($active_tab) class="active" @endif id="shipping-policy-tab" data-bs-toggle="pill" href="#shipping-policy" role="tab" aria-controls="shipping-policy" aria-selected="false">{{ __('messages.shipping_policy') }}</a>
                                    </li>
                                    @php $active_tab = false; @endphp
                                 @endif
                                 @if( !empty( $product->size_chart))
                                    <li role="presentation">
                                        <a @if($active_tab) class="active" @endif id="size-chart-tab" data-bs-toggle="pill" href="#size-chart" role="tab" aria-controls="size-chart" aria-selected="false">{{ __('messages.size_chart') }}</a>
                                    </li>
                                    @php $active_tab = false; @endphp
                                @endif
                            </ul>
                            <div class="tab-content product-tab-content" id="ReviewTabContent">
                                @php $active_tab = true; @endphp
                                @if( !empty( $product->full_description))
                                    <div class="tab-pane fade @if($active_tab) show active @endif " id="description" role="tabpanel" aria-labelledby="description-tab">
                                        <div class="product-description">
                                            {!! $product->full_description !!}
                                        </div>
                                    </div>
                                    @php $active_tab = false; @endphp
                                @endif
                                @if( !empty( setting('site.shipping_policy') ))
                                    <div class="tab-pane fade @if($active_tab) show active @endif " id="shipping-policy" role="tabpanel" aria-labelledby="shipping-policy-tab">
                                        <div class="product-shipping-policy">
                                            {!! setting('site.shipping_policy') !!}
                                        </div>
                                    </div>
                                    @php $active_tab = false; @endphp
                                @endif
                                @if( !empty( $product->size_chart))
                                    <div class="tab-pane fade @if($active_tab) show active @endif " id="size-chart" role="tabpanel" aria-labelledby="size-chart-tab">
                                        <div class="product-size-chart">
                                            <div class="table">
                                                {!! $product->size_chart !!}
                                            </div>
                                        </div>
                                    </div>
                                    @php $active_tab = false; @endphp
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--== End Product Single Area Wrapper ==-->

        <!--== Start Product Area Wrapper ==-->
        <section class="product-area product-new-arrivals-area product-related-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 m-auto">
                        <div class="section-title text-center"  >
                            <h2 class="title">{{ __('messages.related_products') }}</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="swiper-container swiper-slide-gap product-slider-container">
                            <div class="swiper-wrapper">
                                @foreach ($relatedProducts as $relatedProduct)
                                    <div class="swiper-slide">
                                        <!--== Start Shop Item ==-->
                                        @include( 'product-item', ['product' => $relatedProduct] )
                                        <!--== End Shop Item ==-->
                                    </div>
                                @endforeach
                            </div>
                            <!--== Add Swiper navigation Buttons ==-->
                            <div class="swiper-button-prev"><i class="ei ei-icon_arrow_carrot-left"></i></div>
                            <div class="swiper-button-next"><i class="ei ei-icon_arrow_carrot-right"></i></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--== End Product Area Wrapper ==-->
    </main>
@endsection

