<?php

namespace App\Http\Controllers;
use App\Services\NovaPoshtaService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class NovaPoshtaController extends Controller
{
    protected $novaPoshtaService;

    public function __construct(NovaPoshtaService $novaPoshtaService)
    {
        $this->novaPoshtaService = $novaPoshtaService;
    }

    public function updateData( Request $request)
    {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string|in:areas,districts,settlements,offices',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()->first()], 400);
        }

        $type = $request->input('type');

        if($type === 'areas'){
            $areas = $this->novaPoshtaService->updateAreas();
        }elseif ($type === 'districts'){
            $areas = $this->novaPoshtaService->updateAreas();
            $this->novaPoshtaService->updateDistricts( $areas );
        }elseif ($type === 'settlements'){
            $this->novaPoshtaService->updateSettlements();
        }elseif ($type === 'offices'){
            $this->novaPoshtaService->updateOffices();
        }

        return __('messages.data_updated');
    }

    public function index()
    {
        $areas = $this->novaPoshtaService->getAreas();

        return response()->json($areas);
    }

    public function getData( Request $request ){
        $validated = $request->validate([
            'query' => 'required|string|min:2|max:255',
            'type' => 'required|string|min:2|max:255',
        ]);

        if ($validated['type'] == 'suggestions') {
            $coincidences = $this->novaPoshtaService->getSuggestionsСoincidences(
                $validated['query']
            );
        } elseif ($validated['type'] == 'offices') {
            $coincidences = $this->novaPoshtaService->getOfficesСoincidences(
                $validated['query']
            );
        }else{
            $coincidences = [];
        }


        return response()->json( $coincidences );
    }
}
