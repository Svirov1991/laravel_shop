<?php

namespace App\Observers;

use App\Models\Product;
use Illuminate\Support\Facades\Request;
class ProductObserver
{
    /**
     * Обработать событие после создания продукта.
     */
    public function created(Product $product)
    {
        // Если мета-данные переданы в запросе, создаем их
        if (Request::has('meta_title') || Request::has('meta_description') || Request::has('meta_keywords')) {
            $product->metaTags()->create([
                'meta_title' => Request::input('meta_title', ''),
                'meta_description' => Request::input('meta_description', ''),
                'meta_keywords' => Request::input('meta_keywords', ''),
            ]);
        }
    }

    /**
     * Обработать событие при обновлении продукта.
     */
    public function updated(Product $product)
    {
        // Если мета-данные переданы в запросе, обновляем их
        if (Request::has('meta_title') || Request::has('meta_description') || Request::has('meta_keywords')) {
            $product->metaTags()->updateOrCreate(
                [],
                [
                    'meta_title' => Request::input('meta_title', ''),
                    'meta_description' => Request::input('meta_description', ''),
                    'meta_keywords' => Request::input('meta_keywords', ''),
                ]
            );
        }
    }

    /**
     * Обработать событие при удалении продукта.
     */
    public function deleted(Product $product)
    {
        // Удаляем связанные мета-данные
        $product->metaTags()->delete();
    }
}
