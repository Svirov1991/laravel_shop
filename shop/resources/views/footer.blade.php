<!--== Start Footer Area Wrapper ==-->
<footer class="footer-area">
    <div class="footer-top-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-lg-3">
                    <!--== Start widget Item ==-->
                    <div class="widget-item">
                        <div class="about-widget">
                            <div class="footer-logo-area">
                                <a href="{{ Route('home') }}">
                                    <img class="logo-main" src="/storage/{{ setting('site.logo') }}" alt="Logo" />
                                </a>
                            </div>
                            <p class="desc">{{ setting('site.description') }}</p>
                            <ul>
                                @if( !empty(setting('site.address')))
                                <li><i class="ion-ios7-location-outline"></i> {{ setting('site.address') }}</li>
                                @endif
                                @if( !empty(setting('site.mail')))
                                    <li><i class="ion-ios7-email-outline"></i> <a href="mailto://{{ setting('site.mail') }}">{{ setting('site.mail') }}</a></li>
                                @endif
                            </ul>
                        </div>
                    </div>
                    <!--== End widget Item ==-->
                </div>
                <div class="col-sm-6 col-lg-3">
                    <!--== Start widget Item ==-->
                    <div class="widget-item widget-item-one">
                        <h4 class="widget-title">{{ __('messages.categories') }}</h4>
                        <div class="widget-menu-wrap">
                            {{ menu('Footer 1', 'menu-footer') }}
                        </div>
                    </div>
                    <!--== End widget Item ==-->
                </div>
                <div class="col-sm-6 col-lg-3">
                    <!--== Start widget Item ==-->
                    <div class="widget-item widget-item-two">
                        <h4 class="widget-title">{{ __('messages.pages') }}</h4>
                        <div class="widget-menu-wrap">
                            {{ menu('Footer 2', 'menu-footer') }}
                        </div>
                    </div>
                    <!--== End widget Item ==-->
                </div>
                <div class="col-sm-6 col-lg-3">
                    <!--== Start widget Item ==-->
                    <div class="widget-item">
                        <h4 class="widget-title">{{ __('messages.newsletter') }}</h4>
                        <div class="widget-newsletter">
                            <p>{{ __('messages.subscribe') }}</p>
                            <div class="newsletter-form">
                                <form id="form_subscribe" action="{{ Route('subscribe-form') }}" method="POST">
                                    @csrf
                                    <input type="email" name="email" class="form-control" placeholder="{{ __('messages.email') }}">
                                    <input type="hidden" name="recaptcha_token" >
                                    @if ($errors->has('recaptcha'))
                                        <div class="alert alert-danger">
                                            {{ $errors->first('recaptcha') }}
                                        </div>
                                    @endif
                                    <button class="btn-submit" type="submit">{{ __('messages.newsletter') }}</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!--== End widget Item ==-->
                </div>
            </div>
        </div>

    </div>
    <!--== Start Footer Bottom ==-->
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <p class="copyright">© 2024, <span>{{ setting('site.title') }}</span>.</p>
                </div>
            </div>
        </div>
    </div>
    <!--== End Footer Bottom ==-->
</footer>
<!--== End Footer Area Wrapper ==-->

<!--== Scroll Top Button ==-->
<div id="scroll-to-top" class="scroll-to-top"><span class="fa fa-angle-double-up"></span></div>

<!--== Start Quick View Menu ==-->
<aside class="product-quick-view-modal">
    <div class="product-quick-view-inner">
        <div class="product-quick-view-content">
            <button type="button" class="btn-close">
                <span class="close-icon"><i class="fa fa-close"></i></span>
            </button>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="thumb">
                        <img src="/assets/img/shop/quick-view1.jpg" alt="Alan-Shop">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="content">
                        <h4 class="title">Meta Slevless Dress</h4>
                        <div class="prices">
                            <del class="price-old">$85.00</del>
                            <span class="price">$70.00</span>
                        </div>
                        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,</p>
                        <div class="quick-view-select">
                            <div class="quick-view-select-item">
                                <label for="forSizes" class="form-label">Size:</label>
                                <select class="form-select" id="forSizes" required>
                                    <option selected value="">s</option>
                                    <option>m</option>
                                    <option>l</option>
                                    <option>xl</option>
                                </select>
                            </div>
                            <div class="quick-view-select-item">
                                <label for="forColors" class="form-label">Color:</label>
                                <select class="form-select" id="forColors" required>
                                    <option selected value="">red</option>
                                    <option>green</option>
                                    <option>blue</option>
                                    <option>yellow</option>
                                    <option>white</option>
                                </select>
                            </div>
                        </div>
                        <div class="action-top">
                            <div class="pro-qty">
                                <input type="text" id="quantity4" title="Quantity" value="1" />
                            </div>
                            <button class="btn btn-black">Add to cart</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="canvas-overlay"></div>
</aside>
<!--== End Quick View Menu ==-->

<!--== Start Side Menu ==-->
<aside class="off-canvas-wrapper">
    <div class="off-canvas-inner">
        <div class="off-canvas-overlay"></div>
        <!-- Start Off Canvas Content Wrapper -->
        <div class="off-canvas-content">
            <!-- Off Canvas Header -->
            <div class="off-canvas-header">
                <div class="close-action">
                    <button class="btn-menu-close">menu <i class="fa fa-chevron-left"></i></button>
                </div>
            </div>

            <div class="off-canvas-item">
                <!-- Start Mobile Menu Wrapper -->
                <div class="res-mobile-menu menu-active-one">
                    <!-- Note Content Auto Generate By Jquery From Main Menu -->
                </div>
                <!-- End Mobile Menu Wrapper -->
            </div>
        </div>
        <!-- End Off Canvas Content Wrapper -->
    </div>
</aside>
<!--== End Side Menu ==-->

</div>
<div id="toastContainer" class="position-fixed top-0 end-0 p-3" style="z-index: 1055;"></div>

<!--=======================Javascript============================-->

<!--=== jQuery Modernizr Min Js ===-->
<script src="/assets/js/modernizr.js"></script>
<!--=== jQuery Min Js ===-->
<script src="/assets/js/jquery-main.js"></script>
<!--=== jQuery Migration Min Js ===-->
<script src="/assets/js/jquery-migrate.js"></script>
<!--=== jQuery Popper Min Js ===-->
<script src="/assets/js/popper.min.js"></script>
<!--=== jQuery Bootstrap Min Js ===-->
<script src="/assets/js/bootstrap.min.js"></script>
<!--=== jQuery Headroom Min Js ===-->
<script src="/assets/js/headroom.min.js"></script>
<!--=== jQuery Swiper Min Js ===-->
<script src="/assets/js/swiper.min.js"></script>
<!--=== jQuery Fancybox Min Js ===-->
<script src="/assets/js/fancybox.min.js"></script>
<!--=== jQuery Slick Nav Js ===-->
<script src="/assets/js/slicknav.js"></script>
<!--=== jQuery Countdown Js ===-->
<script src="/assets/js/countdown.js"></script>

<!--=== jQuery Custom Js ===-->
<script src="/assets/js/custom.js"></script>
@stack('scripts')


</body>

</html>
