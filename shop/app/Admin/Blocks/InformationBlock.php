<?php

namespace App\Admin\Blocks;

class InformationBlock extends AbstractBlock
{

    public string $name = 'Information';
    public string $slug = 'my-namespace/information';
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
        return 'blocks.information';
    }

    public static function render(array $attributes, string $id): string
    {

        return view('admin.blocks.information', [
            'attributes' => $attributes,
            'id' => $id,
        ])->render();

    }
}
