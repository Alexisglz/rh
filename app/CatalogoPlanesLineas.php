<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

/**
 * App\CatalogoPlanesLineas
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoPlanesLineas newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoPlanesLineas newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoPlanesLineas query()
 * @mixin \Eloquent
 */
class CatalogoPlanesLineas extends Model
{
    protected $table = 'catalogo_wbs';

    public static function getPlanes(){
    	$array = DB::table('catalogo_planes_lineas')
    				->where('activo','=','1')
    				->pluck(DB::raw("CONCAT_WS('-',plan_nombre,plan_descripcion) AS descripcion"),'plan_id');
    	return $array;
    } 

    public static function getCostoPlan($id){
    	$array = DB::table('catalogo_planes_lineas')
    				->where('plan_id','=',$id)
    				->pluck('plan_costo');
    	return $array;
    } 
}
