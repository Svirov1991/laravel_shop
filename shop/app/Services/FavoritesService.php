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
        return Product::whereIn(
            'status',
            ['PUBLISHED', 'NOT_AVAILABlE']
        )->whereIn('id', $this->getFavorites())->with(
            'attributeValues',
            'category'
        )->paginate(9);
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
