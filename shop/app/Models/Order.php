<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Product;

class Order extends Model
{
    use HasFactory;
    protected $fillable = ['cart', 'total_price', 'first_name', 'last_name', 'phone', 'shipping'];

    public function getProducts()
    {
        $cart = json_decode( $this->cart );
        $cart_items = [];
        foreach ($cart as $item) {
            if ( empty( $item->product_id ) ) {
                continue;
            }
            $cart_items[(int)$item->product_id] = $item;
        }
        $keys    = array_values(array_keys($cart_items));

        $product = [];
        if ( ! empty($keys)) {
            $product = Product::whereIn('id', $keys)->with('attributeValues')->get()->map(function ($product) use ($cart_items) {
                $product->cart = (object) $cart_items[$product->id];
                return $product;
            })->keyBy('id');
        }

        foreach ( $keys as $key ) {
            if( !isset( $product[ $key ] ) ) {
                $product[] = 'Product id ' . $key . ' not found';
            }
        }

        return $product;

    }

}
