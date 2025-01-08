<div class="pagination-content-wrap border-top">
    <nav class="pagination-nav">
        <ul class="pagination justify-content-center">
            @if( ! $paginator->onFirstPage() )
                <li><a class="prev" href="{{ $paginator->url($paginator->currentPage() - 1) }}">Prev</a></li>
            @endif
            @for($i=1; $i < $paginator->lastPage() + 1; $i++)
                <li><a @if( $i == $paginator->currentPage()) class="disabled active"
                       @endif href="{{ $paginator->url($i) }}">{{ $i }}</a></li>
            @endfor
            @if( $paginator->currentPage() < $paginator->lastPage() )
                <li><a class="next" href="{{ $paginator->url($paginator->currentPage() + 1) }}">Next</a></li>
            @endif
        </ul>
    </nav>
</div>
