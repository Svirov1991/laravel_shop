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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->json('cart')->nullable('false');
            $table->unsignedInteger('total_price')->nullable('false');
            $table->string('first_name', 255)->nullable();
            $table->string('last_name', 255)->nullable();
            $table->string('phone', 255)->nullable(false);
            $table->string('email', 255)->nullable();
            $table->string('settlement_code', 255)->nullable();
            $table->string('settlement', 255)->nullable();
            $table->string('office_code', 255)->nullable();
            $table->string('office', 255)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
