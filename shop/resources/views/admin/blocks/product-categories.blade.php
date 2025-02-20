<div style="padding: 20px; border: 1px solid black;margin: 10px 0">
    <div class="row">
        <div class="col-md-12 mb-3">
            @php
                $selected_categories = $attributes['fields']['categories'] ?? [];
            @endphp
            <label for="categories-{{ $id }}" class="form-label">Product categories</label>
            <select id="categories-{{ $id }}" class="form-control select2" data-name="categories" multiple>
                @foreach($categories as $cat)
                    <option value="{{ $cat->id }}"
                            @if( in_array( $cat->id, $selected_categories ) ) selected @endif >{{ $cat->title }}</option>
                @endforeach
            </select>
        </div>
    </div>
</div>
