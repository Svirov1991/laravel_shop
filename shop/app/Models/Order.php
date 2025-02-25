<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Product;

class Order extends Model
{
    use HasFactory;
    protected $fillable = ['cart', 'total_price', 'first_name', 'last_name', 'phone', 'shipping', 'status'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function getProducts()
    {
        $cart = json_decode( $this->cart );
        $cart_items = [];
        foreach ($cart as $kay => $item) {
            if ( empty( $item->product_id ) ) {
                continue;
            }
            $cart_items[$item->product_id] = $item->product_id;
        }
        $keys    = array_values($cart_items);

        $products = [];
        if ( ! empty($keys)) {
            $products = Product::whereIn('id', $keys)->with('attributeValues')->get()->keyBy('id');
        }

        $cart_products = [];
        foreach ($cart as $key => $item) {
            if ( empty($item->product_id) || ! isset( $products[$item->product_id] ) ) {
                $cart_products[] = (object) [
                    'title' => __('messages.product_not_found'),
                    'cart'  => $cart_items[$key],
                ];
            }else{
                $product = clone $products[$item->product_id];
                $product->cart = (object) $item;
                $cart_products [] = $product;
            }
        }

        return $cart_products;

    }

}
