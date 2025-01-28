<?php

namespace App\Services;

use App\Models\Message;

class MessageService
{
    public function sendMessage(array $request)
    {
        $message = Message::create($request);
        if ($message) {
            $telegram_message = "<b>Інформація</b>\n";
            $telegram_message .= "\xF0\x9F\x91\xA4 Ім'я: " . $request['first_name'] . "\n";
            $telegram_message .= "\xF0\x9F\x93\x9E Телефон: " . str_replace([' ', '(', ')', '-'], '', $request['phone']) . "\n";
            if ( ! empty($request['email'])) {
                $telegram_message .= "\xF0\x9F\x93\xA8 Email: " . $request['email'] . "\n";
            }
            $telegram_message .= "\xF0\x9F\x93\xB0 Повідомлення: " . $request['message'] . "\n";

            $telegram_message = "\xF0\x9F\x94\xA5 <b>Зворотний зв'язок</b>\xF0\x9F\x94\xA5 \n\n" . $telegram_message;

            \App\Telegram\Orders::sendMessageAdmin($telegram_message);
        }

        return $message;
    }
}
