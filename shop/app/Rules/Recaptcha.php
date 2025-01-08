<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use GuzzleHttp\Client;

class Recaptcha implements Rule
{
    public function passes($attribute, $value)
    {
        $client = new Client();
        $response = $client->post('https://www.google.com/recaptcha/api/siteverify', [
            'form_params' => [
                'secret' => config('services.recaptcha.secret_key'),
                'response' => $value,
            ],
        ]);

        $result = json_decode($response->getBody(), true);

        return isset($result['success']) && $result['success'] && $result['score'] >= 0.5;
    }

    public function message()
    {
        return __('messages.reCAPTCHA_failed');
    }
}