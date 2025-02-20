<div  style="padding: 20px; border: 1px solid black;margin: 10px 0">
    <div class="row">
        <div class="col-md-12 mb-3">
            <h3>This block displays the latest news</h3>
            <div class="form-group">
                <label for="block-title-{{ $id }}" class="form-label">Title</label>
                <input type="text" class="form-control" id="block-title-{{ $id }}" data-name="block-title" value="{{ $attributes['fields']['block-title'] ?? '' }}" >
            </div>
        </div>
    </div>
</div>
