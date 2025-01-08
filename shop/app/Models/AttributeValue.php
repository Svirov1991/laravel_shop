<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttributeValue extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = ['id', 'attribute_id', 'value'];

//    public function attribute()
//    {
//        return $this->belongsTo(Attribute::class, 'attribute_id');
//    }
    public function attributeId()
    {
        return $this->belongsTo(Attribute::class);
    }

    public function attribute()
    {
        return $this->belongsTo(Attribute::class);
    }
}
