<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('nova_poshta_areas', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->string('area_code')->nullable()->unique();
            $table->string('area_center')->nullable();
            $table->string('settlements_updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nova_poshta_areas');
    }
};
