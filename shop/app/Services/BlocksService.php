<?php
namespace App\Services;
use App\Admin\Blocks\AbstractBlock;

class BlocksService{
    public array $blocks = [];

    public function registerBlock( AbstractBlock $block )
    {
        $block->register();
        $this->blocks[$block->getSlug()] = [
            'title' => $block->getName(),
            'slug' => $block->getSlug(),
            'icon' => $block->getIcon(),
            'category' => $block->getCategory(),
            'class' => get_class($block),
        ];
    }

    public function getBlocks(){
        return $this->blocks;
    }

    public function findBlockBySlug($slug)
    {
        return $this->blocks[$slug] ?? null;
    }
}
