<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

use Illuminate\Support\Facades\Artisan;

require '../vendor/autoload.php';
$app = require_once '../bootstrap/app.php';

$app->make('Illuminate\Contracts\Http\Kernel')->bootstrap();

Artisan::call('storage:link');

echo "Симлинк успешно создан!";