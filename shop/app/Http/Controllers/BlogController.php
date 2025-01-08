<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;

class BlogController extends Controller
{
    public function index( $category )
    {
        $posts = Post::where( 'status', 'PUBLISHED' )->where( 'category_id', $category->id )->paginate(6);
        $posts->getCollection()->transform(function ($post) use ($category) {
            $post->category = $category;
            return $post;
        });

        $latest_posts = Post::where( 'status', 'PUBLISHED' )->with( 'category' )->latest()->limit(3)->get();
        $breadcrumbs = [
            ['name' => __('messages.main'), 'url' => route('home')],
            ['name' => $category->name, 'url' => route('handle-slug', [ $category->slug ])],
        ];
        $metaTags = \App\Services\MetaTagsService::prepareMetaTags( $category );
        return view('blog', compact('posts', 'latest_posts', 'breadcrumbs', 'category', 'metaTags' ) );
    }

    public function single( $category, $slug )
    {

        $post = Post::where( 'status', 'PUBLISHED' )->where( 'slug', $slug )->firstOrFail();
        $post->setRelation('category', $category);
        $latest_posts = Post::where( 'status', 'PUBLISHED' )->with( 'category' )->latest()->limit(3)->get();
        $breadcrumbs = [
            ['name' => __('messages.main'), 'url' => route('home')],
            ['name' => $category->name, 'url' => route('handle-slug', [$category->slug] )],
            ['name' => $post->title, 'url' => route('single-item', [$category->slug, $post->slug])]
        ];
        $metaTags = \App\Services\MetaTagsService::prepareMetaTags( $post );
        return view('blog-single', compact('post', 'latest_posts', 'breadcrumbs', 'metaTags') );
    }
}
