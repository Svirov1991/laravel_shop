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
        Schema::create('nova_poshta_settlements', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('settlement_code')->nullable()->unique();
            $table->string('district_code')->nullable();
            $table->foreign('district_code')->references('district_code')->on('nova_poshta_districts')->onDelete('cascade');
            $table->timestamp('offices_updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nova_poshta_settlements');
    }
};
