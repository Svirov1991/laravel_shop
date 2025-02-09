<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Services\BlocksService;

class BlocksServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->singleton(BlocksService::class, function ($app) {
            return new BlocksService();
        });
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        $blocksService = app(BlocksService::class);
        $blocksService->registerBlock(new \App\Admin\Blocks\MyFirstBlock());
    }
}
