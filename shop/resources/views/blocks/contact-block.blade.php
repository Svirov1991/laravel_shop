<!--== Start Contact Info Area Wrapper ==-->
<section class="contact-info-area">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-4">
                <div class="contact-info-item">
                    <h4>{{ __('messages.our_contacts') }}</h4>
                    <p><a href="mailto://{{ setting('site.phone') }}">{{ setting('site.mail') }}</a></p>
                    <p><a href="tel:{{ setting('site.phone') }}">{{ setting('site.phone') }}</a></p>
                </div>
            </div>
            <div class="col-md-6 col-lg-4">
                <div class="contact-info-item">
                    <h4>{{ __('messages.our_office') }}</h4>
                    <p>{{ setting('site.address') }}</p>
                </div>
            </div>
            <div class="col-md-6 offset-md-3 col-lg-4 offset-lg-0">
                <div class="contact-info-item">
                    <h4>{{ __('messages.wholesale_orders') }}</h4>
                    <p><a href="tel:{{ setting('site.phone') }}">{{ setting('site.phone') }}</a></p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--== End Contact Info Area Wrapper ==-->
