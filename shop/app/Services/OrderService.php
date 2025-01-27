<?php

namespace App\Services;

use App\Models\AttributeValue;
use App\Models\Order;

class OrderService
{
    public function makeOrder($request)
    {
        $cartService  = app(CartService::class);
        $cartProducts = $cartService->getCartProducts();
        if (empty($cartProducts)) {
            return false;
        }
        $cart = [];

        $telegram_message = "";
        foreach ($cartProducts as $item) {
            $telegram_message .= "\xE2\x9C\x85 <b>Товар: </b>" . $item->title . " ( " . $item->cart->count ." од. ) \n";
            $cartProduct           = $item->cart;
            $cartProduct->price    = $item->getUserPrice();
            $cartProduct->currency = $item->getCurrencySymbol();
            $cart_attributes = $cartProduct->attributes;
            $telegram_message .= "<b>Вартість:</b> " . $item->getUserPrice() . $item->getCurrencySymbol() . " ( Усього " . $item->getUserPrice() *  $item->cart->count . $item->getCurrencySymbol() . ") \n";

            foreach ($item->getPrimeAttributesData() as $primeAttribute) {
                $cart_attribute = isset($cart_attributes[$primeAttribute->id]) ? $cart_attributes[$primeAttribute->id] : null;
                if ($cart_attribute) {
                    foreach ($primeAttribute->values as $value) {
                        if ($value->id == $cart_attribute) {
                            $cartProduct->attributes_html[] = '<span class="info">' . $primeAttribute->name . ': ' . $value->value . '.</span> ';
                            $telegram_message .= "<b>" . $primeAttribute->name . ": </b>" . $value->value ." \n";
                        }
                    }
                }
            }
            $cart[] = $cartProduct;
            $telegram_message .= "\n\n";
        }



        $currency = app(CurrencyService::class)->getUserCurrency();


        $order                  = new Order();
        $order->cart            = json_encode($cart);
        $order->total_price     = $cartService->getTotalPrice();
        $order->currency        = $currency->code . ' ( ' . $currency->symbol . ' )';
        $order->first_name      = $request['first_name'];
        $order->last_name       = $request['last_name'];
        $order->email           = $request['email'] ?? null;
        $order->phone           = $request['phone'];
        $order->settlement_code = $request['settlement_code'];
        $order->settlement      = $request['settlement'];
        $order->office_code     = $request['office_code'];
        $order->office          = $request['office'];
        if (auth()->check()) {
            $order->user_id = auth()->id();
        }
        $order->save();

        if( $order ){
            $telegram_message .= "\xF0\x9F\x92\xB5 <b>Загальна вартість замовлення: </b> " . $cartService->getTotalPrice() . $currency->symbol . "\n\n";

            $telegram_message .= "<b>Інформація про покупця</b>\n";
            $telegram_message .= "\xF0\x9F\x91\xA6 Покупець: " . $request['first_name'] . ' ' . $request['last_name'] . "\n";
            $telegram_message .= "\xF0\x9F\x93\x9E Телефон: " . str_replace([' ', '(', ')', '-'], '', $request['phone'] ) . "\n";
            $telegram_message .= "\xF0\x9F\x8C\x8F Населенний пункт: " . $request['settlement'] . "\n";
            $telegram_message .= "\xF0\x9F\x8F\xAA Відділення НП: " . $request['office'] . "\n";

            $telegram_message = "\xF0\x9F\x94\xA5 <b>Нове замовлення (№ " . $order->id .")</b> \xF0\x9F\x94\xA5 \n\n" . $telegram_message;
            \App\Telegram\Orders::sendMessageAdmin( $telegram_message );

            session()->put('cart', []);
        }

        return $order;
    }
}
