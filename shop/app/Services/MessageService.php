<?php

namespace App\Services;

use App\Models\Message;

class MessageService
{
    public function sendMessage(array $request)
    {
        return Message::create($request);
    }
}
