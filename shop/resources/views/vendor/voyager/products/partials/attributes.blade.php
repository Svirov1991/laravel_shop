<div class="panel panel-bordered" id="attributes-container">
    <div class="panel-heading">
        <h3 class="panel-title">Атрибуты товара</h3>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <button type="button" class="btn btn-primary" onclick="addAttribute()">Добавить атрибут</button>
        </div>
        <div id="attributes-list">
            @if( isset( $productAttributes ) )
                @foreach($productAttributes as $kay => $attributeValue)
                    <div class="row align-items-center attribute_block">
                        <div class="form-group col-md-5 ">
                            <select class="form-control attribute select2" onchange="changeAttribute(this, {{ $kay  }})">
                                @foreach($attributes as $attribute)
                                    <option value="{{ $attribute->id }}" @if($attributeValue[ 'attribute_id' ] == $attribute->id) selected @elseif( isset($productAttributes[$attribute->id]))  disabled @endif>{{ $attribute->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-md-6 variants">
                            <select name="attributes[]" class="form-control select2" multiple>
                                @foreach($attributeValue['all_values'] as $value_id => $attribute_values)
                                        <option value="{{ $value_id }}" @if(in_array($attribute_values, $attributeValue['selected_values'])) selected @endif>{{ $attribute_values }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-md-1">
                            <button type="button" class="btn btn-danger" onclick="$(this).parents('.attribute_block').remove(); updateSelectOptions();">Удалить</button>
                        </div>
                    </div>
                @endforeach
            @endif
        </div>
    </div>
</div>

<script>

    var attributes = @json($attributes);
    let attributeIndex = Date.now();

    function updateSelectOptions() {
        $('#attributes-list').find('select.attribute option').prop('disabled', false);

        const selectedValues =  $('#attributes-list').find('select.attribute option:selected')
            .map(function() {
                return $(this).val();
            }).get();

        $('#attributes-list').find('select.attribute').each(function() {
            const select = $(this);
            select.find('option').each(function() {
                if (selectedValues.includes($(this).val())) {
                    $(this).prop('disabled', true);
                }
            });

            select.find('option:selected').prop('disabled', false);
        });
    }

    function addAttribute() {
        let index = attributeIndex++;
        let html = `<div class="row align-items-center attribute_block">
                        <div class="form-group col-md-5 ">
                            <select class="form-control attribute select2" onchange="changeAttribute(this, ` + index + `)">
                                <option value="" selected hidden>Select attribute</option>`;
        $.each( attributes, function ( key, value ) {
            html += `<option value="` + key + `" >` + value.name + `</option>`;
        } );
        html += `
                            </select>
                        </div>
                        <div class="form-group  col-md-6 variants">
        `;

        html += `
                        </div>
                        <div class="form-group col-md-1">
                            <button type="button" class="btn btn-danger" onclick="$(this).parents('.attribute_block').remove(); updateSelectOptions();">Удалить</button>
                        </div>
                    </div>
        `;
        $( "#attributes-list" ).append( html );
        updateSelectOptions();
        $( "#attributes-list" ).find('select.attribute').last().select2();

    }

    function changeAttribute( el, index ) {
        let val = $( el ).val();
        let html = `<select name="attributes[]" class="form-control select2" multiple>`;
        $.each( attributes[val].values, function ( key, value ) {
            html += `<option value="` + value.id + `" >` + value.value + `</option>`;
        } )
        html += `</select>`;

        $( el ).parents( '.attribute_block' ).find( '.variants' ).html( html );
        $( el ).parents( '.attribute_block' ).find( '.variants select' ).select2();
        updateSelectOptions();

    }
</script>
