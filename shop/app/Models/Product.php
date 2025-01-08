<?php

namespace App\Models;

use App\Services\CurrencyService;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;
use TCG\Voyager\Traits\Translatable;
use App\Services\ProductService;

class Product extends Model
{
    use HasFactory;
    use Translatable;
    use Resizable;

    protected $fillable
        = [
            'product_category_id',
            'title',
            'slug',
            'description',
            'full_description',
            'size_chart',
            'images',
            'image_thumbnails',
            'article',
            'price',
            'discount_price',
            'currency_id',
            'rating',
            'number_of_ratings',
            'status',
            'featured',
            'new',
            'created_at',
            'updated_at'
        ];

    protected static function booted()
    {
        static::saved(function ($product) {
            $attributes = request()->input('attributes', []);
            $product->attributeValues()->sync($attributes);
        });
    }

    public function category()
    {
        return $this->belongsTo(ProductCategory::class, 'product_category_id');
    }

    public function attributeValues()
    {
        return $this->belongsToMany(
            AttributeValue::class,
            'product_attribute_values'
        );
    }

    public function productCategoryId()
    {
        return $this->belongsTo(ProductCategory::class, 'product_category_id');
    }

    public function metaTags()
    {
        return $this->morphOne(MetaTag::class, 'page', 'page_type', 'page_id');
    }

    public function getPrice()
    {
        $currency = app(CurrencyService::class);
        $price    = $this->price;
        if ( ! empty($this->discount_price) && $this->discount_price < $this->price) {
            $price = $this->discount_price;
        }

        return $currency->calculatePrice($price, $this->currency_id);
    }

    public function getOldPrice()
    {
        $currency = app(CurrencyService::class);

        if (empty($this->discount_price) || $this->discount_price >= $this->price) {
            return null;
        }

        return $currency->calculatePrice($this->price, $this->currency_id);
    }

    public function getCurrencySymbol()
    {
        $currency     = app(CurrencyService::class);
        $userCurrency = $currency->getUserCurrency();
        if ( ! $userCurrency) {
            return false;
        }

        return $userCurrency->symbol;
    }

    public function currencyId()
    {
        return $this->belongsTo(Currency::class, 'currency_id');
    }

    public function getAttributesData()
    {
        return $this->attributeValues->groupBy('attribute_id')->map(
                fn($values, $attributeId) => (object)[
                    'id'     => $attributeId,
                    'name'   => $values->first()->attribute->name,
                    'prime'  => $values->first()->attribute->prime,
                    'values' => $values->map(fn($value) => (object)[
                        'id'    => $value->id,
                        'value' => $value->value,
                    ])->values(),
                ]
            )->values();
    }

    public function getPrimeAttributesData()
    {
        return $this->attributeValues->groupBy('attribute_id')->filter(
                fn($values) => $values->first()->attribute->prime
            )->map(fn($values, $attributeId) => (object)[
                'id'     => $attributeId,
                'name'   => $values->first()->attribute->name,
                'values' => $values->map(fn($value) => (object)[
                    'id'    => $value->id,
                    'value' => $value->value,
                ])->values(),
            ])->values();
    }

    public function getRegularAttributesData()
    {
        return $this->attributeValues->groupBy('attribute_id')->filter(
                fn($values) => ! $values->first()->attribute->prime
            )->map(fn($values, $attributeId) => (object)[
                'id'     => $attributeId,
                'name'   => $values->first()->attribute->name,
                'values' => $values->map(fn($value) => (object)[
                    'id'    => $value->id,
                    'value' => $value->value,
                ])->values(),
            ])->values();
    }

    public function isPublished()
    {
        return $this->status == 'PUBLISHED';
    }

}
