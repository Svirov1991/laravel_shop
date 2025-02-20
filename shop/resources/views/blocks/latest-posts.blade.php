<!--== Start Blog Area Wrapper ==-->
<section class="blog-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 m-auto">
                <div class="section-title text-center">
                    <h2 class="title">{{ $attributes['fields']['block-title'] ?? '' }}</h2>
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
