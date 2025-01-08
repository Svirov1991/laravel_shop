<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NovaPoshtaSettlement extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = ['name', 'settlement_code', 'district_code', 'offices_updated_at'];

    /**
     * Связь населенного пункта с районом
     */
    public function district()
    {
        return $this->belongsTo(NovaPoshtaDistrict::class);
    }

    public function offices()
    {
        return $this->hasMany(NovaPoshtaOffice::class);
    }
}
