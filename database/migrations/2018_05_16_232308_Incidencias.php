<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Incidencias extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::create('incidencias_catalogo', function ( Blueprint $table ) {
           //campos
            $table->integer('id');
            $table->primary('id');
            $table->string('nombre');
            $table->string('tipo');
            $table->string('descripcion');
            $table->string('tratamiento');
            $table->timestamps();
        });

        Schema::create('incidencias_lote',function(Blueprint $table){
            //campos
            $table->increments('id');
            $table->string('nombre_lote');
            $table->integer('id_lote');
            $table->datetime('fecha_envio');
            $table->datetime('fecha_respuesta');
            $table->string('estatus');
            $table->timestamps();
        });

        Schema::create('incidencias',function ( Blueprint $table ) {
            //campos
            $table->increments('id');
            $table->unsignedInteger('id_empleado');
            $table->integer('id_incidencia_tipo');
            $table->date('fecha_solicitud');
            $table->date('fecha_inicio')->nullable();
            $table->date('fecha_fin')->nullable();
            $table->integer('dias')->nullable();
            $table->double('monto')->nullable();
            $table->unsignedInteger('id_solicitante');
            $table->unsignedInteger('id_lote')->nullable();
            $table->date('auth_rh')->nullable();
            $table->unsignedInteger('id_rh_auth')->nullable();
            $table->date('auth_direccion')->nullable();
            $table->unsignedInteger('id_direccion_auth')->nullable();
            $table->date('auth_capital')->nullable();
            $table->unsignedInteger('id_capital_auth')->nullable();
            $table->timestamps();
            //llaves foraneas
            $table->foreign('id_incidencia_tipo')->references('id')->on('incidencias_catalogo');
            $table->foreign('id_solicitante')->references('id_usuario')->on('usuarios');
            $table->foreign('id_lote')->references('id')->on('incidencias_lote');
            $table->foreign('id_rh_auth')->references('id_usuario')->on('usuarios');
            $table->foreign('id_direccion_auth')->references('id_usuario')->on('usuarios');
            $table->foreign('id_capital_auth')->references('id_usuario')->on('usuarios');
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
        Schema::dropIfExists('incidencias');
        Schema::dropIfExists('incidencias_lote');
        Schema::dropIfExists('incidencias_catalogo');

    }
}
