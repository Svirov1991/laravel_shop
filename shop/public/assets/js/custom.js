(function($) {

  "use strict";

  // Preloader
  function stylePreloader() {
    $('body').addClass('preloader-deactive');
  }

  // Background Image
  const bgSelector = $("[data-bg-img]");
  bgSelector.each(function (index, elem) {
    let element = $(elem),
      bgSource = element.data('bg-img');
    element.css('background-image', 'url(' + bgSource + ')');
  });

  // Margin Bottom
  $('[data-margin-bottom]').each(function() {
    $(this).css('margin-bottom', $(this).data("margin-bottom"));
  });
  // Padding Bottom
  $('[data-padding-bottom]').each(function() {
    $(this).css('padding-bottom', $(this).data("padding-bottom"));
  });

  // Off Canvas JS
  var canvasWrapper = $(".off-canvas-wrapper");
  $(".btn-menu").on('click', function() {
    canvasWrapper.addClass('active');
    $("body").addClass('fix');
  });

  $(".close-action > .btn-menu-close, .off-canvas-overlay").on('click', function() {
    canvasWrapper.removeClass('active');
    $("body").removeClass('fix');
  });

  // Review Form JS
  $(".review-write-btn").on('click', function() {
    $(".reviews-form-area, .review-write-btn").toggleClass("show").focus();
  });

  // Sticky Header Js
  var headroom = $(".sticky-header");
  headroom.headroom({
    offset: 280,
    tolerance: 5,
    classes: {
      initial: "headroom",
      pinned: "slideDown",
      unpinned: "slideUp",
      notTop: "sticky"
    }
  });

  //Responsive Slicknav JS
  $('.main-menu').slicknav({
    appendTo: '.res-mobile-menu',
    closeOnClick: false,
    removeClasses: true,
    closedSymbol: '<i class="fa fa-plus"></i>',
    openedSymbol: '<i class="fa fa-minus"></i>'
  });

  // Menu Activeion Js
  var cururl = window.location.pathname;
  var curpage = cururl.substr(cururl.lastIndexOf('/') + 1);
  var hash = window.location.hash.substr(1);
  if((curpage == "" || curpage == "/" || curpage == "admin") && hash=="")
    {
    } else {
      $(".header-navigation-area li").each(function()
    {
      $(this).removeClass("active");
    });
    if(hash != "")
      $(".header-navigation-area li a[href='"+hash+"']").parents("li").addClass("active");
    else
    $(".header-navigation-area li a[href='"+curpage+"']").parents("li").addClass("active");
  }

  // Popup Quick View JS
  var popupProduct = $(".product-quick-view-modal");
  $(".add-quick-view").on('click', function() {
    popupProduct.addClass('active');
    $("body").addClass("fix");
  });
  $(".btn-close, .canvas-overlay").on('click', function() {
    popupProduct.removeClass('active');
    $("body").removeClass("fix");
  });

  // Swiper Slider Js
    var carouselSlider = new Swiper('.default-slider-container', {
      slidesPerView : 1,
      slidesPerGroup: 1,
      loop: true,
      speed: 500,
      spaceBetween : 0,
      effect: 'fade',
      fadeEffect: {
        crossFade: true,
      },
      autoplay: {
        delay: 4000,
      },
      navigation: {
          nextEl: '.default-slider-container .swiper-button-next',
          prevEl: '.default-slider-container .swiper-button-prev',
      },
    });

  // Product Slider Js
    var swiper = new Swiper('.product-slider-container', {
      autoplay: false,
      slidesPerView : 4,
      slidesPerGroup: 1,
      spaceBetween: 30,
      speed: 600,
      navigation: {
        nextEl: '.product-slider-container .swiper-button-next',
        prevEl: '.product-slider-container .swiper-button-prev',
      },
      breakpoints: {
        1200: {
          slidesPerView : 4,
          spaceBetween: 30,
        },
        992: {
          slidesPerView : 3,
          spaceBetween: 30,
        },
        576: {
          slidesPerView : 2,
          spaceBetween: 30,
        },
        0: {
          slidesPerView : 1,
          spaceBetween: 30,
        },
      }
    });

  // Brand Logo Slider Js
    var swiper = new Swiper('.brand-logo-slider-container', {
      autoplay: false,
      slidesPerView : 6,
      slidesPerGroup: 1,
      spaceBetween: 0,
      speed: 500,
      breakpoints: {
        1200: {
          slidesPerView : 6,
          spaceBetween : 0,
        },
        992: {
          slidesPerView : 4,
          spaceBetween : 0,
        },
        576: {
          slidesPerView : 3,
          spaceBetween : 0,
        },
        480: {
          slidesPerView : 2,
          spaceBetween : 0,
        },
        0: {
          slidesPerView : 1,
          spaceBetween : 0,
        },
      }
    });

  // Post Slider Js
    var swiper = new Swiper('.post-slider-container', {
      autoplay: false,
      slidesPerView : 2,
      slidesPerGroup: 1,
      spaceBetween: 30,
      speed: 600,
      navigation: {
        nextEl: '.post-slider-container .swiper-button-next',
        prevEl: '.post-slider-container .swiper-button-prev',
      },
      breakpoints: {
        1200: {
          slidesPerView : 3,
          spaceBetween: 30,
        },
        768: {
          slidesPerView : 2,
          spaceBetween: 30,
        },
        0: {
          slidesPerView : 1,
          spaceBetween: 30,
        },
      }
    });

  // Product Single Thumb Slider2 Js
    var ProductNav = new Swiper('.single-product-nav-slider', {
      spaceBetween: 19,
      slidesPerView: 4,
      slidesPerGroup: 1,
      watchSlidesVisibility: true,
      watchSlidesProgress: true,
      navigation: {
        nextEl: '.single-product-nav-slider .swiper-button-next',
        prevEl: '.single-product-nav-slider .swiper-button-prev',
      },
      breakpoints: {
        576: {
          slidesPerView : 4,
          spaceBetween: 19,
        },
        0: {
          slidesPerView : 2,
          spaceBetween: 15,
        },
      }
    });
    var ProductThumb = new Swiper('.single-product-thumb-slider', {
      effect: 'fade',
      fadeEffect: {
        crossFade: true,
      },
      thumbs: {
        swiper: ProductNav
      }
    });

  // Fancybox Js
  $('.image-popup').fancybox();
  $('.video-popup').fancybox();

  // Product Quantity JS
  var proQty = $(".pro-qty");
  proQty.append('<div class="inc qty-btn">+</div>');
  proQty.append('<div class= "dec qty-btn">-</div>');
  $('.qty-btn').on('click', function (e) {
    e.preventDefault();
    var $button = $(this);
    var oldValue = $button.parent().find('input').val();
    if ($button.hasClass('inc')) {
      var newVal = parseFloat(oldValue) + 1;
    } else {
      // Don't allow decrementing below zero
      if (oldValue > 1) {
        var newVal = parseFloat(oldValue) - 1;
      } else {
        newVal = 1;
      }
    }
    $button.parent().find('input').val(newVal).change();
  });

  // Countdown Js
  $(".ht-countdown").each(function(index, element) {
    var $element = $(element),
    $date = $element.data('date');
    $element.countdown($date, function(event) {
      var $this = $(this).html(event.strftime(''
      +
      '<div class="countdown-item"><span class="countdown-item__time">%D</span><span class="countdown-item__label">Day</span></div>' +
      '<div class="countdown-item"><span class="countdown-item__time">%H</span><span class="countdown-item__label">Hours</span></div>' +
      '<div class="countdown-item"><span class="countdown-item__time">%M</span><span class="countdown-item__label">Mins</span></div>' +
      '<div class="countdown-item"><span class="countdown-item__time">%S</span><span class="countdown-item__label">Secs</span></div>'));
    });
  });

  function scrollToTop() {
    var $scrollUp = $('#scroll-to-top'),
      $lastScrollTop = 0,
      $window = $(window);
      $window.on('scroll', function () {
      var st = $(this).scrollTop();
        if (st > $lastScrollTop) {
            $scrollUp.removeClass('show');
        } else {
          if ($window.scrollTop() > 120) {
            $scrollUp.addClass('show');
          } else {
            $scrollUp.removeClass('show');
          }
        }
        $lastScrollTop = st;
    });
    $scrollUp.on('click', function (evt) {
      $('html, body').animate({scrollTop: 0}, 50);
      evt.preventDefault();
    });
  }
  scrollToTop();

/* ==========================================================================
   When document is loading, do
   ========================================================================== */
  var varWindow = $(window);
  varWindow.on('load', function() {
    stylePreloader();
  });

        // Функция для отправки запроса


    // Интервал в 2 минуты (120000 миллисекунд)
    // updateData();
    // setInterval(updateData, 70000);

    $('.change-currency').on('click', function(){
        let currency = $(this).data('currency');
        if( currency !== '' && currency !== undefined){
            $.ajax({
                url: urlSetCurrency,
                method: 'POST',
                data: {
                    code: currency,
                    _token: $('meta[name="csrf-token"]').attr('content')
                },
                success: function (response) {
                    location.reload();
                },
                error: function (xhr, status, error) {
                    showToast(xhr.responseJSON.message, 'error');
                }
            });
        }
    })

    $('.star-content i, .rating-box i').on('mouseenter', function () {
        const index = parseInt($(this).data('index'));

        $(this).parent().find('i').removeClass('active');

        $(this).parent().find('i').each(function () {
            if (parseInt($(this).data('index')) <= index) {
                $(this).addClass('active');
            }
        });
    });

    $('.star-content, .rating-box i').on('mouseleave', function () {
        $('.star-content i, .rating-box i').removeClass('active');
    });

    $('.star-content i, .rating-box i').on('click', function () {
        let product_id = $(this).parent().data('id');
        let rating = $(this).data('index');
        if( product_id !== '' || product_id !== undefined){
            $.ajax({
                url: urlUpdateProductRating,
                method: 'POST',
                data: {
                    product_id: product_id,
                    rating: rating,
                    _token: $('meta[name="csrf-token"]').attr('content')
                },
                success: function (response) {
                    showToast(response.message);
                },
                error: function (xhr, status, error) {
                    showToast(xhr.responseJSON.message, 'error');
                }
            });
        }
    })

})(window.jQuery);
function updateData() {
    // $.ajax({
    //     url: '/np/update',
    //     method: 'GET',
    //     success: function (response) {
    //         console.log('Данные обновлены:', response);
    //     },
    //     error: function (xhr, status, error) {
    //         console.error('Ошибка при обновлении данных:', error);
    //     }
    // });
}
$(".product_form").on('click', function() {
    let attributes = $( this ).parents( 'form' ).find( 'select[name^="attribute"]' ).map( function () {
        return $( this ).val();
    } ).get();
    var submitValue = $(this).data('type');
    var product_id = $(this).parents('form').find('input[name=product_id]').val();
    var count = $(this).parents('form').find('input[name=count]').val();
    addToCart(product_id, count, attributes, submitValue);
})

function clearCard(){
    $.ajax({
        url: urlClearCart,
        method: 'POST',
        data: {
            _token: $('meta[name="csrf-token"]').attr('content')
        },
        success: function(response) {
            window.location.href = response.url;
        },
        error: function(xhr, status, error) {
            showToast(xhr.responseJSON.message, 'error');
        }
    });
}
function changeAttribute(cart_item_id, el){
    let attributes = $( el ).parents( '.cart-item-' + cart_item_id ).find( 'select[name^="attribute"]' ).map( function () {
        let name = $( this ).attr('name');
        let value = $( this ).val();
        $( '.cart-item-' + cart_item_id ).find( 'select[name^="' + name + '"]' ).val( value );
        if(value === '' || value === undefined){
            value = null;
        }
        return value;
    } ).get().filter(value => value !== null);

    let count = $( el ).parents( '.cart-item-' + cart_item_id ).find('input[name^="count"]').val();
    $( '.cart-item-' + cart_item_id ).find('input[name^="count"]').val( count );
    if($( '.cart-item-' + cart_item_id + ' .product-quantity').length > 0){
        $( '.cart-item-' + cart_item_id + ' .product-quantity').text(count + ' ×');
    }
    $('.product-quantity')
    $.ajax({
        url: urlUpdateCart,
        method: 'POST',
        data: {
            cart_item_id: cart_item_id,
            attributes: attributes,
            count: count,
            _token: $('meta[name="csrf-token"]').attr('content')
        },
        success: function(response) {
            if( $( '.cart-item-' + cart_item_id ).find('.product-subtotal ,price').length > 0 ){
                $( '.cart-item-' + cart_item_id ).find('.product-subtotal ,price').text(response.products_price + ' ' + response.symbol)
            }
            if($('.cart-total-price').length > 0){
                $('.cart-total-price').text(response.totalPrice + ' ' + response.symbol);
            }
            showToast(response.message);
        },
        error: function(xhr, status, error) {
            showToast(xhr.responseJSON.message, 'error')
        }
    });
}

function addToCart(productId, count = 1, attributes = null, type = 0) {
    $.ajax({
        url: urlAddToCart,
        method: 'POST',
        data: {
            product_id: productId,
            attributes: attributes,
            count: count,
            _token: $('meta[name="csrf-token"]').attr('content')
        },
        success: function(response) {

            if ( type == 1 ) {
                window.location.href = urlCart;
            } else {
                $( '#cart-count' ).text( response.totalItems );
                if ( $( '.cart-count' ).length > 0 ) {
                    $( '.cart-count' ).text( response.totalItems );
                }
                if ( $( '.cart-total-price' ).length > 0 ) {
                    $( '.cart-total-price' ).text( response.totalPrice );
                }
                $('.mini-cart').html( response.miniCart );
                showToast(response.message)
            }
        },
        error: function(xhr, status, error) {
            showToast(xhr.responseJSON.message, 'error')

        }
    });
}
function removeFromCart( cart_item_id ){
    $.ajax({
        url: urlRemoveFromCart,
        method: 'POST',
        data: {
            cart_item_id: cart_item_id,
            _token: $('meta[name="csrf-token"]').attr('content')
        },
        success: function(response) {

            $('.cart-item-' + cart_item_id).remove();
            if( response.totalItems == 0 ){
                $('.mini-cart-dropdown').remove();
            }
            $('#cart-count').text(response.totalItems);
            if ( $( '.cart-count' ).length > 0 ) {
                $( '.cart-count' ).text( response.totalItems );
            }
            if ( $('.cart-total-price').length > 0 ) {
                $('.cart-total-price').text(response.totalPrice);
            }
            showToast(response.message);
        },
        error: function(xhr, status, error) {
            showToast(xhr.responseJSON.message, 'error');
        }
    });
}

function toogleFavorit( id, el ){
    $.ajax({
        url: urlFavorites,
        method: 'POST',
        data: {
            id: id,
            _token: $('meta[name="csrf-token"]').attr('content')
        },
        success: function(response) {
            showToast(response.message);
            if( response.toggle == true ){
                $(el).addClass('active');
            }else{
                $(el).removeClass('active');
            }

            if( $(el).parent().hasClass('product-wishlist') ){
                $(el).parent().remove();
            }

            $('#favorites_count').text(response.count);
        },
        error: function(xhr, status, error) {
            showToast(xhr.responseJSON.message, 'error');
        }
    });
}


// function fetchUrl() {
//     fetch('/np-update')
//         .then(response => {
//             if (!response.ok) {
//                 throw new Error('Network response was not ok');
//             }
//             return response.json();
//         })
//         .then(data => {
//             console.log('Response data:', data);
//         })
//         .catch(error => {
//             console.error('There was a problem with the fetch operation:', error);
//         });
// }

function showToast(message, type = 'success') {
    const toastId = `toast-${Date.now()}`;

    const bg = type === 'success' ? '40, 167, 69, 0.70' : '220, 53, 69, 0.70';

    const toastHTML = `
        <div id="${toastId}" class="toast align-items-center text-white border-20" style="background-color: rgba(${bg}); padding: 10px 20px; margin-bottom: 10px;" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="3000">
            <div class="d-flex">
                <div class="toast-body">
                    ${message}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Закрыть"></button>
            </div>
        </div>
    `;

    $('#toastContainer').append(toastHTML);

    const $toast = $(`#${toastId}`);
    const toast = new bootstrap.Toast($toast[0]);
    toast.show();

    $toast.on('hidden.bs.toast', function () {
        $(this).remove();
    });
}

$(document).ready(function () {
    if( $('.phone-mask').length > 0 ){
        $('.phone-mask').mask('+38 (999) 999-99-99', {autoclear: false});
    }

    var subscribeForm = $('#form_subscribe');
    $(subscribeForm).submit(function(e) {
        e.preventDefault();

        // Получение токена reCAPTCHA
        grecaptcha.ready(function() {
            grecaptcha.execute( recaptcha_site_key, { action: 'subscribe' }).then(function(token) {

                subscribeForm.find( 'input[name="recaptcha_token"]' ).val( token );
                let formData = subscribeForm.serialize();

                // Отправляем форму через AJAX
                $.ajax({
                    url: subscribeForm.attr('action'),
                    method: 'POST',
                    data: formData,
                    success: function(response) {
                        showToast(response.message);
                    },
                    error: function(xhr, status, error) {
                        showToast(xhr.responseJSON.message, 'error');
                    }
                });
            });
        });
    });

})
