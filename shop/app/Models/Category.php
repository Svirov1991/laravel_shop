<?php

namespace App\Models;

use TCG\Voyager\Models\Category  as BaseCategory;

class Category extends BaseCategory
{
    public function metaTags()
    {
        return $this->morphOne(MetaTag::class, 'page', 'page_type', 'page_id');
    }

}
