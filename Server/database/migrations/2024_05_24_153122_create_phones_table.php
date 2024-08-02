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
        Schema::create('Phones', function (Blueprint $table) {
            $table->id();
            $table->string('name', 100);
            $table->string('color', 30);
            $table->string('rom', 30);
            $table->text('image');
            $table->bigInteger('price');
            $table->integer('stock');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('Phones');
    }
};