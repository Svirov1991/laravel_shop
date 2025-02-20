<div  style="padding: 20px; border: 1px solid black;margin: 10px 0">
    <div class="row">
        <div class="col-md-12 mb-3">
            @php
                $repeater_template = 'admin.blocks.repeater.main-slider-repeater';
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
                <button type="button" class="btn btn-primary add-row-button">Add row</button><!-- class 'add-row-button' to create a new "row-item" -->
            </div>
        </div>
    </div>
</div>
