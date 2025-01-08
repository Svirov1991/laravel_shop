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
        Schema::table('main_banners', function (Blueprint $table) {
            $table->string('button_link', 255)->nullable()->after('description');
            $table->string('button_text', 255)->nullable()->after('button_link');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('main_banners', function (Blueprint $table) {
            $table->dropColumn('button_link');
            $table->dropColumn('button_text');
        });
    }
};
