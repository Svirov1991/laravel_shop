<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('pages', function (Blueprint $table) {
            $table->dropColumn(['meta_description', 'meta_keywords']);
        });

        Schema::table('posts', function (Blueprint $table) {
            $table->dropColumn(['seo_title', 'meta_description', 'meta_keywords']);
        });
    }

    public function down(): void
    {
        Schema::table('pages', function (Blueprint $table) {
            $table->text('meta_description')->nullable();
            $table->text('meta_keywords')->nullable();
        });

        Schema::table('posts', function (Blueprint $table) {
            $table->string('seo_title')->nullable();
            $table->text('meta_description')->nullable();
            $table->text('meta_keywords')->nullable();
        });
    }
};

