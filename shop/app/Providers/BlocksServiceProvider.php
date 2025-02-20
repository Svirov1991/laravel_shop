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
        $blocksService->registerBlock(new \App\Admin\Blocks\MainSlider());
        $blocksService->registerBlock(new \App\Admin\Blocks\InformationBlock());
        $blocksService->registerBlock(new \App\Admin\Blocks\PopularProducts());
        $blocksService->registerBlock(new \App\Admin\Blocks\ProductCategories());
        $blocksService->registerBlock(new \App\Admin\Blocks\LatestPosts());
        $blocksService->registerBlock(new \App\Admin\Blocks\ContactBlock());
        $blocksService->registerBlock(new \App\Admin\Blocks\ContactForm());
    }
}
