<?php

namespace App\Services;

class LarabergContentRenderer
{
    /**
     * @var BlockParser
     */
    private $parser;

    public function __construct( \VanOns\Laraberg\Blocks\BlockParser $parser)
    {
        $this->parser = $parser;
    }

    public function render(string $content): string
    {
        $output = '';
        $blocks = $this->parser->parse($content);

        foreach ($blocks as $block) {
            $render = $block->render();
            if ( strpos($block->blockName, 'my-namespace') !== false ) {
                $output .= $render;
            } else {
                $output .= '<section><div class="container blog-details-content-wrap pb-1 pt-1">' . $render . '</div></section>';
            }
        }

        return $output;
    }
}
