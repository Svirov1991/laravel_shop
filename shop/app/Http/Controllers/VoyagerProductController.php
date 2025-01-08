<?php

namespace App\Http\Controllers;

use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;
use App\Models\Attribute;
use App\Models\Product;
use TCG\Voyager\Models\DataType;
use Illuminate\Http\Request;
class VoyagerProductController extends VoyagerBaseController
{
    public function store(Request $request)
    {
        return $this->store($request);
    }
    public function edit(Request $request, $id)
    {
        $dataType = DataType::where('slug', 'products')->first();

        $dataTypeContent = Product::with('attributeValues.attribute')->findOrFail($id);
        $productAttributes = $dataTypeContent->attributeValues
            ->groupBy('attribute_id')
            ->map(function ($values, $attributeId) {
                $attribute = $values->first()->attribute;  // Получаем атрибут

                return [
                    'attribute_id' => $attribute->id,
                    'attribute_name' => $attribute->name,
                    'selected_values' => $values->pluck('value', 'id')->toArray(),
                    'all_values' => $attribute->values->pluck('value', 'id')->toArray(),
                ];
            });
        $attributes = Attribute::with('values')->get()->keyBy('id');

        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        return Voyager::view('voyager::products.edit-add', compact(
            'dataType',
            'dataTypeContent',
            'productAttributes',
            'attributes',
            'isModelTranslatable'
        ));
    }

    public function create(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        $dataTypeContent = (strlen($dataType->model_name) != 0)
            ? new $dataType->model_name()
            : false;

        foreach ($dataType->addRows as $key => $row) {
            $dataType->addRows[$key]['col_width'] = $row->details->width ?? 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'add');

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'add', $isModelTranslatable);
        $attributes = Attribute::with('values')->get()->keyBy('id');
        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'attributes'));
    }

}
