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
        Schema::create('nova_poshta_offices', function (Blueprint $table) {
            $table->id();
            $table->string('office_number');
            $table->string('address');
            $table->string('office_code')->nullable()->unique();
            $table->string('settlement_code');
            $table->foreign('settlement_code')->references('settlement_code')->on('nova_poshta_settlements')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nova_poshta_offices');
    }
};
