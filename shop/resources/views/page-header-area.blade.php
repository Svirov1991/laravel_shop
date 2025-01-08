<!--== Start Page Header Area Wrapper ==-->
<div class="page-header-area">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <div class="page-header-content">
                    <nav class="breadcrumb-area">
                        <ul class="breadcrumb">
                            @foreach($breadcrumbs as $breadcrumb)
                                @if(!$loop->last)
                                    <li>
                                        <a href="{{ $breadcrumb['url'] }}">{{ $breadcrumb['name'] }}</a>
                                    </li>
                                    <li class="breadcrumb-sep">/</li>
                                @else
                                    @php $title = $breadcrumb['name']; @endphp
                                    <li>{{ $breadcrumb['name'] }}</li>
                                @endif
                            @endforeach
                        </ul>
                    </nav>
                    <h4 class="title">{{ $title }}</h4>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "BreadcrumbList",
        "itemListElement": [
    @foreach($breadcrumbs as $index => $breadcrumb)
        {
            "@type": "ListItem",
            "position": {{ $index + 1 }},
            "name": "{{ $breadcrumb['name'] }}",
            "item": "{{ $breadcrumb['url'] ?? '' }}"
        }@if(!$loop->last),@endif
    @endforeach
    ]
}
</script>
<!--== End Page Header Area Wrapper ==-->
