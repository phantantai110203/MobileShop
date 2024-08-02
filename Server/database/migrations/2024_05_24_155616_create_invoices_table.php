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
        Schema::create('Invoices', function (Blueprint $table) {
            $table->id();
            $table->string('code', 60)->unique();
            $table->dateTime('issuedDate');
            $table->string('shippingAddress', 50)->nullable();
            $table->string('shippingPhone', 50)->nullable();
            $table->bigInteger('total');
            $table->string('status',30);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('Invoices');
    }
};