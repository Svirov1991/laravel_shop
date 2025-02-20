@extends('layout.base')
@section('meta-tags')
    @include('includes.meta-tags' )
@endsection
@section('content')
    <main class="main-content">
        @if( !empty($breadcrumbs))
            @include('page-header-area', $breadcrumbs)
        @endif
        @if( !empty( $page->image ))
            <section class="blog-details-area">
                <div class="container">
                    <div class="row flex-row-reverse">
                        <div class="col-lg-12">
                            <div class="blog-details-content-wrap">
                                @if( !empty( $page->image ))
                                    <div class="thumb">
                                        {!! getImage( [
                                            'image' => $page->image,
                                            'thumbnails' => [],
                                            'main_size' => 1170,
                                            'sizes' => [ 1200 => 100, 'default' => '1170px'],
                                            'alt' => $page->title,
                                            ] ) !!}
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        @endif
        <div class="blog-details-content-wrap pb-5">
            {!! $page->render('body'); !!}
        </div>
        <style>
            .blog-details-content-wrap {
                p {
                    margin-top: 10px;
                }

                li {
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
    </main>
@endsection
