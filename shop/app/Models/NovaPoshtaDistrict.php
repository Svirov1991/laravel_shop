<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NovaPoshtaDistrict extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = ['name', 'district_code', 'district_center', 'area_code', 'settlements_updated_at'];

    /**
     * Связь района с областью
     */
    public function area()
    {
        return $this->belongsTo(NovaPoshtaArea::class, 'area_code', 'area_code');
    }

    public function settlements()
    {
        return $this->hasMany(NovaPoshtaSettlement::class, 'district_code', 'district_code');
    }
}
