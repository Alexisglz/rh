<?php

use Illuminate\Database\Seeder;

class Estados extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('catalogo_entidades_mexico')->insert(
			[
				['id' => 'ALE','nombre' => 'AL Enterprise','activo' => '0'],
				['nombre' => 'AGUASCALIENTES'],
				['nombre' => 'BAJA CALIFORNIA'],
				['nombre' => 'BAJA CALIFORNIA SUR'],
				['nombre' => 'CAMPECHE'],
				['nombre' => 'COAHUILA'],
				['nombre' => 'COLIMA'],
				['nombre' => 'CHIAPAS'],
				['nombre' => 'CHIHUAHUA'],
				['nombre' => 'CIUDAD DE MÉXICO'],
				['nombre' => 'DURANGO'],
				['nombre' => 'GUANAJUATO'],
				['nombre' => 'GUERRERO'],
				['nombre' => 'HIDALGO'],
				['nombre' => 'JALISCO'],
				['nombre' => 'MÉXICO'],
				['nombre' => 'MICHOACÁN'],
				['nombre' => 'MORELOS'],
				['nombre' => 'NAYARIT'],
				['nombre' => 'NUEVO LEÓN'],
				['nombre' => 'OAXACA'],
				['nombre' => 'PUEBLA'],
				['nombre' => 'QUERÉTARO'],
				['nombre' => 'QUINTANA ROO'],
				['nombre' => 'SAN LUIS POTOSÍ'],
				['nombre' => 'SINALOA'],
				['nombre' => 'SONORA'],
				['nombre' => 'TABASCO'],
				['nombre' => 'TAMAULIPAS'],
				['nombre' => 'TLAXCALA'],
				['nombre' => 'VERACRUZ'],
				['nombre' => 'YUCATÁN'],
				['nombre' => 'ZACATECAS']
			]
		);
    }
}
