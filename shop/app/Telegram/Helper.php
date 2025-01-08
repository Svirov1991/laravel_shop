<?php

namespace App\Telegram;

class Helper {
    public static function sanitizeTelegramHtml(string $html): string
    {
        $allowedTags = '<strong><b><i><u><s><code><pre><a>';
        return  html_entity_decode( strip_tags($html, $allowedTags) );
    }
}