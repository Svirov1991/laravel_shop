<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::get('products/{id}/edit', [\App\Http\Controllers\VoyagerProductController::class, 'edit'])->name('voyager.products.edit');
    Route::get('products/create', [\App\Http\Controllers\VoyagerProductController::class, 'create'])->name('voyager.products.create');
});

Route::middleware([ \App\Http\Middleware\LocaleMiddleware::class] )->group(function() {
    Route::get('/language/{locale}', [\App\Http\Controllers\LanguageController::class, 'switch'])->name('language-switch');

    Route::get('/', [\App\Http\Controllers\MainController::class, 'index'])->name('home');

    Route::get( 'update-currencies', [\App\Http\Controllers\CurrencyController::class, 'updateCurrencies'])->name('update-currencies');
    Route::post( 'set-currency', [\App\Http\Controllers\CurrencyController::class, 'setCurrency'])->name('set-currency');

    Route::group(['prefix' => 'cart'], function () {
        Route::get('/', [\App\Http\Controllers\CartController::class, 'index'])->name('cart');
        Route::get('checkout', [\App\Http\Controllers\CartController::class, 'checkout'])->name('checkout');
        Route::post('checkout', [\App\Http\Controllers\OrderController::class, 'makeOrder'])->name('make-order');
        Route::post('checkout-items', [\App\Http\Controllers\CartController::class, 'checkoutItems'])->name('checkout-items');
        Route::post('add', [\App\Http\Controllers\CartController::class, 'addToCart'])->name('add-to-cart');
        Route::post('remove', [\App\Http\Controllers\CartController::class, 'removeFromCart'])->name('remove-from-cart');
        Route::post('update', [\App\Http\Controllers\CartController::class, 'updateCart'])->name('update-cart');
        Route::post('clear', [\App\Http\Controllers\CartController::class, 'clearCart'])->name('clear-cart');
    });

    Route::get('new-products', [\App\Http\Controllers\ShopController::class, 'new'])->name('new-products');
    Route::get('favorites', [\App\Http\Controllers\FavoritesController::class, 'index'])->name('favorites');
    Route::post('favorites', [\App\Http\Controllers\FavoritesController::class, 'action'])->name('toggle-favorites');


    Route::group(['prefix' => 'np'], function () {
        Route::get('/', [\App\Http\Controllers\NovaPoshtaController::class, 'index']);
        Route::get('/update', [\App\Http\Controllers\NovaPoshtaController::class, 'updateData']);
        Route::post('/get-data', [\App\Http\Controllers\NovaPoshtaController::class, 'getData'])->name('get-np-data');
    });

    Route::post( '/contact-form', [\App\Http\Controllers\MainController::class, 'contactForm'])->name('contact-form');
    Route::post( '/subscribe-form', [\App\Http\Controllers\MainController::class, 'subscribeForm'])->name('subscribe-form');

    Route::post( '/update-product-rating', [\App\Http\Controllers\ShopController::class, 'updateProductRating'])->name('update-product-rating');
    Route::get( '/{slug}', [\App\Http\Controllers\MainController::class, 'handleSlug'])->name('handle-slug');
    Route::get( '/{category_slug}/{slug}', [\App\Http\Controllers\MainController::class, 'singleItem'])->name('single-item');

});


