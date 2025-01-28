<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use App\Http\Controllers\UserController;

Route::get('/login', [UserController::class, 'login'])->name('login');

Route::post('/login', [UserController::class, 'attemptToLogin'])->name(
    'attempt-to-login'
);
Route::get('/register', [UserController::class, 'register'])->name('register');
Route::post('/register', [UserController::class, 'save'])->name(
    'register-save'
);


Route::get(
    '/profile/verify/{id}/{hash}',
    [App\Http\Controllers\ProfileController::class, 'userVerify']
)->middleware(['auth', 'signed'])->name('verification.verify');

Route::get('/password/reset', [UserController::class, 'showLinkRequestForm']
)->name('password.request');
Route::post('/password/email', [UserController::class, 'sendResetLinkEmail']
)->name('password.email');
Route::get('/password/reset/{token}', [UserController::class, 'showResetForm']
)->name('password.reset');
Route::post('/password/reset', [UserController::class, 'reset'])->name(
    'password.update'
);


Route::middleware(['auth', 'verified'])->group(function () {
    Route::group(['prefix' => 'profile'], function () {
        Route::get(
            '/',
            [\App\Http\Controllers\ProfileController::class, 'index']
        )->name('profile');
        Route::post(
            '/',
            [\App\Http\Controllers\ProfileController::class, 'updateProfile']
        )->name('profile.update');
        Route::post(
            '/avatar',
            [\App\Http\Controllers\ProfileController::class, 'updateAvatar']
        )->name('profile.update-avatar');
        Route::get(
            '/wholesaler',
            [\App\Http\Controllers\ProfileController::class, 'wholesaler']
        )->name('profile.wholesaler');
        Route::get(
            '/get-wholesaler',
            [\App\Http\Controllers\ProfileController::class, 'getWholesaler']
        )->name('profile.get-wholesaler');
        Route::get(
            '/orders',
            [\App\Http\Controllers\ProfileController::class, 'orders']
        )->name('profile.orders');
    });
});
Route::middleware(['auth'])->group(function () {
    Route::get(
        '/profile/verify',
        [App\Http\Controllers\ProfileController::class, 'verify']
    )->middleware(['auth'])->name('verification.notice');
    Route::get(
        '/profile/resend',
        [App\Http\Controllers\ProfileController::class, 'resend']
    )->middleware(['auth', 'throttle:6,1'])->name('verification.resend');
    Route::get('/logout', [UserController::class, 'logout'])->name('logout');
});
