<?php

namespace App\Http\Requests;

use App\Rules\Recaptcha;
use Illuminate\Foundation\Http\FormRequest;

class ProfileRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return auth()->check();
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
            'name' => ['required', 'string', 'min:2', 'max:255'],
            'last_name' => ['nullable', 'string', 'min:2', 'max:255'],
            'phone' => [
                'nullable',
                'regex:/^\+38 \(\d{3}\) \d{3}-\d{2}-\d{2}$/'
            ],
            'password' => ['nullable', 'string', 'min:5', 'confirmed'],

        ];
    }

    public function messages()
    {
        return [
            'name.required' => __('messages.validator.first_name_required'),
            'name.string' => __('messages.validator.first_name_string'),
            'name.max' => __('messages.validator.first_name_max'),
            'name.min' => __('messages.validator.first_name_min'),

            'last_name.required' => __('messages.validator.last_name_required'),
            'last_name.string' => __('messages.validator.last_name_string'),
            'last_name.max' => __('messages.validator.last_name_max'),
            'last_name.min' => __('messages.validator.last_name_min'),

            'phone.regex' => __('messages.validator.phone_regex'),

            'password.required' => __('messages.validator.password_required'),
            'password.string' => __('messages.validator.password_string'),
            'password.min' => __('messages.validator.password_min'),
            'password.max' => __('messages.validator.password_max'),
            'password.confirmed' => __('messages.validator.password_confirmed'),

            'recaptcha_token.required' => __('messages.reCAPTCHA_failed'),
        ];
    }
}
