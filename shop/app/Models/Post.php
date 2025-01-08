<?php

namespace App\Models;

use TCG\Voyager\Models\Category;
use TCG\Voyager\Models\Post as BasePost;
class Post extends BasePost
{
    public function metaTags()
    {
        return $this->morphOne(MetaTag::class, 'page', 'page_type', 'page_id');
    }

    public function caregory()
    {
        return $this->belongsTo(Category::class, 'category_id', );
    }
}
