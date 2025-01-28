<?php
namespace App\Services;


use App\Models\Product;

class FavoritesService
{

    public $favorites = false;

    public function getFavorites() : array
    {
        if( $this->favorites === false ){
            $this->favorites = session()->get('favorites', []);
        }
        return $this->favorites;
    }

    public function setFavorites( $favorites = [] )
    {
        session()->put('favorites', $favorites);
        $this->favorites = $favorites;
    }

    public function getProducts()
    {
        $products = Product::whereIn(
            'status',
            ['PUBLISHED', 'NOT_AVAILABlE']
        )->whereIn('id', $this->getFavorites())->with(
            'attributeValues',
            'category'
        );
        $request  = request();
        $sort     = $request->get('sort', 'new');
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

        return $products->paginate(9);
    }

    public function toggleFavorite( int $id ){
        $favorites = $this->getFavorites();
        if (in_array($id, $favorites)) {
            $favorites = array_filter($favorites, function ($item) use ($id) {
                return $item != $id;
            });
            $message = __('messages.favorites_deleted');
            $toggle = false;
        } else {
            $favorites[] = $id;
            $message = __('messages.added_to_favorites');
            $toggle = true;
        }
        $this->setFavorites($favorites);
        return [ 'message' => $message, 'toggle' => $toggle, 'count' => count($favorites) ];
    }
}
