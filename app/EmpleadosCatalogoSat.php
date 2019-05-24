<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

/**
 * App\EmpleadosCatalogoSat
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\EmpleadosCatalogoSat newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\EmpleadosCatalogoSat newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\EmpleadosCatalogoSat query()
 * @mixin \Eloquent
 */
class EmpleadosCatalogoSat extends Model
{
    protected $connection = 'incore';
    protected $table = 'empleados_catalogo_sat';

    public static function getCostosSat($sueldo_total){
    	$array = DB::table('incore.empleados_catalogo_sat')
    				->select('porcentaje')
    				->whereRaw( ' '.$sueldo_total.' BETWEEN sueldo_minimo AND sueldo_maximo ' )
    				->get();
    	return $array;
    }
}