<?php

namespace App\Http\Requests;

use App\Rules\Recaptcha;
use Illuminate\Foundation\Http\FormRequest;

class RegistrationRequest extends FormRequest
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
            'name' => ['required', 'string', 'min:2', 'max:255'],
            'email' => ['required', 'email', 'max:50', 'min:2', 'unique:users,email'],
            'password' => ['required', 'string', 'min:5', 'max:50', 'confirmed'],
        ];
    }


    public function messages()
    {
        return [
            'name.required' => __('messages.validator.first_name_required'),
            'name.string' => __('messages.validator.first_name_string'),
            'name.max' => __('messages.validator.first_name_max'),
            'name.min' => __('messages.validator.first_name_min'),

            'email.email' => __('messages.validator.email_email'),
            'email.max' => __('messages.validator.email_max'),
            'email.min' => __('messages.validator.email_min'),
            'email.unique' => __('messages.validator.email_unique'),

            'password.required' => __('messages.validator.password_required'),
            'password.string' => __('messages.validator.password_string'),
            'password.min' => __('messages.validator.password_min'),
            'password.max' => __('messages.validator.password_max'),
            'password.confirmed' => __('messages.validator.password_confirmed'),

            'recaptcha_token.required' => __('messages.reCAPTCHA_failed'),
        ];
    }

}
