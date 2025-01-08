@extends('layout.base')
@section('meta-tags')
    @include('includes.meta-tags' )
@endsection
@section('content')
    <main class="main-content">
        @include('page-header-area', $breadcrumbs)
        <section class="blog-area blog-inner-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            @foreach( $posts as $post )
                                <div class="col-12">
                                    <!--== Start Blog Item ==-->
                                    <div class="post-item">
                                        <div class="inner-content">
                                            <div class="thumb">
                                                <a href="{{ route('single-item', [ $post->category->slug, $post->slug ]) }}">
                                                    <img class="w-100" src="/storage/{{ $post->image }}" alt="{{ $post->title }}">
                                                </a>
                                            </div>
                                            <div class="content">
                                                <h4 class="title"><a href="{{ route('single-item', [ $post->category->slug, $post->slug ]) }}">{{ $post->title }}</a></h4>
                                                <ul class="meta">
                                                    <li><span>{{ $post->created_at->format('d.m.Y') }}</span></li>
                                                </ul>
                                                <p>{{ $post->excerpt }}</p>
                                                <a class="btn-theme" href="{{ route('single-item', [ $post->category->slug, $post->slug ]) }}">{{ __('messages.read_more') }}</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--== End Blog Item ==-->
                                </div>
                            @endforeach
                        </div>
                        <!--== Start Pagination Wrap ==-->
                        <div class="row">
                            <div class="col-12">
                                {{ $posts->links('pagination') }}
                            </div>
                        </div>
                        <!--== End Pagination Wrap ==-->
                    </div>
                    <div class="col-lg-4">
                        <!--== Start Sidebar Area ==-->
                        <div class="sidebar-area inner-left-padding">
                            @include('latest-posts', [ 'latest_posts' => $latest_posts])
                        </div>
                        <!--== End Sidebar Area ==-->
                    </div>
                </div>
            </div>
        </section>
    </main>
@endsection
