<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AjustesSueldos extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ajustes_sueldos', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('id_empleado');
            $table->integer('num_empleado');
            $table->float('tradicional')->default(0);
            $table->float('asimilado')->default(0);
            $table->text('observaciones')->nullable();
            $table->text('url')->nullable();
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
        Schema::dropIfExists('ajustes_sueldos');
    }
}
