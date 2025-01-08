<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Rules\Recaptcha;
class SubscribeRequest extends FormRequest
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
            'email' => ['required', 'email', 'max:50', 'min:2'],
        ];
    }

    public function messages()
    {
        return [
            'email.required' => __('messages.validator.email_required'),
            'email.email' => __('messages.validator.email_email'),
            'email.max' => __('messages.validator.email_max'),
        ];
    }
}
