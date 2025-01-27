<?php

namespace App\Http\Requests;

use App\Rules\Recaptcha;
use Illuminate\Foundation\Http\FormRequest;

class EmailRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'recaptcha_token' => ['required', new Recaptcha()],
            'email' => ['required', 'email', 'max:50', 'min:2', 'exists:users,email'],
        ];
    }

    public function messages()
    {
        return [
            'email.email' => __('messages.validator.email_email'),
            'email.max' => __('messages.validator.email_max'),
            'email.min' => __('messages.validator.email_min'),
            'email.exists' => __('messages.validator.email_exists'),

            'recaptcha_token.required' => __('messages.reCAPTCHA_failed'),
        ];
    }
}
