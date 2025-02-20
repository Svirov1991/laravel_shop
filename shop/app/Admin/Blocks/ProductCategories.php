<?php

namespace App\Admin\Blocks;

use App\Models\ProductCategory;
use VanOns\Laraberg\Laraberg;

class ProductCategories extends AbstractBlock
{

    public string $name = 'Product Categories';
    public string $slug = 'my-namespace/product-categories';
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
        return 'blocks.product-categories';
    }

    public static function render(array $attributes, string $id): string
    {

        $categories          = ProductCategory::all();
        return view('admin.blocks.product-categories', [
            'attributes' => $attributes,
            'id' => $id,
            'categories' => $categories,
        ])->render();

    }

    public function register()
    {
        Laraberg::registerBlockType(
            $this->getSlug(),
            [], function ($attributes, $content) {
            $categories = $attributes['fields']['categories'] ?? [];
            if(!empty($categories)){
                $categories          = ProductCategory::whereIn('id', $categories)->get();
            }
            return view($this->getView(), compact('attributes', 'content', 'categories'));
        }
        );
    }
}
