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
        //
        Schema::table('phones', function (Blueprint $table) {
            $table->unsignedBigInteger('phonemod_id');
            $table->foreign('phonemod_id')->references('id')->on('phonemods');
        });
        Schema::table('phonemods', function (Blueprint $table) {
            $table->unsignedBigInteger('brand_id');
            $table->foreign('brand_id')->references('id')->on('brands');
        });
        Schema::table('carts', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');

            $table->unsignedBigInteger('phone_id');
            $table->foreign('phone_id')->references('id')->on('phones');
        });
        Schema::table('favorites', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');

            $table->unsignedBigInteger('phonemod_id');
            $table->foreign('phonemod_id')->references('id')->on('phonemods');
        });
        Schema::table('reviews', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');

            $table->unsignedBigInteger('phonemod_id');
            $table->foreign('phonemod_id')->references('id')->on('phonemods');
        });
        Schema::table('comments', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');

            $table->unsignedBigInteger('phonemod_id');
            $table->foreign('phonemod_id')->references('id')->on('phonemods');


            $table->unsignedBigInteger('parentcomment_id');
            $table->foreign('parentcomment_id')->references('id')->on('comments');
        });
        Schema::table('phonemodimages', function (Blueprint $table) {
            $table->unsignedBigInteger('phonemod_id');
            $table->foreign('phonemod_id')->references('id')->on('phonemods');
        });
        Schema::table('slideshows', function (Blueprint $table) {
            $table->unsignedBigInteger('phonemod_id');
            $table->foreign('phonemod_id')->references('id')->on('phonemods');
        });
        Schema::table('invoices', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');

            $table->unsignedBigInteger('PaymentMethod_id');
            $table->foreign('PaymentMethod_id')->references('id')->on('paymentmethods');

            $table->unsignedBigInteger('Discount_id');
            $table->foreign('Discount_id')->references('id')->on('discounts');
        });
        Schema::table('invoicedetails', function (Blueprint $table) {
            $table->unsignedBigInteger('invoice_id');
            $table->foreign('invoice_id')->references('id')->on('invoices');

            $table->unsignedBigInteger('phone_id');
            $table->foreign('phone_id')->references('id')->on('phones');
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};