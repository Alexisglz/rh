<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CatalogoCoordinadores extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('catalogo_coordinadores', function ( Blueprint $table ) {
            $table->increments('id');
            $table->string('nombre',100)->nullable()->unique();
            $table->string('apellido',100)->nullable();
            $table->string('correo',70)->nullable();
            $table->integer('user_id')->default('0');
            $table->smallInteger('estatus')->default('1');
            $table->integer('user_log')->nullable()->default('0');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('catalogo_coordinadores');
    }
}
