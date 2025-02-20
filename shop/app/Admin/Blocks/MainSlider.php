<?php

namespace App\Admin\Blocks;

class MainSlider extends AbstractBlock
{

    public string $name = 'Main slider';
    public string $slug = 'my-namespace/main-slider';
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
        return 'blocks.main-slider';
    }

    public static function render(array $attributes, string $id): string
    {

        return view('admin.blocks.main-slider', [
            'attributes' => $attributes,
            'id' => $id,
        ])->render();

    }
}
