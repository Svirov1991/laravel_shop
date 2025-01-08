<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Rules\Recaptcha;

class OrderRequest extends FormRequest
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
            'last_name' => ['required', 'string', 'max:50', 'min:2'],
            'email' => ['nullable', 'email', 'max:50', 'min:2'],
            'phone' => ['required', 'regex:/^\+38 \(\d{3}\) \d{3}-\d{2}-\d{2}$/'],
            'settlement_code' => ['required', 'string', 'max:255'],
            'settlement' => ['required', 'string', 'max:255'],
            'office_code' => ['required', 'string', 'max:255'],
            'office' => ['required', 'string', 'max:255'],
        ];
    }

    public function messages()
    {
        return [
            'first_name.required' => __('messages.validator.first_name_required'),
            'first_name.string' => __('messages.validator.first_name_string'),
            'first_name.max' => __('messages.validator.first_name_max'),
            'first_name.min' => __('messages.validator.first_name_min'),

            'last_name.required' => __('messages.validator.last_name_required'),
            'last_name.string' => __('messages.validator.last_name_string'),
            'last_name.max' => __('messages.validator.last_name_max'),
            'last_name.min' => __('messages.validator.last_name_min'),

            'email.email' => __('messages.validator.email_email'),
            'email.max' => __('messages.validator.email_max'),

            'phone.required' => __('messages.validator.phone_required'),
            'phone.regex' => __('messages.validator.phone_regex'),

            'settlement_code.required' => __('messages.validator.settlement_code_required'),
            'settlement_code.string' => __('messages.validator.settlement_code_string'),
            'settlement_code.max' => __('messages.validator.settlement_code_max'),

            'settlement.required' => __('messages.validator.settlement_required'),
            'settlement.string' => __('messages.validator.settlement_string'),
            'settlement.max' => __('messages.validator.settlement_max'),

            'office_code.required' => __('messages.validator.office_code_required'),
            'office_code.string' => __('messages.validator.office_code_string'),
            'office_code.max' => __('messages.validator.office_code_max'),

            'office.required' => __('messages.validator.office_required'),
            'office.string' => __('messages.validator.office_string'),
            'office.max' => __('messages.validator.office_max'),
        ];
    }
}
