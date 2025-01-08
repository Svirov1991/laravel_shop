<?php

namespace App\Telegram;

use DefStudio\Telegraph\Handlers\WebhookHandler;
use DefStudio\Telegraph\Keyboard\Button;
use DefStudio\Telegraph\Keyboard\Keyboard;
use DefStudio\Telegraph\Models\TelegraphBot;
use DefStudio\Telegraph\Telegraph;
use Illuminate\Support\Facades\Storage;

class Orders extends WebhookHandler
{
    public function start()
    {
        $logo        = Storage::disk(
            config('voyager.storage.disk')
        )->url(
            setting('site.logo')
        );
        $description = 'Цей бот служить для надсилання інформації про нові замовлення. Щоб отримувати інформацію про замовлення на сайті адмін повинен підтвердити, що ви є довіреним користувачем (зверніться до адміну сайту)';
        $keyboard    = [];

        $url = config('app.url');
        if (config('telegraph.main_bot')) {
            $keyboard[] = Button::make("\xF0\x9F\x94\xA5 Бот магазину")->url(
                'https://t.me/' . config('telegraph.main_bot')
            );
        }
        $keyboard[] = Button::make("\xF0\x9F\x94\x97 Сайт")->url($url);

        $this->chat->photo($logo)->html($description)->keyboard(
            Keyboard::make()->buttons($keyboard)
        )->send();
    }

    static function sendMessageAdmin(string $message): void
    {
        $token = config('telegraph.orders_bot_token');
        if ( ! $token) {
            return;
        }
        $bot     = TelegraphBot::firstWhere('token', $token);
        $chat_id = setting('site.orders_chat');
        if ($bot && $chat_id) {
            $logo = Storage::disk(
                config('voyager.storage.disk')
            )->url(
                setting('site.logo')
            );
            app(Telegraph::class)->bot($bot)->chat($chat_id)->photo(
                $logo
            )->html($message)->send();
        }
    }
}