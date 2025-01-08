<?php

use Illuminate\Support\Facades\Storage;

if (!function_exists('isDiscont')) {
    function isDiscont( $product): bool
    {
        if( !empty($product->discount_price) && $product->discount_price < $product->price ) {
           return true;
        }
        return false;
    }
}

if (!function_exists('isFavorites')) {
    function isFavorites(int $productId): bool
    {
        static $favorites = null;

        // Загружаем массив избранного только один раз
        if ($favorites === null) {
            $favorites = session()->get('favorites', []);
        }
        return in_array($productId, $favorites);
    }
}

if ( ! function_exists('getPrice')) {
    function getPrice($product)
    {
        if(is_object($product)){
            $price = $product->price;
            $discount_price = $product->discount_price;
        }else{
            $price = $product['price'];
            $discount_price = $product['discount_price'];
        }
        if ( !empty( $discount_price ) && $discount_price < $price ) {
            return $discount_price;
        }else{
            return $price;
        }
    }
}

if ( ! function_exists('getPrices')) {
    function getPrices($product)
    {
        if (is_object($product)) {
            $price          = $product->price;
            $discount_price = $product->discount_price;
        } else {
            $price          = $product['price'];
            $discount_price = $product['discount_price'];
        }
        if (empty($price)) {
            return '';
        }
        if ( ! empty($discount_price) && $discount_price < $price) {
            $price = '<span class="price">' . $discount_price . ' грн</span><span class="price-old">' . $price . ' грн</span>';
        } else {
            $price = '<span class="price">' . $price . ' грн</span>';
        }

        return '<div class="prices">' . $price . '</div>';
    }
}

if ( ! function_exists('getImage')) {
    function getImage($data = [])
    {
        $thumbnails = (empty($data['thumbnails'])) ? [] : $data['thumbnails'];
        $image      = (empty($data['image'])) ? '' : $data['image'];

        if (empty($thumbnails) && empty($image)) {
            return '';
        }
        $sizes = (empty($data['sizes'])) ? [] : $data['sizes'];

        if (empty($data['main_size'])) {
            $data['main_size'] = 1200;
        }
        if (empty($data['sizes'])) {
            $data['sizes'] = [600 => 100, 1000 => 50, 'default' => 33];
        }

        $srcset       = [];
        $srcset_sizes = [];
        foreach ($thumbnails as $thumbnail) {
            $url                               = Storage::disk(
                config('voyager.storage.disk')
            )->url(
                $thumbnail->url
            );
            $srcset[]                          = $url . ' ' . $thumbnail->width . 'w';
            $srcset_sizes[$thumbnail->width] = $url;
        }


        if (isset($srcset_sizes[$data['main_size']])) {
            $src = $srcset_sizes[$data['main_size']];
        } elseif ( ! empty($srcset_sizes)) {
            $thumbnail_sizes = array_keys($srcset_sizes);
            $greater         = array_filter(
                $thumbnail_sizes,
                fn($num) => $num >= $data['main_size']
            );
            $lesser          = array_filter(
                $thumbnail_sizes,
                fn($num) => $num < $data['main_size']
            );

            if ( ! empty($greater)) {
                $closest = min($greater);
            } else {
                $closest = max($lesser);
            }
            $src = $srcset_sizes[$closest];
        } elseif ( ! empty($image)) {
            $src = Storage::disk(config('voyager.storage.disk'))->url($image);
        } else {
            return '';
        }

        $create_sizes = [];
        foreach ($sizes as $k => $size) {
            if ( ! stripos($size, 'px') && ! stripos($size, 'vw')
                 && ! stripos(
                    $size,
                    '%'
                )
            ) {
                $size = $size . 'vw';
            }
            if ($k != 'default') {
                $create_sizes[] = "(max-width: " . $k . "px) " . $size;
            } else {
                $sizes[$k] = $size;
            }
        }
        if (isset($sizes['default'])) {
            $create_sizes[] = $sizes['default'];
        }

        $img = [];
        if ( ! empty($data['class'])) {
            $img[] = "class='{$data['class']}'";
        }
        $img[] = "src='" . $src . "'";
        if ( ! empty($srcset)) {
            $img[] = "srcset='" . implode(', ', $srcset) . "'";
        }
        if ( ! empty($create_sizes)) {
            $img[] = "sizes='" . implode(', ', $create_sizes) . "'";
        }
        if ( ! empty($data['alt'])) {
            $img[] = "alt='{$data['alt']}'";
        }

        return "<img " . implode(' ', $img) . ">";
    }
}


