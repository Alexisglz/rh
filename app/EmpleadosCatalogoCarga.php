<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

/**
 * App\EmpleadosCatalogoCarga
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\EmpleadosCatalogoCarga newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\EmpleadosCatalogoCarga newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\EmpleadosCatalogoCarga query()
 * @mixin \Eloquent
 */
class EmpleadosCatalogoCarga extends Model
{
    protected $connection = 'incore';
    protected $table = 'empleados_catalogo_carga';

    public static function getCostosCarga($riesgo,$imss){
    	$array = DB::table('incore.empleados_catalogo_carga')
    				->select('porcentaje')
    				->whereRaw( ' tipo = "'.$riesgo.'" AND '.$imss.' BETWEEN sueldo_minimo AND sueldo_maximo ' )
    				->get();
    	return $array;
    }
}
