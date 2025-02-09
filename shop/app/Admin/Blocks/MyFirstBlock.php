<?php

namespace App\Admin\Blocks;

class MyFirstBlock extends AbstractBlock
{

    public string $name = 'My First';
    public string $slug = 'my-namespace/my-block';
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
        return 'blocks.my-block';
    }
    public static function render(array $attributes, string $id): string
    {

        return view('admin.blocks.my-block', [
            'attributes' => $attributes,
            'id' => $id,
        ])->render();

    }
}
