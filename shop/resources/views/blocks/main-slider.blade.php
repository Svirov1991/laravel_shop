@if( !empty($attributes['fields']['list']))
    @php $list = json_decode($attributes['fields']['list'], true) @endphp
    <section class="home-slider-area">
        <div class="swiper-container swiper-slide-gap home-slider-container default-slider-container">
            <div class="swiper-wrapper home-slider-wrapper slider-default">
                @foreach($list as $item)
                    <div class="swiper-slide">
                        <div class="slider-content-area" data-bg-img="/storage/{{ $item['file'] }}">
                            <div class="slider-content">
                                <h2 class="title">{{ $item['slide-title'] }}</h2>
                                <h4>{{ $item['slide-subtitle'] }}</h4>
                                <p>{{ $item['slide-description'] }}</p>
                                @if( !empty( $item['link']) )
                                    <a class="btn-slider" href="{{$item['link']}}">@if( empty($item['link-text'])) {{ __('messages.read_more') }} @else {{ $item['link-text'] }} @endif</a>
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
