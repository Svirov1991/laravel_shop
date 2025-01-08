<?php

namespace App\Http\Controllers;

use App\Http\Requests\CurrencyRequest;
use App\Models\NovaPoshtaArea;
use Illuminate\Http\Request;
use App\Models\Currency;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use App\Services\CurrencyService;
class CurrencyController extends Controller
{

    protected $baseUrl = 'https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5';

    public function updateCurrencies(){
        try {
            $response = Http::withOptions(['verify' => false])->timeout(60)->post($this->baseUrl);
            $response_data = $response->json();
            foreach ($response_data as $currency) {
                $existingCurrency = Currency::where('code', $currency['ccy'])->first();

                if ($existingCurrency) {
                    $existingCurrency->update(['rate' => $currency['sale']]);
                }
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
        return true;
    }

    public function setCurrency(CurrencyRequest $request)
    {
        CurrencyService::setUserCurrency( $request->code );

        return true;
    }
}
