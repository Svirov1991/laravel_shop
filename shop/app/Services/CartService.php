<?php

namespace App\Services;

use App\Models\AttributeValue;
use App\Models\Product;
use App\Models\ProductAttributeValue;
use Illuminate\Support\Str;

class CartService
{
    protected $cartProducts = null;
    protected $cart = null;

    public function getItemCount()
    {
        $cart = session()->get('cart', []);

        $products = $this->getCartProducts();
        $count = 0;
        foreach ($products as $product) {
            $count += $product->cart->count;
        }
        return $count;
    }

    public function getCart()
    {
        if ($this->cart === null) {
            $this->cart = session()->get('cart', []);
        }

        return $this->cart;
    }

    public function setCart($cart)
    {
        $this->cartProducts = null;
        session()->put('cart', $cart);
        $this->cart = $cart;
    }

    public function setCartProducts()
    {
        $cart       = $this->getCart();
        $cart_items = [];
        foreach ($cart as $k => $item) {
            if ( ! isset($item['product_id'])) {
                continue;
            }
            $cart_items[] = (int)$item['product_id'];
        }
        $products = [];
        if ( ! empty($cart_items)) {
            $products = Product::whereIn('id', $cart_items)->where('status', 'PUBLISHED')->whereNotNull('currency_id')->with(
                'attributeValues',
                'category'
            )->get()->filter(function ($product) {
                return ! empty($product->getUserPrice());
            })->keyBy('id');
        }
        $cart_products = [];
        foreach ($cart as $key => $item) {
            if ( isset( $products[$item['product_id']] ) ) {
                $product = clone $products[$item['product_id']];
                $item['key'] = $key;
                $product->cart = (object) $item;
                $cart_products[] =  $product;
            }
        }

        $this->cartProducts = $cart_products;
    }

    public function getCartProducts()
    {
        if ($this->cartProducts === null) {
            $this->setCartProducts();
        }

        return $this->cartProducts;
    }

    public function getTotalPrice()
    {
        $totalPrice = 0;
        $products   = $this->getCartProducts();
        foreach ($products as $item) {
            $totalPrice += $item->getUserPrice() * (int)$item->cart->count;
        }

        return $totalPrice;
    }

    public function removeFromCart($request)
    {
        $cart = $this->getCart();
        unset($cart[$request->input('cart_item_id')]);
        $this->setCart($cart);

        return __('messages.cart.product_removed');
    }

    public function addToCart($request)
    {
        $id = $request->input('product_id');
        $attributes = $request->input('attributes', []);
        if (!is_array($attributes)) {
            $attributes = [];
        }

        $count = $request->input('count', 1);

        $product = Product::where( 'status', 'PUBLISHED' )->whereNotNull('currency_id')->with('attributeValues')->find( $id );
        if( ! $product ) {
            return [ 'message' => __('messages.something_went_wrong'), 'code' => 500 ];
        }
        $attributes = $this->attributecCartFormat( $product, $attributes );


        $cart = $this->getCart();

        foreach ($cart as $k => $item) {
            if ($this->isSameProduct($item, $id, $attributes)) {
                $item['count'] += $count;
                $cart[$k]      = $item;
                $this->setCart($cart);
                return [ 'message' => __('messages.cart.product_added') ];
            }
        }

        $uniqueKey = Str::uuid()->toString();
        $cart[$uniqueKey] = [
            'product_id' => (int) $id,
            'attributes' => $attributes,
            'count' => $count,
        ];

        $this->setCart($cart);
        return [ 'message' => __('messages.cart.product_added') ];
    }

    private function isSameProduct(array $item, int $productId, array $attributes): bool
    {
        if (!isset($item['product_id']) || $item['product_id'] != $productId) {
            return false;
        }

        if (empty($attributes) && empty($item['attributes'])) {
            return true;
        }

        if (empty($attributes) || empty($item['attributes'])) {
            return false;
        }


        return $this->areAttributesEqual($attributes, $item['attributes']);
    }

    private function areAttributesEqual( $attributes1, $attributes2): bool
    {
        if (!is_array($attributes1) || !is_array($attributes2)) {
            return false; // Если хотя бы один аргумент не массив, возвращаем false
        }

        return empty(array_diff($attributes1, $attributes2)) && empty(array_diff($attributes2, $attributes1));
    }

    private function attributecCartFormat( $product, $attributes)
    {
        $dataFormat     = [];
        foreach ($product->getPrimeAttributesData() as $attribute) {
            foreach ($attribute->values as $value) {
                if (in_array($value->id, $attributes)) {
                    $dataFormat[$attribute->id] = $value->id;
                }
            }
        }
        return $dataFormat;
    }

    public function updateFromCart($data)
    {
        $cart = $this->getCart();
        if ( ! isset($cart[ $data['cart_item_id'] ] ) ) {
            return ['message' => __('messages.something_went_wrong'), 'code' => 500];
        }

        $product = Product::where( 'status', 'PUBLISHED' )->with('attributeValues')->find( $cart[$data['cart_item_id']]['product_id'] );

        if (empty($product)) {
            return ['message' => __('messages.something_went_wrong'), 'code' => 500];
        }
        $price          = $product->getUserPrice();

        $count          = $data['count'] ?? 1;

        $products_price = $price * $count;
        $cart[$data['cart_item_id']]['count'] = $count;

        $attributes       = $data['attributes'] ?? [];

        $attributes = $this->attributecCartFormat( $product, $attributes );
        $cart[$data['cart_item_id']]['attributes'] = $attributes;

        $this->setCart($cart);

        return [
            'message'        =>  __('messages.cart.cart_changed'),
            'products_price' => $products_price,
            'code'           => 200
        ];
    }

}
