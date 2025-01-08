@if( !empty($metaTags['title']))
    <title>{{ $metaTags['title'] }}</title>
@endif
@if( !empty($metaTags['description']))
    <meta name="description" content="{{ $metaTags['description'] }}">
@endif
@if( !empty($metaTags['keywords']))
    <meta name="keywords" content="{{ $metaTags['keywords'] }}">
@endif

<!-- Open Graph -->
@if( !empty($metaTags['og_title']))
    <meta property="og:title" content="{{ $metaTags['og_title'] }}">
@endif
@if( !empty($metaTags['og_description']))
    <meta property="og:description" content="{{ $metaTags['og_description'] }}">
@endif
@if( !empty($metaTags['og_image']))
    <meta property="og:image" content="{{ $metaTags['og_image'] }}">
@endif
@if( !empty($metaTags['og_url']))
    <meta property="og:url" content="{{ $metaTags['og_url'] }}">
@endif
@if( !empty($metaTags['og_type']))
    <meta property="og:type" content="{{ $metaTags['og_type'] }}">
@endif

<!-- Twitter Cards -->
@if( !empty($metaTags['twitter_title']))
    <meta property="twitter:title" content="{{ $metaTags['twitter_title'] }}">
@endif
@if( !empty($metaTags['twitter_description']))
    <meta property="twitter:description" content="{{ $metaTags['twitter_description'] }}">
@endif
@if( !empty($metaTags['twitter_image']))
    <meta property="twitter:image" content="{{ $metaTags['twitter_image'] }}">
@endif
@if( !empty($metaTags['twitter_card']))
    <meta property="twitter:card" content="{{ $metaTags['twitter_card'] }}">
@endif

@if( !empty($metaTags['canonical']))
    <link rel="canonical" href="{{ $metaTags['canonical'] }}">
@endif

@if( !empty($metaTags['robots']))
    <meta name="robots" content="{{ $metaTags['robots'] }}">
@endif

<script type="application/ld+json">
    {!! $metaTags['structured_data'] ?? '{}' !!}
</script>
