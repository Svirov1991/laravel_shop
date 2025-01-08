<?php

namespace App\Providers;

use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;
use \TCG\Voyager\Events\BreadDataAdded;
use \TCG\Voyager\Events\BreadDataUpdated;
use App\Listeners\GenerateProductThumbnails;
class EventServiceProvider extends ServiceProvider
{
    /**
     * The event to listener mappings for the application.
     *
     * @var array<class-string, array<int, class-string>>
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
        \TCG\Voyager\Events\BreadDataUpdated::class => [
            \App\Listeners\MetaTags::class,
            \App\Listeners\HandleMediaAfterSave::class,
        ],
        \TCG\Voyager\Events\BreadDataAdded::class => [
            \App\Listeners\MetaTags::class,
            \App\Listeners\HandleMediaAfterSave::class,
        ],
//        BreadDataAdded::class => [
//            GenerateProductThumbnails::class,
//        ],
//        BreadDataUpdated::class => [
//            GenerateProductThumbnails::class,
//        ],
    ];

    /**
     * Register any events for your application.
     */
    public function boot(): void
    {
        //
    }

    /**
     * Determine if events and listeners should be automatically discovered.
     */
    public function shouldDiscoverEvents(): bool
    {
        return false;
    }
}
