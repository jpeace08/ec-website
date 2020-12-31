<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableOrderDetail extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_detail', function (Blueprint $table) {
            $table->integer('quantity');
            $table->softDeletes();
            $table->foreignId('products_id')->constrained('products');
            $table->foreignId('orders_id')->constrained('orders');  
            $table->timestamps();
            $table->primary('products_id', 'orders_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('table_order_detail');
    }
}
