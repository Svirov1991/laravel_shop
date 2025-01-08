<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class AddHomePageSettingToSettingsTable extends Migration
{
    public function up()
    {
        DB::table('settings')->insert([
            'key' => 'site.home_page',
            'display_name' => 'Главная страница',
            'value' => null,
            'details' => json_encode([
                'default' => null,
                'options' => [],
            ]),
            'type' => 'select_dropdown',
            'order' => 1,
            'group' => 'Site',
        ]);
    }

    public function down()
    {
        DB::table('settings')->where('key', 'site.home_page')->delete();
    }
}
