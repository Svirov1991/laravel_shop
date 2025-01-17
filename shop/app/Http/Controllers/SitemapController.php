<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Spatie\Sitemap\Sitemap;
use Spatie\Sitemap\Tags\Url;

class SitemapController extends Controller
{
    public function index()
    {
        $sitemap = Cache::remember(
            'sitemap.xml',
            now()->addHours(12),
            function () {
                $sitemap = Sitemap::create();

                $sitemap->add(
                    Url::create('/')->setLastModificationDate(
                        now()
                    )->setChangeFrequency(
                        Url::CHANGE_FREQUENCY_DAILY
                    )->setPriority(1.0)
                );

                $products = \App\Models\Product::where(
                    'status',
                    'PUBLISHED'
                )->with('category')->get();
                $categories = [];
                foreach ($products as $product) {
                    $sitemap->add(
                        Url::create(
                            route(
                                'single-item',
                                [$product->category->slug, $product->slug]
                            )
                        )->setLastModificationDate(
                            $product->updated_at
                        )->setChangeFrequency(
                            Url::CHANGE_FREQUENCY_WEEKLY
                        )->setPriority(0.8)
                    );
                    if ( ! isset($categories[$product->category->id])) {
                        $categories[$product->category->id] = $product->category;
                    }
                }
                foreach ($categories as $category) {
                    $sitemap->add(
                        Url::create(
                            route('handle-slug', $category->slug)
                        )->setLastModificationDate(
                            $category->updated_at
                        )->setChangeFrequency(
                            Url::CHANGE_FREQUENCY_WEEKLY
                        )->setPriority(0.8)
                    );
                }

                $posts = \App\Models\Post::where('status', 'PUBLISHED')->with(
                    'category'
                )->get();

                $categories = [];
                foreach ($posts as $post) {
                    $sitemap->add(
                        Url::create(
                            route(
                                'single-item',
                                [$post->category->slug, $post->slug]
                            )
                        )->setLastModificationDate(
                            $post->updated_at
                        )->setChangeFrequency(
                            Url::CHANGE_FREQUENCY_WEEKLY
                        )->setPriority(0.6)
                    );
                    if ( ! isset($categories[$post->category->id])) {
                        $categories[$post->category->id] = $post->category;
                    }
                }
                foreach ($categories as $category) {
                    $sitemap->add(
                        Url::create(
                            route('handle-slug', $category->slug)
                        )->setLastModificationDate(
                            $category->updated_at
                        )->setChangeFrequency(
                            Url::CHANGE_FREQUENCY_WEEKLY
                        )->setPriority(0.8)
                    );
                }

                $mainPage = setting('site.home_page');
                $pages    = \App\Models\Page::where('status', 'ACTIVE')->get();
                foreach ($pages as $page) {
                    if ( ! empty($mainPage) && $mainPage == $page->id) {
                        continue;
                    }
                    $sitemap->add(
                        Url::create(
                            route('handle-slug', $page->slug)
                        )->setLastModificationDate(
                            $page->updated_at
                        )->setChangeFrequency(
                            Url::CHANGE_FREQUENCY_WEEKLY
                        )->setPriority(0.7)
                    );
                }

                return $sitemap->render();
            }
        );

        return response($sitemap, 200, [
            'Content-Type' => 'application/xml',
        ]);
    }

    public function robots()
    {
        $content = "User-agent: *\n";
        $content .= "Disallow:/admin/\n";
        $content .= "Sitemap: " . route('sitemap') . "\n";

        return response($content, 200)->header('Content-Type', 'text/plain');
    }
}
