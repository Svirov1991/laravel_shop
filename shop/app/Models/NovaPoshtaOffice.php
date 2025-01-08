<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NovaPoshtaOffice extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = ['office_number', 'address', 'office_code', 'settlement_code'];

    /**
     * Связь отделения с населенным пунктом
     */
    public function settlement()
    {
        return $this->belongsTo(NovaPoshtaSettlement::class);
    }

}
