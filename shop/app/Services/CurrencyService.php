<?php
namespace App\Services;
use App\Models\Currency;
use Illuminate\Support\Facades\Session;

class CurrencyService
{

    protected $userCurrency = false;
    protected $currencies = false;
    protected $activeCurrencies = false;

    public function userCurrency()
    {
        $currencyCode = Session::get('currency');

        $currency = null;




        if ($currencyCode) {
            foreach ($this->getCurrencies() as $currency) {
                if( $currency->code == $currencyCode ){
                    $currency = $currency;
                    break;
                }
            }
        }

        if (!$currency) {
            $currency = $this->getCurrencies()->first();
        }

        return $currency;
    }

    public function getUserCurrency()
    {
        if( $this->userCurrency === false ){
            $this->userCurrency  = $this->userCurrency();
        }

        return $this->userCurrency;
    }

    public function getCurrencies()
    {
        if( $this->currencies === false ){
            $this->currencies  = Currency::orderBy('is_default', 'desc')->get();;
        }
        return $this->currencies;
    }

    public function getActiveCurrencies()
    {
        if( $this->activeCurrencies === false ){
            $this->activeCurrencies  = Currency::where('active', 1)->orderBy('is_default', 'desc')->get();;
        }
        return $this->activeCurrencies;
    }

    public static function setUserCurrency( $code ){
        Session::put('currency', $code);
    }

    public function getCurrency( $id )
    {
        $currency = null;
        $currencies = $this->getCurrencies();
        foreach ($currencies as $item) {
            if ( $item->id == $id ) {
                $currency = $item;
                break;
            }
        }

        return $currency;
    }

    public function calculatePrice($price = null, $currencyId = null)
    {
        if ( empty($price) || empty($currencyId) ) {
            return false;
        }

        $productCurrency = $this->getCurrency($currencyId);
        if (empty($productCurrency)) {
            return false;
        }

        $userCurrency = $this->getUserCurrency();
        if ( empty($userCurrency) ) {
            return false;
        }

        if ($productCurrency->id === $userCurrency->id) {
            return $price;
        } else {
            return ceil( $price * ($productCurrency->rate / $userCurrency->rate) );
        }
    }

    public function getItems()
    {
        return [ 'all' => $this->getActiveCurrencies(), 'userCurrency' => $this->getUserCurrency() ];
    }

}
