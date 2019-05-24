<?php

// MOD:SAM,  Modelo para llenar  los datos de los Dropdown con los catalogos de selecion.
// Crea un select y muestra  los datos en los controles de la vista
// Creado 10-11-18 
// By: Sam Guzman DTI consultores.


namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

/**
 * App\CatalogoIncidentes
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoIncidentes newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoIncidentes newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoIncidentes query()
 * @mixin \Eloquent
 */
class CatalogoIncidentes extends Model
{
    protected $table = 'catalogo_wbs';

    public static function getPlanes(){
    	$array = DB::table('catalogo_planes_lineas')
    				->where('activo','=','1')
    				->pluck(DB::raw("CONCAT_WS('-',plan_nombre,plan_descripcion) AS descripcion"),'plan_id');
    	return $array;
    } 
}
