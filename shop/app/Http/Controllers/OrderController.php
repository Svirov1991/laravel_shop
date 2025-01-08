<?php

namespace App\Http\Controllers;

use App\Http\Requests\OrderRequest;
use App\Models\AttributeValue;
use App\Models\Order;
use App\Services\CurrencyService;
use Illuminate\Http\Request;
use App\Services\CartService;
use App\Services\OrderService;
class OrderController extends Controller
{
    protected $service;
    public function __construct(OrderService $Service)
    {
        $this->service = $Service;
    }
    public function makeOrder( OrderRequest $request) {

        $order = $this->service->makeOrder( $request->validated() );
        if( !$order ){
            redirect()->route('cart')->with('error', __('messages.something_went_wrong'));;
        }

        return redirect()->route('checkout' )->with('success', __('messages.cart.order_successfully'));
    }

}
