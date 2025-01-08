<?php

namespace App\Telegram;

use App\Models\Product;
use DefStudio\Telegraph\Keyboard\Button;
use DefStudio\Telegraph\Keyboard\Keyboard;
use DefStudio\Telegraph\Telegraph;
use Illuminate\Support\Facades\Storage;

class ProductHelper
{
    protected $product;
    protected $productImages;
    protected $imagesCount;

    protected $currentImage;

    function __construct($product, $currentImage = 0 )
    {
        $this->product       = $product;
        $this->productImages = json_decode($product->images);
        $this->imagesCount   = count($this->productImages);
        $this->currentImage  = $currentImage;
    }

    public function productDescription(): string
    {
        $description = '<b>' . $this->product->title . '</b>';
        $price = '<b>' . $this->product->getPrice() . $this->product->getCurrencySymbol() . '</b>';
        if( $this->product->getOldPrice() ){
            $price .= '<s>' . $this->product->getOldPrice() . $this->product->getCurrencySymbol() . '</s>';
        }
        $description .= " - " . $price;
        $description .=  "\n\n" . Helper::sanitizeTelegramHtml( $this->product->description );
        $attributes = $this->product->getPrimeAttributesData();
        $attributes_text = [];
        foreach ( $attributes as $attribute ) {
            $values = [];

            foreach ($attribute->values as $value) {
                $values[] = $value->value;
            }
            $attributes_text[] = '<b>' . $attribute->name . '</b>: ' . implode(
                    ', ',
                    $values
                );
        }
        if ( ! empty($attributes_text)) {
            $description .= "\n\n" . implode("\n\n", $attributes_text);
        }

        return $description;
    }
    public function productKeyboard( $count_products = 1, $productOffset = 0, $image = 0 )
    {
        $keyboard = Keyboard::make();
        $buttons = [];

        // Products buttons (prev, next)
        $products_buttons = [];

        if ( $count_products > 1 ) {
            if( $productOffset - 1 >= 0 ){
                $products_buttons[] = Button::make("\xE2\xAC\x85 Попередній" )->action('category')->param('offset', $productOffset - 1 )->param('cat_id', $this->product->product_category_id );
            }
            if( $productOffset + 1 < $count_products ){
                $products_buttons[] = Button::make("Наступний \xE2\x9E\xA1" )->action('category')->param('offset', $productOffset + 1 )->param('cat_id', $this->product->product_category_id );
            }
        }
        if ( ! empty($products_buttons)) {
            $keyboard->row( $products_buttons );
        }

        $buttons[] = Button::make("\xE2\x9C\x85 Придбати")->url(
            Route('cart') . '?' . http_build_query( [ 'product_id' => $this->product->id ] )
        );
        $buttons[] = Button::make("\xF0\x9F\x94\x97 На сайті")->url(
            Route('single-item', [$this->product->category->slug, $this->product->slug])
        );
        $buttons[] = Button::make("\xE2\x86\xA9 Назад")->action('start');
        return $keyboard->buttons($buttons);

    }

    public function productImages(): array
    {
        $images = [];
        foreach ( $this->productImages as $img) {
                $images[] = [
                    'type'  => 'photo',
                    'media' => Storage::disk( config('voyager.storage.disk') )->url($img),
                ];
        }

        return $images;
    }

}