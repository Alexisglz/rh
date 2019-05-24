<?php

use Illuminate\Database\Seeder;

class incidenciasTipos extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
    	DB::table('incidencias_catalogo')->insert(
			[
				['id'=>'1','nombre' => 'faltas','tipo' => 'baja','descripcion' => 'declarar las faltas injustificadas de un empleado','tratamiento' => 'lapso'],
				['id'=>'2','nombre' => 'bono','tipo' => 'alta','descripcion' => 'declarar bonificaciones a empleados','tratamiento' => 'monto'],
				['id'=>'3','nombre' => 'vacaciones','tipo' => 'alta','descripcion' => 'declarar vacaciones a empleados','tratamiento' => 'rango'],
				
			]
        );
    }
}
