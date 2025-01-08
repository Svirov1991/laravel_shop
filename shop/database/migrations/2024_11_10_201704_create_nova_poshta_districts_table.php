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
        Schema::create('nova_poshta_districts', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('district_code')->nullable()->unique();
            $table->string('district_center')->nullable();
            $table->string('area_code');
            $table->foreign('area_code')->references('area_code')->on('nova_poshta_areas')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nova_poshta_districts');
    }
};
