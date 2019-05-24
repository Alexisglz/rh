<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class TablaSolicitudes extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('solicitud_alta', function ( Blueprint $table ) {
            $table->increments('id')->unsigned();
            $table->string('cliente',5);
            $table->string('servicio',5);
            $table->string('region',5);
            $table->string('tecnologia',5);
            $table->string('grupo',5);

            $table->string('nombre',60)->nullable();
            $table->string('apaterno',40)->nullable();
            $table->string('amaterno',40)->nullable();

            $table->integer('ind')->nullable();

            $table->date('fecha_inicio');
            $table->date('fecha_alta');

            $table->string('puesto',40)->nullable();

            $table->integer('codigo_sueldo')->nullable();
            $table->integer('solicitante');
            $table->decimal('sueldo_venta',10, 2)->nullable();

            $table->string('esquema',20);
            $table->smallInteger('riesgo');

            $table->smallInteger('celular')->default('0');
            $table->integer('codigo_celular')->nullable();
            $table->smallInteger('computadora')->default('0');
            $table->integer('codigo_computadora')->nullable();
            $table->text('desc_computadora')->nullable();
            $table->smallInteger('auto')->default('0');
            $table->integer('codigo_auto')->nullable();
            $table->smallInteger('bam')->default('0');
            $table->integer('codigo_bam')->nullable();
            $table->smallInteger('software')->default('0');
            $table->integer('codigo_software')->nullable();
            $table->text('desc_software')->nullable();

            $table->integer('plan_linea')->nullable();
            $table->integer('plan_linea_bam')->nullable();

            $table->integer('botas')->default('0');
            $table->decimal('talla_botas',10,2)->nullable();

            $table->integer('playera')->default('0');
            $table->decimal('talla_playera',10,2)->nullable();

            $table->text('actividad')->nullable();

            $table->integer('coordinador_id');
            $table->string('pm',100)->nullable();

            $table->string('lugar_trabajo',100)->nullable();

            $table->decimal('venta',10,2)->nullable();
            $table->decimal('costo',10,2)->nullable();

            $table->string('cotizacion_url',200)->nullable();
            $table->string('caso_negocio_url',200)->nullable();
            $table->string('vobo_url',200)->nullable();
            $table->string('curriculum_url',200)->nullable();

            $table->decimal('sueldo_imss',10,2);
            $table->decimal('sueldo_variable',10,2);

            $table->datetime('cita_herramienta');

            $table->string('tipo_correo',50);

            $table->string('motivo',150);

            $table->integer('tipo_proyecto')->default('1');// ESQUEMA TASK, ETL, ETC.

            $table->text('direccion');

            $table->timestamps();

        });

        Schema::create('solicitud_alta_comentarios', function ( Blueprint $table ) {
            $table->increments('id');
            $table->integer('id_solicitud');
            $table->enum('tipo',['COMPUTO', 'AUTO', 'ALMACEN', 'HERRAMIENTA']);
            $table->text('comentario');
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
        Schema::dropIfExists('solicitud_alta');
        Schema::dropIfExists('solicitud_alta_comentarios');
    }
}
