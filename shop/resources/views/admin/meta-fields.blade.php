<div class="panel panel-bordered panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="icon wb-search"></i>SEO General</h3>
        <div class="panel-actions">
            <a class="panel-action voyager-angle-down" data-toggle="collapse" href="#seo-area" aria-controls="seo-area"
               aria-hidden="true"></a>
        </div>
    </div>
    <div class="panel-body collapse in" id="seo-area">
        <div class="form-group">
            <label for="meta_title">Заголовок</label>
            <input type="text" class="form-control" name="meta_title" placeholder=""
                   value="{{ $dataTypeContent->metaTags->meta_title ?? '' }}">
        </div>
        <div class="form-group">
            <label for="meta_description">Описание</label>
            <textarea class="form-control"
                      name="meta_description">{{ $dataTypeContent->metaTags->meta_description ?? '' }}</textarea>
        </div>
        <div class="form-group">
            <label for="meta_keywords">Ключевые слова</label>
            <textarea class="form-control"
                      name="meta_keywords">{{ $dataTypeContent->metaTags->meta_keywords ?? '' }}</textarea>
        </div>
        <div class="form-group">
            <label for="canonical">Canonical</label>
            <input type="text" class="form-control" name="canonical" placeholder=""
                   value="{{ $dataTypeContent->metaTags->canonical ?? '' }}">
        </div>
        <div class="form-group">
            <label for="robots">Robots</label>
            <select class="form-control" value="{{ $dataTypeContent->metaTags->robots ?? '' }}" name="robots">
                <option value="index, follow"
                        @if( !empty( $dataTypeContent->metaTags->robots ) && $dataTypeContent->metaTags->robots == 'index, follow') selected @endif >
                    index, follow
                </option>
                <option value="noindex, nofollow"
                        @if( !empty( $dataTypeContent->metaTags->robots ) && $dataTypeContent->metaTags->robots == 'noindex, nofollow') selected @endif >
                    noindex, nofollow
                </option>
            </select>
        </div>
    </div>


    <div class="panel-heading">
        <h3 class="panel-title"><i class="icon wb-search"></i> SEO Open Graph</h3>
        <div class="panel-actions">
            <a class="panel-action voyager-angle-down" data-toggle="collapse" href="#open-graph-area"
               aria-controls="open-graph-area" aria-hidden="true"></a>
        </div>
    </div>
    <div class="panel-body collapse" id="open-graph-area">
        <div class="form-group">
            <label for="og_title">OG Заголовок</label>
            <input type="text" class="form-control" name="og_title" placeholder=""
                   value="{{ $dataTypeContent->metaTags->og_title ?? '' }}">
        </div>
        <div class="form-group">
            <label for="og_description">Описание</label>
            <textarea class="form-control"
                      name="og_description">{{ $dataTypeContent->metaTags->og_description ?? '' }}</textarea>
        </div>
        <div class="form-group">
            <label for="og_image">og_image</label>
            @if( !empty( $dataTypeContent->metaTags->og_image ) )
                <div class="mt-2">
                    <img src="{{ Voyager::image($dataTypeContent->metaTags->og_image) }}" alt="OG Image"
                         style="max-width: 100%">
                    <button type="button" class="btn btn-danger btn-sm remove-image" data-field="og_image">Удалить
                    </button>
                    <input type="hidden" name="remove_og_image" value="0">
                </div>
            @endif
            <input type="file" class="form-control" name="og_image">
        </div>
        <div class="form-group">
            <label for="og_url">og_url</label>
            <input type="text" class="form-control" name="og_url" placeholder=""
                   value="{{ $dataTypeContent->metaTags->og_url ?? '' }}">
        </div>
        <div class="form-group">
            <label for="og_type">og_type</label>
            <select class="form-control" value="{{ $dataTypeContent->metaTags->og_type ?? '' }}" name="og_type">
                <option value="default"
                        @if( !empty( $dataTypeContent->metaTags->og_type ) && $dataTypeContent->metaTags->og_type == 'auto') selected @endif >
                    Default
                </option>
                <option value="article"
                        @if( !empty( $dataTypeContent->metaTags->og_type ) && $dataTypeContent->metaTags->og_type == 'article') selected @endif >
                    article
                </option>
                <option value="website"
                        @if( !empty( $dataTypeContent->metaTags->og_type ) && $dataTypeContent->metaTags->og_type == 'website') selected @endif >
                    website
                </option>
                <option value="product"
                        @if( !empty( $dataTypeContent->metaTags->og_type ) && $dataTypeContent->metaTags->og_type == 'product') selected @endif >
                    product
                </option>
            </select>
        </div>
    </div>


    <div class="panel-heading">
        <h3 class="panel-title"><i class="icon wb-search"></i> SEO Twitter</h3>
        <div class="panel-actions">
            <a class="panel-action voyager-angle-down" data-toggle="collapse" href="#twitter-area"
               aria-controls="twitter-area" aria-hidden="true"></a>
        </div>
    </div>
    <div class="panel-body collapse" id="twitter-area">
        <div class="form-group">
            <label for="twitter_title">Twitter title</label>
            <input type="text" class="form-control" name="twitter_title" placeholder=""
                   value="{{ $dataTypeContent->metaTags->twitter_title ?? '' }}">
        </div>
        <div class="form-group">
            <label for="twitter_description">Twitter description</label>
            <textarea class="form-control"
                      name="twitter_description">{{ $dataTypeContent->metaTags->twitter_description ?? '' }}</textarea>
        </div>
        <div class="form-group">
            <label for="twitter_image">twitter_image</label>
            @if( !empty( $dataTypeContent->metaTags->twitter_image ) )
                <div class="mt-2">
                    <img src="{{ Voyager::image($dataTypeContent->metaTags->twitter_image) }}" alt="Twitter Image"
                         style="max-width: 100%">
                    <button type="button" class="btn btn-danger btn-sm remove-image" data-field="twitter_image">
                        Удалить
                    </button>
                    <input type="hidden" name="remove_twitter_image" value="0">
                </div>
            @endif
            <input type="file" class="form-control" name="twitter_image">
        </div>
        <div class="form-group">
            <label for="twitter_card">twitter_card</label>
            <select class="form-control" value="{{ $dataTypeContent->metaTags->twitter_card ?? '' }}"
                    name="twitter_card">
                <option value="summary_large_image"
                        @if( !empty( $dataTypeContent->metaTags->twitter_card ) && $dataTypeContent->metaTags->twitter_card == 'summary_large_image') selected @endif >
                    summary_large_image
                </option>
                <option value="summary"
                        @if( !empty( $dataTypeContent->metaTags->twitter_card )  && $dataTypeContent->metaTags->twitter_card == 'summary') selected @endif >
                    summary
                </option>
            </select>
        </div>
    </div>

</div>
<script>
    document.querySelectorAll( '.remove-image' ).forEach( button => {
        button.addEventListener( 'click', function () {
            const field = this.dataset.field;
            document.querySelector( `input[name="remove_${field}"]` ).value = "1";
            this.closest( '.mt-2' ).style.display = "none"; // Скрываем поле
        } );
    } );
</script>
