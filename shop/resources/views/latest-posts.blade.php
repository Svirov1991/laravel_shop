<div class="widget-item">
    <div class="widget-title">
        <h3 class="title">{{ __('messages.latest_posts') }}</h3>
    </div>
    <div class="widget-body">
        @foreach($latest_posts as $post)
            <div class="widget-blog-post">
                <ul>
                    <li>
                        <div class="thumb">
                            <a href="{{ route('single-item', [ $post->category->slug, $post->slug ]) }}"><img src="/storage/{{ $post->image }}" alt="{{ $post->title }}"></a>
                        </div>
                        <div class="content">
                            <span>{{ $post->created_at->format('d.m.Y') }}</span>
                            <h4><a href="{{ route('single-item', [ $post->category->slug, $post->slug ]) }}">{{ $post->title }}</a></h4>
                        </div>
                    </li>
                </ul>
            </div>
        @endforeach
    </div>
</div>
