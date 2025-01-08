<?php

namespace App\Models;

use TCG\Voyager\Models\Page as BasePage;
class Page extends BasePage
{
    public function metaTags()
    {
        return $this->morphOne(MetaTag::class, 'page', 'page_type', 'page_id');
    }
}
