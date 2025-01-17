<?php

namespace App\Http\Controllers;

use App\Http\Requests\ContactRequest;
use App\Http\Requests\SubscribeRequest;
use App\Models\Message;
use App\Models\Post;
use App\Services\MessageService;
use Illuminate\Routing\Controller as BaseController;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\MainBanner;
use App\Models\Page;
use TCG\Voyager\Models\Category;

class MainController extends BaseController
{

    public function index()
    {
        $categories = ProductCategory::where('featured', 1)->limit(2)->get();
        $featured_products = Product::where('featured', 1)->where( 'status', 'PUBLISHED' )->with( 'category' )->limit(4)->get();
        $discounted_products = Product::whereNotNull('discount_price')->where( 'status', 'PUBLISHED' )->with( 'category' )->limit(4)->get();
        $latest_posts = Post::where( 'status', 'PUBLISHED' )->with( 'category' )->latest()->limit(6)->get();
        $home_page = setting('site.home_page');
        if ( !empty( $home_page ) ) {
            $home_page = Page::where('id', $home_page)->first();
        }

        $main_banner = MainBanner::all();
        $page = $home_page ?? [];
        $metaTags = \App\Services\MetaTagsService::prepareMetaTags( $page );
        return view('index', compact('categories', 'featured_products', 'main_banner', 'discounted_products', 'latest_posts', 'metaTags', 'home_page'));
    }

    public function handleSlug($url_slug)
    {
        $page = Page::where('slug', $url_slug)->where('status', 'ACTIVE')->first();
        if ($page) {
            $breadcrumbs = [
                ['name' => __('messages.main'), 'url' => route('home')],
                ['name' => $page->title, 'url' => route('handle-slug', $page->slug)],
            ];
            $metaTags = \App\Services\MetaTagsService::prepareMetaTags( $page );
            return view('page', ['page' => $page, 'breadcrumbs' => $breadcrumbs, 'metaTags' => $metaTags]);
        }

        $category = Category::where('slug', $url_slug)->first();
        if ( $category ) {
            $BlogController = app(BlogController::class);
            return $BlogController->index( $category );
        }

        $ProductCategory = ProductCategory::where('slug', $url_slug)->firstOrFail();
        if ($ProductCategory) {
            $shopController = app(ShopController::class);
            return $shopController->index( $ProductCategory );
        }

        abort(404);
    }

    public function singleItem($category_slug, $slug){

        $productCategory = ProductCategory::where('slug', $category_slug)->first();
        if ($productCategory) {
            $shopController = app(ShopController::class);
            return $shopController->product( $productCategory, $slug );
        }

        $category = Category::where('slug', $category_slug)->first();
        if ( $category ) {
            $blogController = app(BlogController::class);
            return $blogController->single( $category, $slug );
        }

        abort(404);
    }

    public function contactForm( ContactRequest $request )
    {
        $message = app(MessageService::class);
        $data = $request->validated();
        $data['type'] = 'contact-form';
        $order = $message->sendMessage( $data );
        if( $order ){
            return redirect()->back()->with('success', __('messages.message_success'));
        } else {
            return redirect()->back()->with('error', __('messages.message_error'));
        }
    }

    public function subscribeForm(SubscribeRequest $request)
    {
        $type = 'subscribe';
        $data = $request->validated();
        if (Message::where('email', $data['email'])->where(
            'type',
            $type
        )->exists()
        ) {
            return response()->json(
                ['message' => __('messages.already_subscribe')]
            );
        }

        $data['type'] = $type;
        $message      = Message::create($data);

        if ($message) {
            return response()->json(
                ['message' => __('messages.subscribe_success')]
            );
        } else {
            return response()->json(['message' => __('messages.message_error')],
                500);
        }
    }
}
