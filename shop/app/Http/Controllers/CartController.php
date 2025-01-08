<?php

namespace App\Http\Controllers;
use App\Http\Requests\CartRequest;
use App\Http\Requests\OrderRequest;
use App\Models\AttributeValue;
use App\Services\CartService;
use App\Services\CurrencyService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Order;

class CartController extends Controller
{
    public $service;

    public function __construct(CartService $Service)
    {
        $this->service = $Service;
    }

    public function index( Request $request )
    {
        $data = $request->only(['product_id']);
        $validator = Validator::make( $data, [ 'product_id' => 'nullable|integer' ] );
        if ( ! $validator->fails() && !empty( $validator->validated()['product_id'] ) ) {
            $this->service->addToCart($request);
            return redirect($request->url());
        }

        $cartProducts = $this->service->getCartProducts();
        $totalPrice   = $this->service->getTotalPrice();
        $totalCount   = $this->service->getItemCount();
        $userCurrency = app(CurrencyService::class)->getUserCurrency();

        $breadcrumbs = [
            ['name' => __('messages.main'), 'url' => route('home')],
            ['name' => __('messages.cart_n'), 'url' => route('cart')],
        ];
        $metaTags    = \App\Services\MetaTagsService::prepareMetaTags([]);

        return view(
            'cart',
            compact(
                'cartProducts',
                'totalCount',
                'totalPrice',
                'userCurrency',
                'breadcrumbs',
                'metaTags'
            )
        );
    }

    public function checkout()
    {
        $products = $this->service->getCartProducts();
        if (empty($products) && empty(session('success')) ) {
            return redirect()->route('home');
        }
        $breadcrumbs = [
            ['name' => __('messages.main'), 'url' => route('home')],
            ['name' => __('messages.cart_n'), 'url' => route('cart')],
            ['name' => __('messages.cart.checkout'), 'url' => route('checkout')],
        ];
        $metaTags = \App\Services\MetaTagsService::prepareMetaTags( [] );
        return view('checkout', compact('breadcrumbs', 'metaTags') );
    }

    public function checkoutItems()
    {
        $html = view('checkout-items')->render();
        return response($html, 200);
    }
    public function addToCart( CartRequest $request)
    {
        $addToCart = $this->service->addToCart($request);
        $code = 200;
        if ( ! empty($addToCart['code'])) {
            $code = $addToCart['code'];
        }

        return response()->json(
            ['message'    => $addToCart['message'],
             'totalItems' => $this->service->getItemCount(),
             'totalPrice' => $this->service->getTotalPrice(),
             'miniCart'   => view('mini-cart')->render(),
             'code'        => $code,
            ],
            $code
        );
    }

    public function clearCart()
    {
        session()->put( 'cart', [] );
        return response()->json( [ 'message' => __('messages.cart.cart_empty'), 'url' => route('home') ] );
    }

    public function updateCart( Request $request )
    {
        $data = $request->only(['cart_item_id', 'count', 'attributes']);
        $validator = Validator::make(
            $data,
            [
                'cart_item_id' => 'required|uuid',
                'count'        => 'nullable|integer',
                'attributes'   => 'nullable|array',
                'attributes.*' => 'nullable|integer|exists:attribute_values,id'
            ]
        );

        if ($validator->fails()) {
            return response()->json([
                'message' => __('messages.validation_error'),
                'errors' => $validator->errors()
            ], 422);
        }

        $cart_product = $this->service->updateFromCart($validator->validated());
        $code = 200;
        if( isset($cart_product['code'])){
            $code = $cart_product['code'];
        }

        $symbol = app(CurrencyService::class)->getUserCurrency()->symbol;

        return response()->json(
            ['message'        => $cart_product['message'],
             'products_price' => $cart_product['products_price'],
             'symbol'         => $symbol,
             'totalItems'     => $this->service->getItemCount(),
             'totalPrice'     => $this->service->getTotalPrice(),
            ],
            $code
        );
    }

    public function removeFromCart( Request $request)
    {
        $data = $request->only(['cart_item_id']);
        $validator = Validator::make($data, [ 'cart_item_id' => 'required|uuid' ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ], 422);
        }

        $message = $this->service->removeFromCart($request);
        return response()->json(
            ['message' => $message, 'totalItems' => $this->service->getItemCount(), 'totalPrice' => $this->service->getTotalPrice()]
        );
    }

}
