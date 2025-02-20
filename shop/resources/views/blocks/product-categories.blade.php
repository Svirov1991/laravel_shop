<section>
    <div class="container pt-0 pb-0">
        <div class="row">
            @foreach( $categories as $category)
                <div class="col-sm-6">
                    <div class="single-banner-image" style="position: relative;">
                        <a href="{{ Route('handle-slug', [ $category->slug ] ) }}">
                            <img class="w-100" src="/storage/{{ $category->image }}" alt="{{ $category->title }}">
                            <div class="single-banner-image-info"><p>{{ $category->title }}</p></div>
                        </a>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
