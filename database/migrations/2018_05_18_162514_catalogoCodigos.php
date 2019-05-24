<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CatalogoCodigos extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('catalogo_codigos', function ( Blueprint $table ) {
            $table->increments('id');
            $table->string('codigo',20);
            $table->string('concepto',150);
            $table->decimal('precio', 11, 2);
            $table->decimal('costo', 11, 2)->default('0.00');
            $table->string('incluye')->nullable();
            $table->string('tipo',50)->nullable();
            $table->tinyInteger('diario')->nullable()->unsigned()->default('0');
            $table->string('pd',9);
            $table->decimal('diario_gasolina', 5, 2)->default('0.00');
            $table->decimal('monto_viatico', 10, 2)->default('0.00');
            $table->tinyInteger('incluye_viaticos')->unsigned()->default('0');
            $table->tinyInteger('incluye_equipo')->default('0');
            $table->text('descripcion')->nullable();
            $table->decimal('horas', 8, 2)->nullable();
            $table->date('caduca')->nullable();
            $table->enum('tipo_precio',['local', 'foraneo'])->nullable();
            $table->string('user_log',50);
            $table->timestamp('timestamp')->useCurrent();
            $table->Integer('dias')->default('30');
            $table->tinyInteger('temporal')->nullable()->default('1');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('catalogo_codigos');
    }
}
