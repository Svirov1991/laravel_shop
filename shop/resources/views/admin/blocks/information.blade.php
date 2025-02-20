<div  style="padding: 20px; border: 1px solid black;margin: 10px 0">
    <div class="row">
        <div class="col-md-4 mb-3">
            <div class="form-group">
                <label for="delivery-title-{{ $id }}" class="form-label">Delivery title</label>
                <input type="text" class="form-control" id="delivery-title-{{ $id }}" data-name="delivery-title" value="{{ $attributes['fields']['delivery-title'] ?? '' }}">
            </div>
            <div class="form-group">
                <label for="delivery-subtitle-{{ $id }}" class="form-label">Delivery subtitle</label>
                <input type="text" class="form-control" id="delivery-subtitle-{{ $id }}" data-name="delivery-subtitle" value="{{ $attributes['fields']['delivery-subtitle'] ?? '' }}">
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="form-group">
                <label for="support-title-{{ $id }}" class="form-label">Support title</label>
                <input type="text" class="form-control" id="support-title-{{ $id }}" data-name="support-title" value="{{ $attributes['fields']['support-title'] ?? '' }}">
            </div>
            <div class="form-group">
                <label for="support-subtitle-{{ $id }}" class="form-label">Support subtitle</label>
                <input type="text" class="form-control" id="support-subtitle-{{ $id }}" data-name="support-subtitle" value="{{ $attributes['fields']['support-subtitle'] ?? '' }}">
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="form-group">
                <label for="payment-title-{{ $id }}" class="form-label">Payment title</label>
                <input type="text" class="form-control" id="payment-title-{{ $id }}" data-name="payment-title" value="{{ $attributes['fields']['payment-title'] ?? '' }}">
            </div>
            <div class="form-group">
                <label for="payment-subtitle-{{ $id }}" class="form-label">Payment subtitle</label>
                <input type="text" class="form-control" id="payment-subtitle-{{ $id }}" data-name="payment-subtitle" value="{{ $attributes['fields']['payment-subtitle'] ?? '' }}">
            </div>
        </div>
    </div>
</div>
