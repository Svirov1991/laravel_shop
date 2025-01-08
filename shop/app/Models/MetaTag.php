<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MetaTag extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $fillable = [
            'page_type',
            'page_id',
            'meta_title',
            'meta_description',
            'meta_keywords',
            'og_title',
            'og_description',
            'og_image',
            'og_url',
            'og_type',
            'twitter_title',
            'twitter_description',
            'twitter_image',
            'twitter_card',
            'canonical',
            'robots'
        ];

    public function page()
    {
        return $this->morphTo(__FUNCTION__, 'page_type', 'page_id');
    }
}
