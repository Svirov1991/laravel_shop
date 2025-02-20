<p>Title: {{ $attributes['fields']['block-title'] }}</p>
<i>Subtitle: {{ $attributes['fields']['subtitle'] }}</i>
<p>Description: </p>
{!! $attributes['fields']['description'] !!}
@php
    $categories = $attributes['fields']['categories'] ?? [];
@endphp
<p>Categories: @php echo implode( ',', $categories ); @endphp</p>
@if( !empty($attributes['fields']['list']))
    @php $list = json_decode($attributes['fields']['list'], true) @endphp
    @foreach($list as $item)
        @if( !empty($item['file']))
            <img src="{{ asset( 'storage/' . $item['file'] ) }}">
        @endif
        <p>{{ $item['item-title'] ?? '' }}</p>
        <p>{{ $item['item-text'] ?? '' }}</p>
    @endforeach
@endif
