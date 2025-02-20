<div class="row form-group">
        <div class="col-md-4">
            <div class="file-block" >
                <div class="uploaded_images" style="margin-bottom: 10px">
                    @if( !empty( $item['file'] ))
                        <img src="{{ asset( 'storage/' . $item['file']) }}"
                             style="max-width: 100%; max-height: 100%;">
                    @endif
                </div>
                <input type="hidden" class="file-input" data-item-name="file" value="{{ $item['file'] ?? '' }}">
                <input class="form-control-file" type="file" onchange="loadFile(this);">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label>Slide title</label>
                <input type="text" class="form-control" data-item-name="slide-title" placeholder="Slide title"
                       value="{{ $item['slide-title'] ?? '' }}">
            </div>
            <div class="form-group">
                <label>Slide subtitle</label>
                <input type="text" class="form-control" data-item-name="slide-subtitle" placeholder="Slide subtitle"
                       value="{{ $item['slide-subtitle'] ?? '' }}">
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Link</label>
                        <input type="text" class="form-control" data-item-name="link" placeholder="Link"
                               value="{{ $item['link'] ?? '' }}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Link text</label>
                        <input type="text" class="form-control" data-item-name="link-text" placeholder="Link text"
                               value="{{ $item['link-text'] ?? '' }}">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label>Slide description</label>
                <textarea data-item-name="slide-description" rows="9" class="form-control"
                          placeholder="Slide description">{{ $item['slide-description'] ?? '' }}</textarea>
            </div>
        </div>
    <div class="col-md-12">
        <button type="button" class="btn btn-danger" onclick="this.closest('.row-item').remove(); document.querySelector( '#block-{{ $id }} .repeatable-block .fields' ).dispatchEvent( new Event( 'input', {bubbles: true} ) );" >Delete</button>
    </div>
</div>
