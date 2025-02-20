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
                            <h5 class="title">{{ $attributes['fields']['delivery-title'] ?? '' }}</h5>
                            <p>{{ $attributes['fields']['delivery-subtitle'] ?? '' }}</p>
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
                            <h5 class="title">{{ $attributes['fields']['support-title'] ?? '' }}</h5>
                            <p>{{ $attributes['fields']['support-subtitle'] ?? '' }}</p>
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
                            <h5 class="title">{{ $attributes['fields']['payment-title'] ?? '' }}</h5>
                            <p>{{ $attributes['fields']['payment-subtitle'] ?? '' }}</p>
                        </div>
                    </div>
                </div>
                <!--== End Feature Item ==-->
            </div>
        </div>
    </div>
</section>
<!--== End Feature Area Wrapper ==-->
