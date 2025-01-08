<?php

namespace App\Http\Controllers;

use App\Http\Requests\FavoritsRequest;
use App\Models\Attribute;
use App\Services\FavoritesService;

class FavoritesController extends Controller
{
    public $service;
    public function __construct(FavoritesService $Service)
    {
        $this->service = $Service;
    }

    public function index(){
        $products = $this->service->getProducts();
        $attributes  = Attribute::with('values')->get();
        $breadcrumbs = [
            ['name' => __('messages.main'), 'url' => route('home')],
            ['name' => __('messages.favorites'), 'url' => route('favorites')],
        ];
        return view('shop', compact('products', 'attributes', 'breadcrumbs' ));
    }

    public function action( FavoritsRequest $request ){
        $toggle = $this->service->toggleFavorite($request->input('id'));
        return response()->json( $toggle );
    }
}
