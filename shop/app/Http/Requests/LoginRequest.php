<?php

namespace App\Http\Requests;

use App\Rules\Recaptcha;
use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'recaptcha_token' => ['required', new Recaptcha()],
            'email' => ['required', 'email', 'max:50', 'min:2', 'exists:users,email'],
            'password' => ['required', 'string', 'min:5', 'max:50'],
            'remember' => ['nullable', 'boolean'],
        ];
    }

    public function messages()
    {
        return [
            'email.required' => __('messages.validator.email_required'),
            'email.email' => __('messages.validator.email_email'),
            'email.max' => __('messages.validator.email_max'),
            'email.min' => __('messages.validator.email_min'),
            'email.exists' => __('messages.validator.email_exists'),

            'password.required' => __('messages.validator.password_required'),
            'password.string' => __('messages.validator.password_string'),
            'password.min' => __('messages.validator.password_min'),
            'password.max' => __('messages.validator.password_max'),

            'remember.boolean' => __('messages.validator.remember_boolean'),

            'recaptcha_token.required' => __('messages.reCAPTCHA_failed'),
        ];
    }

    protected function prepareForValidation()
    {
        $this->merge([
            'remember' => $this->has('remember'),
        ]);
    }
}
