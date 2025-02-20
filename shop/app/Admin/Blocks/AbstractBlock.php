<?php

namespace App\Admin\Blocks;

use VanOns\Laraberg\Laraberg;
use App\Services\BlocksService;

abstract class AbstractBlock
{

    abstract function getName();

    abstract function getSlug();

    abstract function getCategory();

    abstract function getIcon();

    abstract public static function render(array $attributes, string $id): string;

    public function register()
    {
        Laraberg::registerBlockType(
            $this->getSlug(),
            [], function ($attributes, $content) {
            return view($this->getView(), compact('attributes', 'content'));
        }
        );
    }

    public function getView()
    {
        $slug = $this->getSlug();
        $slug = str_replace(['\\', '/'], '-', $slug);

        return 'blocks.' . $slug;
    }

}
