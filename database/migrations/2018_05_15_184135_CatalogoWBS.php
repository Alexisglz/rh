<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CatalogoWBS extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('catalogo_wbs',function ( Blueprint $table ) {
            $table->increments('id');
            $table->string('cliente');
            $table->string('servicio');
            $table->string('region');
            $table->string('tecnologia');
            $table->string('grupo');
            $table->integer('estatus');

            $table->foreign('cliente')->references('id')->on('proyectos_clientes');
            $table->foreign('servicio')->references('id')->on('proyectos_servicios');
            $table->foreign('region')->references('id')->on('proyectos_regiones');
            $table->foreign('tecnologia')->references('id')->on('proyectos_tecnologias');
            $table->foreign('grupo')->references('id')->on('proyectos_grupos');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('catalogo_wbs');
    }
}
