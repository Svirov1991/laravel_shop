<?php

namespace App\Admin\Blocks;

class ContactForm extends AbstractBlock
{

    public string $name = 'Contact form';
    public string $slug = 'my-namespace/contact-form';
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
        return 'blocks.contact-form';
    }

    public static function render(array $attributes, string $id): string
    {

        return view('admin.blocks.contact-form', [
            'attributes' => $attributes,
            'id' => $id,
        ])->render();

    }

}
