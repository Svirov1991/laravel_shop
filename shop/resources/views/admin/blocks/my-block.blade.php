<div  style="padding: 20px; border: 1px solid black;margin: 10px 0">
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="block-title-{{ $id }}" class="form-label">Title</label>
            <input type="text" class="form-control" id="block-title-{{ $id }}" data-name="block-title" value="{{ $attributes['fields']['block-title'] ?? '' }}">
        </div>
        <div class="col-md-6 mb-3">
            <label for="subtitle-{{ $id }}" class="form-label">Subtitle</label>
            <input type="text" class="form-control" id="subtitle-{{ $id }}" data-name="subtitle" value="{{ $attributes['fields']['subtitle'] ?? '' }}">
        </div>
        <div class="col-md-12 mb-3">
            <label for="description-{{ $id }}" class="form-label">Description</label>
            <input type="text" id="description-{{ $id }}" class="form-control mce-editor" data-name="description" value="{{ $attributes['fields']['description'] ?? '' }}" >
        </div>
        <div class="col-md-12 mb-3">
            <label for="categories-{{ $id }}" class="form-label">Product categories</label>
            @php
                $selected_categories = $attributes['fields']['categories'] ?? [];
            @endphp
            <select id="categories-{{ $id }}" class="form-control select2" data-name="categories" multiple >
                <option value="1" @if( in_array( 1, $selected_categories ) ) selected @endif >Category 1</option>
                <option value="2" @if( in_array( 2, $selected_categories ) ) selected @endif >Category 2</option>
                <option value="3" @if( in_array( 3, $selected_categories ) ) selected @endif >Category 3</option>
            </select>
        </div>

        <div class="col-md-12 mb-3">
            @php
                $repeater_template = 'admin.blocks.repeater.my-block-repeater';
                $repeater_html = view($repeater_template, ['id' => $id])->render();
            @endphp
            <div class="repeatable-block" style="border: 1px solid #d7d7d7; padding: 10px;" data-row='@json($repeater_html)'> <!-- class 'repeatable-block' for repeater initialization, data-row="html" html for one row -->
                <input class="repeater-values" type="hidden" data-name="list" value="{{ $attributes['fields']['list'] ?? '' }}" > <!-- class 'repeater-values' for a input for saving data from the repeater into it -->
                <div class="fields"> <!-- class 'fields' for rows -->
                    @if( !empty($attributes['fields']['list']) )
                        @php $list = json_decode($attributes['fields']['list'], true); @endphp
                        @foreach($list as $item)
                            <div class="row-item"> <!-- class 'row-item' -->
                                @include($repeater_template, [ 'item' => $item, 'id' => $id ]);
                            </div>
                        @endforeach
                    @endif
                </div>
                <button type="button" class="btn btn-primary add-row-button">Add row</button><!-- class 'add-row-button' to create a new row -->
            </div>
        </div>
    </div>
</div>
