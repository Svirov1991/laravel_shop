<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Storage;
use TCG\Voyager\Events\BreadDataUpdated;

class HandleMediaAfterSave
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(object $event): void
    {
        if ($event->dataType->slug === 'products') {
            if ($event instanceof BreadDataUpdated && isset($event->old['images'], $event->data['images']) && $event->old['images'] === $event->data['images']) {
                return;
            }
            $product = $event->data;
            $result  = [];
            $images  = $product->images ?? '[]';
            $sizes   = ['300', '500', '800', '1200'];
            $images  = json_decode($images);
            foreach ($images as $k => $image) {
                $pathInfo = pathinfo($image);
                foreach ($sizes as $size) {
                    $thumbnail = $pathInfo['dirname'] . '/' . $pathInfo['filename'] . '-resize-' . $size . '.' . $pathInfo['extension'];
                    $imagePath = Storage::disk(
                        config('voyager.storage.disk')
                    )->path(
                        $thumbnail
                    );
                    if (file_exists($imagePath)) {
                        $result[$k][] = ['url' => $thumbnail, 'width' => $size];
                    }
                }
            }

            $product->image_thumbnails = json_encode($result);
            $product->saveQuietly();
        }
    }
}
