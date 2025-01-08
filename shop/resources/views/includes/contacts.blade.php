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

<!--== Start Contact Area Wrapper ==-->
<section class="contact-area">
    <div class="container">
        <div class="row">
            @if ( !empty(session('success')) )
                <div class="col-12">
                    <div class="section-title">
                        <h2>{{ session('success') }}</h2>
                    </div>
                </div>
            @else
            <div class="col-12">
                <div class="section-title">
                    <h2>
                        @if ( !empty(session('error')) )
                            {{ session('error') }}
                        @else
                            {{ __('messages.contact_us') }}
                        @endif
                    </h2>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="contact-form-content">
                    <!--== Start Rsvp Form ==-->
                    <div class="contact-form">
                        <form id="contact_form" action="{{ Route('contact-form') }}" method="POST" class="recaptcha" >
                            @csrf
                            <input type="hidden" name="recaptcha_token" >
                            @if ($errors->has('recaptcha_token'))
                                <div class="text-danger">
                                    {{ $errors->first('recaptcha_token') }}
                                </div>
                            @endif
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input class="form-control" type="text" name="first_name" value="{{ old('first_name') }}" placeholder="{{ __('messages.name') }}*" required>
                                        @if ($errors->has('first_name'))
                                            <div class="text-danger">
                                                {{ $errors->first('first_name') }}
                                            </div>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input class="form-control" type="email" name="email" value="{{ old('email') }}" placeholder="{{ __('messages.email') }}">
                                        @if ($errors->has('email'))
                                            <div class="text-danger">
                                                {{ $errors->first('email') }}
                                            </div>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input class="form-control phone-mask" type="text" name="phone" value="{{ old('phone') }}" placeholder="{{ __('messages.phone') }}*" required>
                                        @if ($errors->has('phone'))
                                            <div class="text-danger">
                                                {{ $errors->first('phone') }}
                                            </div>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea class="form-control" name="message" value="{{ old('message') }}" placeholder="{{ __('messages.you_message') }}"></textarea>
                                        @if ($errors->has('message'))
                                            <div class="text-danger">
                                                {{ $errors->first('message') }}
                                            </div>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group text-center">
                                        <button class="btn btn-link btn-contact" type="submit">{{ __('messages.send_message') }}</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="form-message"></div>
                </div>
            </div>
            @endif
        </div>
    </div>
</section>
@push('scripts')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
@endpush
