@if( $featured_products || $discounted_products )
    <!--== Start Product Area Wrapper ==-->
    <section class="product-area">
        <div class="container product-pb" data-padding-bottom="25">
            <div class="row">
                <div class="col-12">
                    <div class="product-category-tab-wrap">
                        <ul class="nav nav-tabs product-category-nav justify-content-center" id="myTab" role="tablist">
                            @php $a = false; @endphp
                            @if( count( $featured_products ) )
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link @if( !$a ) active @endif" id="best-seller-tab" data-bs-toggle="tab" data-bs-target="#bestSeller" type="button" role="tab" aria-controls="bestSeller" aria-selected="true">{{ __('messages.popular') }}</button>
                                </li>
                                @php $a = true; @endphp
                            @endif
                            @if( count( $discounted_products ) )
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link @if( !$a ) active @endif" id="most-view-tab" data-bs-toggle="tab" data-bs-target="#mostView" type="button" role="tab" aria-controls="mostView" aria-selected="false">{{ __('messages.discounts') }}</button>
                                </li>
                                @php $a = true; @endphp
                            @endif
                        </ul>
                        <div class="tab-content product-category-content" id="myTabContent">
                            @php $a = false; @endphp
                            @if( count( $featured_products ) )
                                <div class="tab-pane fade show @if( !$a ) active @endif " id="bestSeller" role="tabpanel" aria-labelledby="best-seller-tab">
                                    <div class="row">
                                        @foreach( $featured_products as $product)
                                            <div class="col-sm-6 col-lg-4 col-xl-3">
                                                <!--== Start Shop Item ==-->
                                                @include( 'product-item', ['product' => $product, 'img' => 4] )
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                                @php $a = true; @endphp
                            @endif
                            @if( count( $discounted_products) )
                                <div class="tab-pane fade @if( !$a ) active @endif " id="mostView" role="tabpanel" aria-labelledby="most-view-tab">
                                    <div class="row">
                                        @foreach( $discounted_products as $product)
                                            <div class="col-sm-6 col-lg-4 col-xl-3">
                                                <!--== Start Shop Item ==-->
                                                @include( 'product-item', ['product' => $product, 'img' => 4] )
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                                @php $a = true; @endphp
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--== End Product Area Wrapper ==-->
@endif
