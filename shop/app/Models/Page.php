<?php

namespace App\Models;

use TCG\Voyager\Models\Page as BasePage;
//use VanOns\Laraberg\Traits\RendersContent;
use App\Traits\RendersContent;
class Page extends BasePage
{
    use RendersContent;

    protected $contentColumn = 'body';
    public function metaTags()
    {
        return $this->morphOne(MetaTag::class, 'page', 'page_type', 'page_id');
    }
}
