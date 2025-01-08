<?php
namespace App\Listeners;

use Illuminate\Support\Facades\Storage;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataUpdated;

class MetaTags
{
    /**
     * Event BreadDataAdded.
     *
     * @param  \Voyager\Events\BreadDataAdded  $event
     * @return void
     */
    public function handle(BreadDataAdded|BreadDataUpdated $event)
    {
        $pages = ['products', 'posts', 'pages', 'categories', 'product-categories'];

        if ( ! in_array($event->dataType->slug, $pages)) {
            return;
        }

        $data = $event->data;
        $metaData = request()->only(
            [
                'meta_title',
                'meta_description',
                'meta_keywords',
                'og_title',
                'og_description',
                'og_image',
                'og_url',
                'og_type',
                'twitter_title',
                'twitter_description',
                'twitter_image',
                'twitter_card',
                'canonical',
                'robots'
            ]
        );

        $currentMeta = $data->metaTags;

        foreach (['og_image', 'twitter_image'] as $imageField) {
            $removeField = "remove_{$imageField}";
            if (request()->has($removeField) && request()->input($removeField) == "1") {
                if ($currentMeta && $currentMeta->$imageField) {
                    Storage::delete('public/' . $currentMeta->$imageField);
                    $metaData[$imageField] = null;
                }
            }
        }

        if (request()->hasFile('og_image')) {
            $metaData['og_image'] = $this->uploadImage(request()->file('og_image'));
        }

        if (request()->hasFile('twitter_image')) {
            $metaData['twitter_image'] = $this->uploadImage(request()->file('twitter_image'));
        }



        if ($currentMeta) {
            $currentMeta->fill($metaData);

            if ($currentMeta->isDirty()) {
                $currentMeta->save();
            }
        } else {
            $data->metaTags()->create($metaData);
        }
    }

    protected function uploadImage($file)
    {
        $filename = time() . '-' . $file->getClientOriginalName();

        $file->storeAs('public/images', $filename);

        return asset('images/' . $filename);
    }

}
