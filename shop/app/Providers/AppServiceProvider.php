<?php

namespace App\Providers;

use App\Models\Currency;
use App\Models\Product;
use App\Observers\ProductObserver;
use App\Services\FavoritesService;
use DefStudio\Telegraph\Models\TelegraphBot;
use DefStudio\Telegraph\Models\TelegraphChat;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use App\Services\CartService;
use App\Services\CurrencyService;
//use App\Listeners\ProcessProductImages;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Models\Setting;
use Illuminate\Support\Facades\Route;
use Illuminate\Auth\Notifications\VerifyEmail;
use App\Notifications\CustomVerifyEmail;
use App\Notifications\ResetPasswordNotification;
use Illuminate\Auth\Notifications\ResetPassword;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->singleton(FavoritesService::class, function ($app) {
            return new FavoritesService();
        });

        $this->app->singleton(CartService::class, function ($app) {
            return new CartService();
        });

        $this->app->singleton(CurrencyService::class, function ($app) {
            return new CurrencyService();
        });
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(FavoritesService $favoritesService ): void
    {
        Voyager::useModel('Post', \App\Models\Post::class);
        Voyager::useModel('Page', \App\Models\Page::class);
        Product::observe(ProductObserver::class);
        Paginator::useBootstrapFive();
        View::composer('header', function ($view) use ($favoritesService) {
            $view->with( 'favorites', $favoritesService->getFavorites() );
        });
        View::composer('currency-menu', function ($view) {
            $currencyService = app(CurrencyService::class);
            $view->with( 'currencies', $currencyService->getItems() );
        });

        View::composer('mini-cart', function ($view) {
            $cartService  = app(CartService::class);
            $userCurrency = app(CurrencyService::class);
            $view->with(
                [
                    'products'     => $cartService->getCartProducts(),
                    'totalPrice'   => $cartService->getTotalPrice(),
                    'userCurrency' => $userCurrency->getUserCurrency(),
                    'totalCount'   => $cartService->getItemCount()
                ]
            );
        });

        View::composer('checkout-items', function ($view) {
            $cartService  = app(CartService::class);
            $userCurrency = app(CurrencyService::class);
            $view->with(
                [
                    'products'     => $cartService->getCartProducts(),
                    'totalPrice'   => $cartService->getTotalPrice(),
                    'userCurrency' => $userCurrency->getUserCurrency(),
                    'totalCount'   => $cartService->getItemCount()
                ]
            );
        });

        Setting::retrieved(function ($setting) {
            if ( Route::currentRouteName() === 'voyager.settings.index') {
                if ($setting->key === 'site.home_page' || $setting->key === 'site.contact_page') {
                    $pages = \App\Models\Page::orderBy('title', 'asc')->get(
                        ['id', 'title']
                    );

                    $options = $pages->pluck('title', 'id')->toArray();

                    $options = ['' => 'Выберите страницу'] + $options;

                    $setting->details = json_encode([
                        'default' => null,
                        'options' => $options,
                    ]);
                }
                if ($setting->key === 'site.orders_chat' ) {
                    $token = config('telegraph.orders_bot_token');
                    if( $token ){
                        $bot = TelegraphBot::firstWhere('token', $token);
                        if( $bot ) {
                            $chats = TelegraphChat::where('telegraph_bot_id', $bot->id)->get();
                            $options = [];
                            foreach ($chats as $chat) {
                                $options[$chat->chat_id] = $chat->name . ' ( Chat ID ' . $chat->chat_id . ' )';
                            }
                            $options = ['' => 'Select chat'] + $options;

                            $setting->details = json_encode([
                                'default' => null,
                                'options' => $options,
                            ]);
                        }
                    }
                }
            }
        });

        VerifyEmail::toMailUsing(function ($notifiable, $url) {
            return (new CustomVerifyEmail())->toMail($notifiable);
        });

        ResetPassword::toMailUsing(function ($notifiable, $token) {
            return (new ResetPasswordNotification($token))->toMail($notifiable);
        });

        Voyager::addFormField("App\\Admin\\FormFields\\GutenbergFieldHandler");


        //Event::listen(BreadDataAdded::class, ProcessProductImages::class);
    }
}
