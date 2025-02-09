<!-- inputs must not have a "name" attribute -->
<!-- inputs must have a "data-name" attribute ( it will be the key in json ) -->
<div class="row" >
    <div class="col-md-4">
        <div class="file-block" style="display:flex;">
            <div class="uploaded_images">
                @if( !empty( $item['file'] ))
                    <img src="{{ asset( 'storage/' . $item['file']) }}" style="max-width: 100px; max-height: 100px;">
                @endif
            </div>
            <input type="hidden" class="file-input" data-name="file" value="{{ $item['file'] ?? '' }}">
            <input class="form-control-file" type="file" onchange="loadFile(this);">
        </div>
    </div>
    <div class="col-md-4">
        <label>Item title</label>
        <input type="text" class="form-control" data-name="item-title" placeholder="Item title" value="{{ $item['item-title'] ?? '' }}" >
    </div>
    <div class="col-md-4">
        <label>Item text</label>
        <input type="text" class="form-control" data-name="item-text" placeholder="Item text" value="{{ $item['item-text'] ?? '' }}" >
    </div>
    <div class="col-md-12">
        <button type="button" class="btn btn-danger" onclick="this.closest('.row').remove(); document.querySelector( '#block-{{ $id }} .repeatable-block .fields' ).dispatchEvent( new Event( 'input', {bubbles: true} ) );" >Delete</button>
    </div>
</div>
