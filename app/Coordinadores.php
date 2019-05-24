<?php

namespace App;
use App\Models\CatalogoCoordinadores;
use DB;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Coordinadores
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Coordinadores newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Coordinadores newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Coordinadores query()
 * @mixin \Eloquent
 */
class Coordinadores extends Model
{
    protected $connection = 'incore';
    protected $table      = 'catalogo_coordinadores';

    public static function getCoordinadores(){
    	$array = CatalogoCoordinadores::where('estatus','=','1')
    				->orderBy('nombre', 'asc')
    				->pluck('nombre','id');
    	return $array;
    }

    public static function existeCoord($valor){
    	$array = DB::table('catalogo_coordinadores')
    				->select( DB::raw("COUNT(*) as total") )
    				->where('nombre','like','%'.$valor.'%')
    				->get();
    	return $array;
    }
}
