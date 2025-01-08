<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class LanguageController extends Controller
{
    public function switch($lang){
        if ( in_array( $lang, ['uk','en', 'ru'] ) ) {
            App::setLocale($lang);
            session()->put('locale', $lang);
        }
        return redirect()->back();
    }
}
