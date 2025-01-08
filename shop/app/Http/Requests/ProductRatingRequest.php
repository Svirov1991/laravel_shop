<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRatingRequest extends FormRequest
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
            'product_id' => ['required', 'integer', 'exists:products,id'],
            'rating' => 'required|integer|min:1|max:5'
        ];
    }

    public function messages()
    {
        return [
            'product_id.required' => __('messages.validator.product_id_required'),
            'product_id.integer' => __('messages.validator.product_id_integer'),
            'product_id.exists' => __('messages.validator.product_id_exists'),

            'rating.required' => __('messages.validator.rating_required'),
            'rating.integer' => __('messages.validator.rating_integer'),
            'rating.min' => __('messages.validator.rating_min'),
            'rating.max' => __('messages.validator.rating_max'),

        ];
    }
}
