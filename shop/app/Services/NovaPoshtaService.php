<?php
namespace App\Services;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\NovaPoshtaArea;
use App\Models\NovaPoshtaDistrict;
use App\Models\NovaPoshtaSettlement;
use App\Models\NovaPoshtaOffice;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class NovaPoshtaService
{
    protected $apiKey;
    protected $baseUrl;

    public function __construct()
    {
        $this->apiKey  = config('services.novaposhta.api_key');
        $this->baseUrl = config('services.novaposhta.base_url');
    }

    public function calledMethod( $method, $params = [] )
    {
        $attempts = 0;
        $maxAttempts = 3;
        $success = false;

        $response_data = [];
        while (!$success && $attempts < $maxAttempts) {
            try {
                $response = Http::withOptions(['verify' => false])
                                ->timeout(60) // Тайм-аут 60 секунд
                                ->post($this->baseUrl, [
                        'apiKey'           => $this->apiKey,
                        'modelName'        => 'AddressGeneral',
                        'calledMethod'     => $method,
                        'methodProperties' => $params
                    ]);

                $response_data = $response->json('data');
                $success = true;
            } catch (\Exception $e) {
                $attempts++;
                if ($attempts >= $maxAttempts) {
                    Log::error("Failed to fetch data for method {$method}: " . $e->getMessage());
                } else {
                    sleep(2);
                }
            }
        }

        return $response_data;
    }

    // Метод для обновления областей
    public function updateAreas()
    {
        $response = Http::post($this->baseUrl, [
            'apiKey' => $this->apiKey,
            'modelName' => 'AddressGeneral',
            'calledMethod' => 'getSettlementAreas',
            'methodProperties' => (object)[]
        ]);

        $areas = $response->json('data');
        $areas_db = [];
        foreach ($areas as $area) {
            $result = NovaPoshtaArea::updateOrCreate(
                ['area_code' => $area['Ref']],
                ['name' => $area['Description'], 'area_center' => $area['AreasCenter']]
            );
            $areas_db[$result->id] = $result->area_code;
        }
        return $areas_db;
    }

    public function updateDistricts($areas)
    {
        foreach ($areas as $id => $area_code) {
            $districts = $this->calledMethod('getSettlementCountryRegion', [ "AreaRef" => $area_code ]);
            foreach ($districts as $district) {
                NovaPoshtaDistrict::updateOrCreate(
                    ['district_code' => $district['Ref']], [
                        'name'            => $district['Description'],
                        'area_code'       => $area_code,
                        'district_center' => $district['AreasCenter']
                    ]
                );
            }
        }
    }

    public function updateSettlements( )
    {
        $areas = NovaPoshtaArea::orderBy('settlements_updated_at', 'asc')->limit(5)->get();

        foreach ( $areas as $area ) {
            $area_center = $this->calledMethod('getSettlements', [
                "Ref"   => $area->area_center,
                "Warehouse" => "1"
            ]);
            if ( ! empty($area_center)) {
                NovaPoshtaDistrict::updateOrCreate(
                    ['district_code' => $area_center[0]['Ref']], [
                        'name'            => $area_center[0]['SettlementTypeDescription'] . ' ' . $area_center[0]['Description'],
                        'area_code'       => $area_center[0]['Area'],
                        'district_center' => $area_center[0]['Ref']
                    ]
                );
                NovaPoshtaSettlement::updateOrCreate(
                    ['settlement_code' => $area_center[0]['Ref']], [
                        'name' => $area_center[0]['Description'],
                        'district_code' => $area_center[0]['Ref']
                    ]
                );
            }

            for($i = 1; ; $i++) {
                $settlements = $this->calledMethod('getSettlements', [
                    'Page'      => $i,
                    "AreaRef"   => $area->area_code,
                    "Warehouse" => "1",
                    "limit"     => 150
                ]);
                foreach ($settlements as $settlement) {
                    if (empty($settlement['Region'])) {
                        if ( ! empty($area_center) && $area_center[0]['Ref'] == $settlement['Ref']) {
                            $settlement['Region'] = $area_center[0]['Ref'];
                        } else {
                            NovaPoshtaDistrict::updateOrCreate(
                                ['district_code' => $settlement['Ref']], [
                                    'name'            => $settlement['SettlementTypeDescription'] . ' ' . $settlement['Description'],
                                    'area_code'       => $settlement['Area'],
                                    'district_center' => $settlement['Ref']
                                ]
                            );
                            $settlement['Region'] = $settlement['Ref'];
                        }
                    }
                    NovaPoshtaSettlement::updateOrCreate(
                        ['settlement_code' => $settlement['Ref']], [
                            'name' => $settlement['Description'],
                            'district_code' => $settlement['Region']
                        ]
                    );
                }
                if( count($settlements) < 150 ) {
                    NovaPoshtaArea::where('id', $area->id)->update([
                        'settlements_updated_at' => Carbon::now(),
                    ]);
                    break;
                }
            }
        }
    }

    public function updateOffices()
    {
        $cities = NovaPoshtaSettlement::orderBy('offices_updated_at', 'asc')->limit(20)->get();
        $np_types = $this->calledMethod('getWarehouseTypes', (object)[]);
        $types = [];
        foreach ($np_types as $type) {
            if( $type['Ref'] == '6f8c7162-4b72-4b0a-88e5-906948c6a92f' || $type['Ref'] == '841339c7-591a-42e2-8233-7a0a00f0ed6f' || $type['Ref'] == '9a68df70-0267-42a8-bb5c-37f427e36ee4' ){
                $name = 'Поштове відділення';
            }else{
                $name = $type['Description'];
            }
            $types[$type['Ref']] = $name;
        }

        foreach ( $cities as $city ) {
            for($i = 1; ; $i++) {

                $offices = $this->calledMethod('getWarehouses', [
                    'Page'      => $i,
                    "SettlementRef"   => $city->settlement_code,
                    "limit"     => 150
                ]);

                foreach ($offices as $office) {
                    if ( !empty( $office['TypeOfWarehouse'] ) && isset( $types[$office['TypeOfWarehouse']] ) ) {
                        $description = $types[$office['TypeOfWarehouse']] . ' №' . $office['Number'] . ' ' . $office['ShortAddress'];
                    }else{
                        $description = $office['Description'];
                    }
                    NovaPoshtaOffice::updateOrCreate(
                        ['office_code' => $office['Ref']],
                        [
                            'office_number' => $office['Number'],
                            'address' => $description,
                            'settlement_code' => $city->settlement_code

                        ]
                    );
                }
                if (count($offices) < 150) {
                    NovaPoshtaSettlement::where(
                        'id',
                        $city->id
                    )->update([
                        'offices_updated_at' => Carbon::now(),
                    ]);
                    break ;
                }
            }
        }
    }

    public function getAreas()
    {
        $data = [
        'apiKey' => $this->apiKey,
        'modelName' => 'Address',
        'calledMethod' => 'getAreas',
        'methodProperties' => (object)[]
    ];
        //$data = json_encode( $data );
        $response = Http::withHeaders([
            'Content-Type' => 'application/json',
        ])->post($this->baseUrl, $data);
        if ($response->successful()) {
            dd( $response->json()['data']);
        }

//        $data = [
//            'apiKey' => $this->apiKey,
//            'modelName' => 'AddressGeneral',
//            'calledMethod' => 'getSettlementCountryRegion',
//            'methodProperties' => (object)[
//                "AreaRef" => "dcaae3a1-4b33-11e4-ab6d-005056801329"
//            ]
//        ];
//        $response = Http::withHeaders([
//            'Content-Type' => 'application/json',
//        ])->post($this->baseUrl, $data);
//        if ($response->successful()) {
//            dd( $response->json()['data']);
//        }

        return null;
    }

    public function getSuggestionsСoincidences( string $query ){
        $settlements = $this->calledMethod('searchSettlements', [
            'CityName' => $query,
            "Limit"    => 50,
            "limit"    => 50
        ]);
        if( empty($settlements[0]['Addresses']) ){
            return [ 0 => 'Совпадений нет' ];
        }
        $input_settlement = [];
        foreach ($settlements[0]['Addresses'] as $settlement) {
            $text = $settlement['Area'] . ' обл.';
            if( !empty($settlement['Region']) ){
                $text .= ', ' . $settlement['Region'] .' район';
            }
            $input_settlement[$settlement['Ref']] = $settlement['SettlementTypeCode'] . ' ' . $settlement['MainDescription'] . ' ( ' . $text . ' )';
        }
        return $input_settlement;
    }

    public function getOfficesСoincidences( string $query )
    {
        $offices = NovaPoshtaOffice::select('id', 'office_number', 'address')->where('settlement_code', $query)->get();
        $response = [];
        foreach ($offices as $office) {
            $response[$office->id] = $office->address;
        }
        return $response;
    }
}
