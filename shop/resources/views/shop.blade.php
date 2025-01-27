@extends('layout.base')
@section('meta-tags')
    @include('includes.meta-tags')
@endsection
@section('content')
<main class="main-content">
    @if( !empty($breadcrumbs))
        @include('page-header-area', $breadcrumbs)
    @endif

    <!--== Start Product Area Wrapper ==-->
    <section class="product-area product-inner-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    @if( empty( $products->total() ))
                        <h2>{{ __('messages.no_products') }}</h2>
                    @else
                        <div class="product-header-wrap d-md-flex justify-content-md-between align-items-center">
                            <div class="grid-list-option">
                                <nav>
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <button class="nav-link active" id="nav-grid-tab" data-bs-toggle="tab" data-bs-target="#nav-grid" type="button" role="tab" aria-controls="nav-grid" aria-selected="true"><i class="fa fa-th"></i></button>
                                        <button class="nav-link" id="nav-list-tab" data-bs-toggle="tab" data-bs-target="#nav-list" type="button" role="tab" aria-controls="nav-list" aria-selected="false"><i class="fa fa-th-list"></i></button>
                                    </div>
                                </nav>
                            </div>
                            <div class="nav-short-area d-md-flex align-items-center">
                                <p class="show-product">{{ __('messages.showing') }} {{ $products->firstItem() }} - {{ $products->lastItem() }} of {{ $products->total() }} {{ __('messages.result') }}</p>
                                <div class="toolbar-shorter">
                                    <label for="SortBy">{{ __('filters.sort-by') }}</label>
                                    <form id="sort-form" action="{{ request()->url() }}" method="GET">
                                        @foreach(request()->except('sort') as $key => $value)
                                            <input type="hidden" name="{{ $key }}" value="{{ $value }}">
                                        @endforeach
                                        <select id="SortBy" name="sort" class="form-select" aria-label="Sort by" onchange="document.getElementById('sort-form').submit();">
                                            <option value="new" {{ request('sort') === 'new' ? 'selected' : '' }}>{{ __('filters.new') }}</option>
                                            <option value="price-asc" {{ request('sort') === 'price-asc' ? 'selected' : '' }}>{{ __('filters.price-asc') }}</option>
                                            <option value="price-desc" {{ request('sort') === 'price-desc' ? 'selected' : '' }}>{{ __('filters.price-desc') }}</option>
                                            <option value="rating" {{ request('sort') === 'rating' ? 'selected' : '' }}>{{ __('filters.rating') }}</option>
                                        </select>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="product-body-wrap">
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-grid" role="tabpanel" aria-labelledby="nav-grid-tab">
                                    <div class="row">
                                        @foreach( $products as $product)
                                            <div class="col-sm-6 col-lg-4">
                                                @include( 'product-item', ['product' => $product] )
                                            </div>
                                        @endforeach
                                    </div>
                                    <!--== Start Pagination Wrap ==-->
                                    <div class="row">
                                        <div class="col-12">
                                            {{ $products->links('pagination') }}

                                        </div>
                                    </div>
                                    <!--== End Pagination Wrap ==-->
                                </div>
                                <div class="tab-pane fade" id="nav-list" role="tabpanel" aria-labelledby="nav-list-tab">
                                    <div class="row">
                                        @foreach( $products as $product)
                                            <div class="col-12">
                                                @include( 'product-item-v2', ['product' => $product] )
                                            </div>
                                        @endforeach
                                    </div>
                                    <!--== Start Pagination Wrap ==-->
                                    <div class="row">
                                        <div class="col-12">
                                            {{ $products->links('pagination') }}
                                        </div>
                                    </div>
                                    <!--== End Pagination Wrap ==-->
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </section>
    <!--== End Product Area Wrapper ==-->
</main>
@endsection
