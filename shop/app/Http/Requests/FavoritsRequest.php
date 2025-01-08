<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FavoritsRequest extends FormRequest
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
            'id' => ['required', 'integer', 'exists:products,id'],
        ];
    }

    public function messages()
    {
        return [
            'id.required' => __('messages.validator.favorits-id-required'),
            'id.string' => __('messages.validator.favorits-id-string'),
            'id.exists' => __('messages.validator.favorits-id-exists'),
        ];
    }
}
