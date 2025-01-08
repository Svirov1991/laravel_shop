<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('title', 255)->nullable(false);
            $table->string('slug', 255)->nullable(false);
            $table->text('description')->nullable();
            $table->json('images')->nullable();
            $table->string('article', 50)->nullable()->unique();
            $table->unsignedInteger('price')->nullable(false);
            $table->unsignedInteger('discount_price')->nullable();
            $table->float('rating', 3)->nullable();
            $table->unsignedInteger('number_of_ratings')->nullable();
            $table->foreignId('product_category_id')->nullable()->constrained('product_categories')->onDelete('set null');
            $table->enum('status', ['PUBLISHED', 'NOT_AVAILABLE', 'DRAFT'])->default('DRAFT');
            $table->boolean('featured')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
