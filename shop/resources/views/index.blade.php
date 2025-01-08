@extends('layout.base')
@section('meta-tags')
    @include('includes.meta-tags')
@endsection
@section('content')
<main class="main-content">
    @if( !empty($main_banner))
    <!--== Start Hero Area Wrapper ==-->
    <section class="home-slider-area">
        <div class="swiper-container swiper-slide-gap home-slider-container default-slider-container">
            <div class="swiper-wrapper home-slider-wrapper slider-default">
                @foreach( $main_banner as $k => $banner )
                    <div class="swiper-slide">
                        <div class="slider-content-area" data-bg-img="/storage/{{$banner->image}}">
                            <div class="slider-content">
                                <h2 class="title">{{$banner->title}}</h2>
                                {!! $banner->description !!}
                                @if( $banner->button_link )
                                    <a class="btn-slider" href="{{$banner->button_link}}">@if( empty($banner->button_text)) {{ __('messages.read_more') }} @else {{ $banner->button_text }} @endif</a>
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

            <!--== Add Swiper Arrows ==-->
            <div class="swiper-button-next"><i class="ion-ios7-arrow-right"></i></div>
            <div class="swiper-button-prev"><i class="ion-ios7-arrow-left"></i></div>
        </div>
    </section>
    @endif
    <!--== End Hero Area Wrapper ==-->

    <!--== Start Feature Area Wrapper ==-->
    <section class="feature-area">
        <div class="container pb-1">
            <div class="row">
                <div class="col-md-6 col-lg-4">
                    <!--== Start Feature Item ==-->
                    <div class="feature-icon-box">
                        <div class="inner-content">
                            <div class="icon-box">
                                <i class="icon ei ei-icon_pin_alt"></i>
                            </div>
                            <div class="content">
                                <h5 class="title">{{ __('messages.free_delivery') }}</h5>
                                <p>{{ __('messages.free_delivery_subtitle') }}</p>
                            </div>
                        </div>
                    </div>
                    <!--== End Feature Item ==-->
                </div>
                <div class="col-md-6 col-lg-4">
                    <!--== Start Feature Item ==-->
                    <div class="feature-icon-box">
                        <div class="inner-content">
                            <div class="icon-box">
                                <i class="icon ei ei-icon_headphones"></i>
                            </div>
                            <div class="content">
                                <h5 class="title">{{ __('messages.support') }}</h5>
                                <p>{{ __('messages.support_subtitle') }}</p>
                            </div>
                        </div>
                    </div>
                    <!--== End Feature Item ==-->
                </div>
                <div class="col-md-6 col-lg-4">
                    <!--== Start Feature Item ==-->
                    <div class="feature-icon-box">
                        <div class="inner-content mb-0">
                            <div class="icon-box">
                                <i class="icon ei ei-icon_creditcard"></i>
                            </div>
                            <div class="content">
                                <h5 class="title">{{ __('messages.secure_payment') }}</h5>
                                <p>{{ __('messages.secure_payment_subtitle') }}</p>
                            </div>
                        </div>
                    </div>
                    <!--== End Feature Item ==-->
                </div>
            </div>
        </div>
    </section>
    <!--== End Feature Area Wrapper ==-->

    <!--== Start Product Area Wrapper ==-->
    <section class="product-area">
        <div class="container product-pb" data-padding-bottom="25">
            <div class="row">
                <div class="col-12">
                    <div class="product-category-tab-wrap">
                        <ul class="nav nav-tabs product-category-nav justify-content-center" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="best-seller-tab" data-bs-toggle="tab" data-bs-target="#bestSeller" type="button" role="tab" aria-controls="bestSeller" aria-selected="true">Популярное</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="most-view-tab" data-bs-toggle="tab" data-bs-target="#mostView" type="button" role="tab" aria-controls="mostView" aria-selected="false">Скидки</button>
                            </li>

                        </ul>
                        <div class="tab-content product-category-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="bestSeller" role="tabpanel" aria-labelledby="best-seller-tab">
                                <div class="row">
                                    @foreach( $featured_products as $product)
                                        <div class="col-sm-6 col-lg-4 col-xl-3">
                                            <!--== Start Shop Item ==-->
                                            @include( 'product-item', ['product' => $product, 'img' => 4] )
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="tab-pane fade" id="mostView" role="tabpanel" aria-labelledby="most-view-tab">
                                <div class="row">
                                        @foreach( $discounted_products as $product)
                                            <div class="col-sm-6 col-lg-4 col-xl-3">
                                                <!--== Start Shop Item ==-->
                                                @include( 'product-item', ['product' => $product, 'img' => 4] )
                                            </div>
                                        @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--== End Product Area Wrapper ==-->

    <!--== Start Single Banner Wrapper ==-->
    <section>
        <div class="container pt-0 pb-0">
            <div class="row">
                @foreach( $categories as $category)
                    <div class="col-sm-6">
                        <!--== Start Single Banner Item ==-->
                        <div class="single-banner-image" style="position: relative;">
                            <a href="{{ Route('handle-slug', [ $category->slug ] ) }}">
                                <img class="w-100" src="/storage/{{ $category->image }}" alt="{{ $category->title }}">
                                <div class="single-banner-image-info"><p>{{ $category->title }}</p></div>
                            </a>
                        </div>
                        <!--== End Single Banner Item ==-->
                    </div>
                @endforeach
            </div>
        </div>
    </section>
    <!--== End Single Banner Wrapper ==-->
        @if( !empty($home_page) && !empty($home_page->body) )
        <section class="blog-details-area">
            <div class="container">
                <div class="row flex-row-reverse">
                    <div class="col-lg-12">
                        <div class="blog-details-content-wrap">
                            <div class="thumb">
                                {!! getImage( [
                                    'image' => $home_page->image,
                                    'thumbnails' => [],
                                    'main_size' => 1170,
                                    'sizes' => [ 1200 => 100, 'default' => '1170px'],
                                    'alt' => $home_page->title,
                                    ] ) !!}
                            </div>
                            <div class="content-info">
                                <h4 class="title">{{ $home_page->title }}</h4>
                            </div>
                            <div class="content">
                                {!! $home_page->body !!}
                            </div>
                        </div>
                    </div>
                    <style>
                        .blog-details-content-wrap .content{
                            p{
                                margin-top: 10px;
                            }

                            li{
                                color: #222;
                                margin-top: 5px;
                                font-size: 14px;
                                line-height: 20px;
                                letter-spacing: 0.3px;
                                margin-left: 20px;
                            }

                            li::before {
                                content: "-"; /* Добавляем тире */
                                margin-right: 8px; /* Отступ между тире и текстом */
                                color: #000; /* Цвет тире */
                            }
                        }
                    </style>
                </div>
            </div>
        </section>
        @endif
    <!--== Start Blog Area Wrapper ==-->
    <section class="blog-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 m-auto">
                    <div class="section-title text-center">
                        <h2 class="title">{{ __('messages.latest_posts') }}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="swiper-container swiper-slide-gap post-slider-container">
                        <div class="swiper-wrapper">
                            @foreach($latest_posts as $post)
                                <div class="swiper-slide">
                                    <!--== Start Blog Item ==-->
                                    <div class="post-item">
                                        <div class="inner-content">
                                            <div class="thumb">
                                                <a href="{{ route('single-item', [ $post->category->slug, $post->slug ]) }}">
                                                    <img class="w-100" src="/storage/{{ $post->image }}" alt="{{ $post->title }}">
                                                </a>
                                            </div>
                                            <div class="content">
                                                <ul class="meta">
                                                    <li><span>{{ $post->created_at->format('d.m.Y') }}</span></li>
                                                </ul>
                                                <h4 class="title"><a href="{{ route('single-item', [ $post->category->slug, $post->slug ]) }}">{{ $post->title }}</a></h4>
                                                <p>{{ $post->excerpt }}</p>
                                                <a class="btn-theme" href="{{ route('single-item', [ $post->category->slug, $post->slug ]) }}">{{ __('messages.read_more') }}</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--== End Blog Item ==-->
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
    <!--== End Blog Area Wrapper ==-->
</main>
@endsection
