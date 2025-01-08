<?php

namespace App\Http\Requests;

use App\Rules\Recaptcha;
use Illuminate\Foundation\Http\FormRequest;

class ContactRequest extends FormRequest
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
            'first_name' => ['required', 'string', 'max:50'],
            'email' => ['nullable', 'email', 'max:50', 'min:2'],
            'phone' => ['required', 'regex:/^\+38 \(\d{3}\) \d{3}-\d{2}-\d{2}$/'],
            'message' => ['required', 'string'],
        ];
    }

    public function messages()
    {
        return [
            'first_name.required' => __('messages.validator.first_name_required'),
            'first_name.string' => __('messages.validator.first_name_string'),
            'first_name.max' => __('messages.validator.first_name_max'),
            'first_name.min' => __('messages.validator.first_name_min'),

            'email.email' => __('messages.validator.email_email'),
            'email.max' => __('messages.validator.email_max'),

            'phone.required' => __('messages.validator.phone_required'),
            'phone.regex' => __('messages.validator.phone_regex'),

            'message.required' => __('messages.validator.message_required'),
            'message.string' => __('messages.validator.message_string'),
        ];
    }
}
