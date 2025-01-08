<?php
namespace App\Services;
use Illuminate\Support\Facades\Storage;
class MetaTagsService
{
    public static function prepareMetaTags( $page )
    {
        $data = [];

        $metaTags = null;
        if( is_object($page) && method_exists($page, 'metaTags') ){
            $metaTags = $page->metaTags;
        }
        $table = '';
        if ( is_object($page) ) {
            $table = $page->getTable();
            if( $table == 'products' ) {

                $description = str_replace(["\r", "\n"], '', strip_tags($page->description)) ?? null;
                $image = is_string($page->images)
                    ? (json_decode($page->images, true)[0] ?? null)
                    : ($page->images[0] ?? $page->images);

                if (!empty($page->image_thumbnails) && $image) {
                    $image_thumbnails = json_decode($page->image_thumbnails, true);
                    $imagePath = Storage::disk(
                        config('voyager.storage.disk')
                    )->path(
                        $image
                    );
                    $img_key = md5_file($imagePath);

                    if (isset($image_thumbnails[$img_key])) {
                        $image = collect($image_thumbnails[$img_key])
                                     ->first(fn($thumb) => $thumb['width'] == '1200')['url'] ?? $image;
                    }
                }

            } else {
                $description = $page->excerpt ?? null;
                $image = $page->image ?? null;
            }
        }

        $title = $page->title ?? setting('site.title') ?? null;
        $description = $description ?? setting('site.description') ?? null;
        $data['title'] = $metaTags->meta_title ?? $title ?? null;
        $data['description'] = $metaTags->meta_description ?? $description ?? null;
        $data['meta_keywords'] = $metaTags->meta_keywords ?? null;

        $data['og_title'] = $metaTags->og_title ?? $title ?? null;
        $data['og_description'] = $metaTags->og_description ?? $description ?? null;
        $data['og_image'] = $metaTags->og_image ?? $image ?? null;
        if( !empty( $data['og_image'] ) ) {
            $data['og_image'] = Storage::disk(config('voyager.storage.disk'))->url($data['og_image']);
        }
        $data['og_url'] = $metaTags->og_url ?? url()->current();
        $data['og_type'] = $metaTags->og_type ?? null;

        $data['twitter_title'] = $metaTags->twitter_title ?? $title ?? null;
        $data['twitter_description'] = $metaTags->twitter_description ?? $description ?? null;
        $data['twitter_image'] = $metaTags->twitter_image ?? $image ?? null;
        if( !empty( $data['twitter_image'] ) ) {
            $data['twitter_image'] = Storage::disk(config('voyager.storage.disk'))->url($data['twitter_image']);
        }
        $data['twitter_card'] = $metaTags->twitter_card ?? null;
        $data['canonical'] = $metaTags->canonical ?? url()->current();
        $data['robots'] = $metaTags->robots ?? null;

        $structuredData = [
            '@context' => 'https://schema.org',
            '@type' => $table === 'products' ? 'Product' : 'Article',
            'mainEntityOfPage' => [
                '@type' => 'WebPage',
                '@id' => $data['canonical'],
            ],
            'headline' => $data['title'],
            'publisher' => [
                '@type' => 'Organization',
                'name' => config('app.name'),
                'logo' => [
                    '@type' => 'ImageObject',
                    'url' => Storage::disk(config('voyager.storage.disk'))->url(setting('site.logo')),
                ],
            ],
        ];
        if (is_object($page)) {
            $structuredData['datePublished'] = $page->created_at->toIso8601String(
            );
            $structuredData['dateModified']  = $page->updated_at->toIso8601String(
            );
        }

        if ( !empty( $data['og_image'] ) ){
            $structuredData['image'] = $data['og_image'];
        }
        if ( !empty( $data['og_description'] ) ){
            $structuredData['description'] = $data['og_description'];
        }

        if ($table !== 'products' && $author = $page->author->name ?? null) {
            $structuredData['author'] = [
                '@type' => 'Person',
                'name' => $author,
            ];
        }

        $data['structured_data'] = json_encode($structuredData, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);

        return $data;
    }
}
