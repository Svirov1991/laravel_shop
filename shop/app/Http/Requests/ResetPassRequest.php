<?php

namespace App\Http\Requests;

use App\Rules\Recaptcha;
use Illuminate\Foundation\Http\FormRequest;

class ResetPassRequest extends FormRequest
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
            'token' => ['required'],
            'email' => ['required', 'email', 'max:50', 'min:2', 'exists:users,email'],
            'password' => ['required', 'string', 'min:5', 'max:50', 'confirmed'],
        ];
    }

    public function messages()
    {
        return [
            'token.required' => __('messages.something_went_wrong'),

            'email.email' => __('messages.validator.email_email'),
            'email.max' => __('messages.validator.email_max'),
            'email.min' => __('messages.validator.email_min'),
            'email.exists' => __('messages.validator.email_exists'),

            'password.required' => __('messages.validator.password_required'),
            'password.string' => __('messages.validator.password_string'),
            'password.min' => __('messages.validator.password_min'),
            'password.max' => __('messages.validator.password_max'),
            'password.confirmed' => __('messages.validator.password_confirmed'),

            'recaptcha_token.required' => __('messages.reCAPTCHA_failed'),
        ];
    }
}
