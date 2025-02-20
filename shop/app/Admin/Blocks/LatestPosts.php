<?php

namespace App\Admin\Blocks;

use App\Models\Post;
use VanOns\Laraberg\Laraberg;
class LatestPosts extends AbstractBlock
{

    public string $name = 'Latest Posts';
    public string $slug = 'my-namespace/latest-posts';
    public string $category = 'custom-category';
    public string $icon = 'arrow-right';

    public function getName()
    {
        return $this->name;
    }

    public function getSlug()
    {
        return $this->slug;
    }

    public function getCategory()
    {
        return $this->category;
    }

    public function getIcon()
    {
        return $this->icon;
    }

    public function getView(): string
    {
        return 'blocks.latest-posts';
    }

    public static function render(array $attributes, string $id): string
    {

        return view('admin.blocks.latest-posts', [
            'attributes' => $attributes,
            'id' => $id,
        ])->render();

    }

    public function register()
    {
        Laraberg::registerBlockType(
            $this->getSlug(),
            [], function ($attributes, $content) {
            $latest_posts   = Post::where('status', 'PUBLISHED')->with('category')->latest()->limit(6)->get();;
            return view($this->getView(), compact('attributes', 'content', 'latest_posts'));
        }
        );
    }
}

