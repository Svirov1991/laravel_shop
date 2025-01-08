<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Currency;

class CurrencySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        Currency::create([
            'code' => 'UAH',
            'symbol' => '₴',
            'rate' => 1,
            'is_default' => true,
        ]);

        Currency::create([
            'code' => 'USD',
            'symbol' => '$',
            'rate' => 42.5,
            'is_default' => false,
        ]);
    }
}
