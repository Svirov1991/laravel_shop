<?php

namespace App\Traits;

use VanOns\Laraberg\Blocks\ContentRenderer;
use VanOns\Laraberg\Traits\RendersContent as LarabergRendersContent;
use function app;

trait RendersContent
{

    use LarabergRendersContent;
    public function render(string $column = null): string
    {
        $column = $column ?: $this->getContentColumn();
        $renderer = app(\App\Services\LarabergContentRenderer::class);
        $content = $this->$column;
        return $renderer->render(is_string($content) ? $content : '');
    }

}
