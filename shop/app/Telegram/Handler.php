<?php

namespace App\Telegram;

use App\Models\Product;
use App\Models\ProductCategory;
use DefStudio\Telegraph\Handlers\WebhookHandler;
use DefStudio\Telegraph\Keyboard\Button;
use DefStudio\Telegraph\Keyboard\Keyboard;
use DefStudio\Telegraph\Models\TelegraphBot;
use DefStudio\Telegraph\Telegraph;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Stringable;

class Handler extends WebhookHandler
{
    public function handle(Request $request, TelegraphBot $bot): void
    {
        $token = $request->route('token');
        if ( $token != config('telegraph.main_bot_token') ) {
            app(Orders::class)->handle($request, $bot);
        } else {
            parent::handle($request, $bot);
        }

    }

//https://apps.timwhitlock.info/emoji/tables/unicode
    public function start()
    {
        $logo               = Storage::disk(
            config('voyager.storage.disk')
        )->url(
            setting('site.logo')
        );
        $description        = $this->sanitizeTelegramHtml( setting('site.telegram_description') );
        $keyboard           = [];
        $product_categories = ProductCategory::all();
        foreach ($product_categories as $product_category) {
            $keyboard[] = Button::make( "\xE2\xAD\x90 " . $product_category->title )->action(
                'category'
            )->param('cat_id', $product_category->id);
        }
        $url        = config('app.url');
        $keyboard[] = Button::make("\xF0\x9F\x92\xB8 Доставка та оплата")->action('deliveryAndPayment');
        $keyboard[] = Button::make("\xF0\x9F\x93\x84 Контакти")->action( 'contacts');
        $keyboard[] = Button::make("\xF0\x9F\x94\x97 Сайт")->url($url);

        $this->chat->photo($logo)->html($description)->keyboard(
            Keyboard::make()->buttons($keyboard)
        )->send();
    }

    public function category()
    {
        $productOffset = (int) $this->data->get('offset', 0);
        $categoryId = $this->data->get('cat_id');
        $count_products = Product::where('product_category_id', $categoryId)->where(
            'status', 'PUBLISHED'
        )->count();

        $product = Product::where('product_category_id', $categoryId)->where(
            'status', 'PUBLISHED'
        )->with(
            'category',
            'attributeValues'
        )->offset($productOffset)->first();


        $productHelper = new ProductHelper($product);
        $images        = $productHelper->productImages();
        $description   = $productHelper->productDescription();
        $keyboard      = $productHelper->productKeyboard(
            $count_products,
            $productOffset
        );
        $this->chat->mediaGroup($images)->send();
        $this->chat->html( $description )->keyboard( $keyboard )->send();

    }

    public function contacts(){
        $text = "<b>Контакти</b>";
        $text .= "\n\n" . "<b>Телефон:</b> <a href='tel:" . setting('site.phone') ."'>" . setting('site.phone') . "</a>";
        $text .= "\n\n" . "<b>Адреса:</b> " . setting('site.address');
        $text .= "\n\n" . "<b>Почта:</b> " . setting('site.mail');
        $keyboard = Keyboard::make()->buttons([ Button::make("\xE2\x86\xA9 Назад")->action('start') ]);
        $this->chat->photo(Storage::disk( config('voyager.storage.disk') )->url(setting('site.logo')))->html( $text )->keyboard( $keyboard )->send();
    }

    public function deliveryAndPayment()
    {
        $text = "<b>Доставка та оплата</b>";
        $text .= "\n\n" . Helper::sanitizeTelegramHtml(
                setting('site.shipping_policy')
            );
        $keyboard = Keyboard::make()->buttons(
            [ Button::make("\xE2\x86\xA9 Назад")->action('start') ]
        );
        $this->chat->photo( Storage::disk(config('voyager.storage.disk'))->url( setting('site.logo') ) )->html( $text )->keyboard($keyboard)->send();

    }

    public function handleChatMessage(Stringable $text): void
    {
        parent::handleChatMessage($text);
    }

    public function sanitizeTelegramHtml(string $html): string
    {
        $allowedTags = '<strong><b><i><u><s><code><pre><a>';
        $sanitizedHtml = strip_tags($html, $allowedTags);
        return $sanitizedHtml;
    }
}