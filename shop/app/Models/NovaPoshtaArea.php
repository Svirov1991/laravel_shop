<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NovaPoshtaArea extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = ['name', 'area_code', 'area_center', 'settlements_updated_at'];
}
