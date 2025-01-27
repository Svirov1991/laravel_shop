@php
    $metaTags = ['title' => __('profile.menu-item-orders') ];
@endphp
@extends('profile.index')
@section('profile')
    @if( !empty( session('success') ) )
        <h4 class="mb-4 text-success">{{ session('success') }}</h4>
    @endif
    <!-- Orders Table -->
    <div class="table-responsive">
        <table class="table table-hover mb-0">
            <thead>
            <tr>
                <th>№</th>
                <th>{{ __('messages.date') }}</th>
                <th>{{ __('messages.status') }}</th>
                <th>{{ __('messages.total_price') }}</th>
            </tr>
            </thead>
            <tbody>
            @php
                $orders = $user->orders;
                $status = [ 'NEW' => 'bg-primary', 'IN_PROCESSING' => 'bg-warning', 'CLOSED' => 'bg-danger', 'COMPLETED' => 'bg-success' ];
            @endphp
            @if(!empty($orders))
                @foreach($orders as $order)
                    <!-- Row that toggles the collapse -->
                    <tr data-bs-toggle="collapse" data-bs-target="#collapse-{{ $order->id }}" style="cursor: pointer;">
                        <td><a class="navi-link">{{ $order->id }}</a></td>
                        <td>{{ $order->created_at->format('d.m.Y') }}</td>
                        <td><span class="badge m-0 rounded-pill {{ $status[ $order->status ] }}">{{ $order->status }}</span></td>
                        <td><span>{{ $order->total_price . ' ' . $order->currency }}</span></td>
                    </tr>
                    <!-- Collapsible content -->
                    <tr class="collapse-row">
                        <td colspan="4" class="p-0">
                            <div id="collapse-{{ $order->id }}" class="collapse" style="border: 1px solid #dee2e6; overflow: hidden;">
                                @php
                                    $products = $order->getProducts();
                                @endphp
                                @foreach( $products as $product)
                                    <div class="row" style=" padding: 10px; ">
                                        <div class="col-lg-4">
                                            @php
                                                $images = json_decode($product->images ?? '');
                                                $image_thumbnails = json_decode($product->image_thumbnails ?? '');
                                            @endphp
                                            {!! getImage( [
                                            'image' => ( is_array( $images ) ) ? $images[0] ?? null : null,
                                            'thumbnails' => ( is_array( $image_thumbnails ) ) ? $image_thumbnails[0] ?? [] : [],
                                            'main_size' => 230,
                                            'sizes' => [ 990 => 100, 'default' => '230px'],
                                            'alt' => $product->title,
                                            'class' => 'w-100'
                                            ] ) !!}
                                        </div>
                                        <div class="col-lg-8">
                                            @if( isset( $product->category ) &&  isset( $product->slug ) )
                                                <a href="{{ Route('single-item', [ $product->category->slug, $product->slug ]) }}" target="_blank"><h5 class="mb-3" style="padding-top: 10px;"> {{ $product->title }}</h5></a>
                                            @else
                                                <h5 class="mb-3" style="padding-top: 10px;"> {{ $product->title }}</h5>
                                            @endif
                                            <div><p><b>{{ __('messages.count') }}:</b> {{ $product->cart->count }} шт.</p></div>
                                            <div>
                                                <p><b>{{ __('messages.order_product_price') }}:</b>
                                                    {{ $product->cart->price }}
                                                    @if( !empty($product->cart->currency ) )
                                                        {{ $product->cart->currency}}
                                                    @endif
                                                </p>
                                            </div>
                                            @if( !empty( $product->cart->attributes_html ) && is_array( $product->cart->attributes_html ) )
                                                @foreach($product->cart->attributes_html as $attribute)
                                                    {!! $attribute !!}
                                                @endforeach
                                            @endif
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </td>
                    </tr>
                @endforeach
            @endif
            </tbody>
        </table>
    </div>
@endsection
