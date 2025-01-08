<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CurrencyRequest extends FormRequest
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
            'code' => ['required', 'string', 'exists:currencies,code'],
        ];
    }

    public function messages()
    {
        return [
            'code.required' => __('messages.validator.currency-code-required'),
            'code.string' => __('messages.validator.currency-code-string'),
            'code.exists' => __('messages.validator.currency-code-exists')
        ];
    }
}
