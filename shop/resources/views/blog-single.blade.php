@extends('layout.base')
@section('meta-tags')
    @include('includes.meta-tags' )
@endsection
@section('content')
    <main class="main-content">
        @if( !empty($breadcrumbs))
            @include('page-header-area', $breadcrumbs)
        @endif
        <section class="blog-details-area">
            <div class="container">
                <div class="row flex-row-reverse">
                    <div class="col-lg-8">
                        <div class="blog-details-content-wrap">
                            <div class="thumb">
                                <img src="/storage/{{ $post->image }}" alt="{{ $post->title }}">
                            </div>
                            <div class="content-info">
                                <ul class="meta">
                                    <li>{{ $post->created_at->format('d.m.Y') }}</li>
                                </ul>
                                <h4 class="title">{{ $post->title }}</h4>
                            </div>
                            <div class="content">
                                {!! $post->body !!}
                            </div>
                        </div>
                    </div>
                    <style>
                        .blog-details-content-wrap .content{
                            p{
                                margin-top: 10px;
                            }

                            li{
                                color: #222;
                                margin-top: 5px;
                                font-size: 14px;
                                line-height: 20px;
                                letter-spacing: 0.3px;
                                margin-left: 20px;
                            }

                            li::before {
                                content: "-"; /* Добавляем тире */
                                margin-right: 8px; /* Отступ между тире и текстом */
                                color: #000; /* Цвет тире */
                            }
                        }
                    </style>
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
