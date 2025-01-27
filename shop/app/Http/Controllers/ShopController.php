<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProductRatingRequest;
use App\Models\Attribute;
use App\Models\MainBanner;
use App\Models\Product;
use App\Models\ProductCategory;
use Illuminate\Http\Request;

class ShopController extends Controller
{

    public function index( $category )
    {
        $request = request();
        $sort = $request->get('sort', 'new');
        $products = $category->products()->whereIn(
            'status',
            ['PUBLISHED', 'NOT_AVAILABlE']
        )->with('attributeValues', 'category');
        switch ($sort) {
            case 'price-asc':
                $products->orderByRaw('COALESCE(discount_price, price) ASC');
                break;
            case 'price-desc':
                $products->orderByRaw('COALESCE(discount_price, price) DESC');
                break;
            case 'rating':
                $products->orderBy('rating', 'desc');
                break;
            case 'new':
                $products->orderBy('new', 'desc');
                $products->orderBy('created_at', 'desc');
                break;
            default:
                $products->orderBy('new', 'desc');
                $products->orderBy('created_at', 'desc');
        }
        $products = $products->paginate(1);

        $attributes  = Attribute::with('values')->get();
        $breadcrumbs = [
            ['name' => __('messages.main'), 'url' => route('home')],
            ['name' => $category->title, 'url' => route('handle-slug', $category->slug)],
        ];
        $metaTags = \App\Services\MetaTagsService::prepareMetaTags( $category );
        return response()
            ->view('shop', compact('products', 'attributes', 'breadcrumbs', 'metaTags' ));
    }

    public function product( $category, $product_slug )
    {
        $product = Product::where('slug', $product_slug)->whereIn(
            'status',
            ['PUBLISHED', 'NOT_AVAILABlE']
        )->where('product_category_id', $category->id)->with(
            'attributeValues.attribute'
        )->firstOrFail();

        $product->setRelation('category', $category);

        $relatedProducts = Product::with('attributeValues', 'category')->whereNot('id', $product->id)->where( 'product_category_id', $product->category->id )->where( 'status', 'PUBLISHED' )->limit(12)->get();
        $breadcrumbs = [
            ['name' => 'Головна', 'url' => route('home')],
            ['name' => $category->title, 'url' => route('handle-slug', $product->category->slug)],
            ['name' => $product->title, 'url' => route('single-item', [$product->category->slug, $product->slug])],
        ];
        $metaTags = \App\Services\MetaTagsService::prepareMetaTags( $product );
        return view('product', compact('product', 'relatedProducts', 'breadcrumbs', 'metaTags' ));
    }

    public function updateProductRating(ProductRatingRequest $request)
    {
        $productId          = $request->input('product_id');
        $userRating         = $request->input('rating');
        $userProductsRating = session('product_rating', []);

        if(! is_array($userProductsRating)) {
            $userProductsRating = [];
        }

        if (in_array((int)$productId, $userProductsRating)) {
            return response()->json(['message' => __('messages.already_rated_this_product')]
            );
        }
        $userProductsRating[] = $productId;
        session()->put('product_rating', $userProductsRating);

        $product         = Product::where('id', $productId)->where( 'status', 'PUBLISHED' )->first();
        $numberOfRatings = $product->number_of_ratings;
        $rating          = $product->rating;
        if (empty($product->number_of_ratings) || empty($product->rating)) {
            $newRating          = $userRating;
            $newNumberOfRatings = 1;
        } else {
            $currentRatingsSum  = $numberOfRatings * $rating;
            $newNumberOfRatings = $numberOfRatings + 1;
            $newRating          = round(
                ($currentRatingsSum + $userRating) / ($newNumberOfRatings),
                3
            );
        }

        Product::where('id', $productId)->update([
            'number_of_ratings' => $newNumberOfRatings,
            'rating'            => $newRating,
        ]);

        return response()->json(['message' => __('messages.product_rating_accepted')]);
    }

    public function new()
    {
        $products = Product::where('status', 'PUBLISHED')->where('new', 1)->with('attributeValues', 'category')->paginate(9);
        $breadcrumbs = [
            ['name' => __('messages.main'), 'url' => route('home')],
            ['name' => __('messages.new_products'), 'url' => route('new-products')],
        ];
        $metaTags = \App\Services\MetaTagsService::prepareMetaTags( [] );
        return view('shop', compact('products', 'breadcrumbs', 'metaTags' ));
    }
}
