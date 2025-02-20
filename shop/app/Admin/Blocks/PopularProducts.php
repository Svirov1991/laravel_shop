<?php

namespace App\Admin\Blocks;

use App\Models\Product;
use VanOns\Laraberg\Laraberg;

class PopularProducts extends AbstractBlock
{

    public string $name = 'Popular products';
    public string $slug = 'my-namespace/popular-products';
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
        return 'blocks.popular-products';
    }

    public static function render(array $attributes, string $id): string
    {

        return view('admin.blocks.popular-products', [
            'attributes' => $attributes,
            'id' => $id,
        ])->render();

    }

    public function register()
    {
        Laraberg::registerBlockType(
            $this->getSlug(),
            [], function ($attributes, $content) {
            $featured_products   = Product::where('featured', 1)->where('status', 'PUBLISHED')->with('category')->limit(4)->get();
            $discounted_products = Product::whereNotNull('discount_price')->where('status', 'PUBLISHED')->with('category')->limit(4)->get();
            return view($this->getView(), compact('attributes', 'content', 'featured_products', 'discounted_products'));
        }
        );
    }
}
