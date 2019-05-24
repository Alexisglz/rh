<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class PlanesLineas extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('catalogo_planes_lineas', function ( Blueprint $table ) {
            $table->increments('plan_id')->unsigned();
            $table->string('plan_codigo',40)->nullable();
            $table->string('plan_nombre',60)->nullable();
            $table->string('plan_tipo',50)->nullable();
            $table->text('plan_descripcion')->nullable();
            $table->decimal('plan_costo', 10, 2)->default('0.00');
            $table->decimal('plan_precio', 10, 2)->default('0.00');
            $table->string('plan_empresa',40)->nullable();
            $table->enum('plan_proveedor',['MOVISTAR', 'TELCEL', 'AT&T', 'IUSACELL'])->default('MOVISTAR');
            $table->tinyInteger('activo')->unsigned();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('catalogo_planes_lineas');
    }
}
