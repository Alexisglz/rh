<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

/**
 * App\CostosIncore
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CostosIncore newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CostosIncore newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CostosIncore query()
 * @mixin \Eloquent
 */
class CostosIncore extends Model
{
    protected $connection = 'incore';
    protected $table = 'costos_solicitud_alta';

    public static function getCostos(){
    	$array = DB::table('incore.costos_solicitud_alta')
    				->select()
    				->get();
    	return $array;
    }
}
