<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

/**
 * App\Estados
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Estados newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Estados newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Estados query()
 * @mixin \Eloquent
 */
class Estados extends Model
{
    protected $table = 'catalogo_entidades_mexico';

    public static function getEstados(){
    	$array = DB::table('incore.catalogo_entidades_mexico')->pluck('nombre','id');
    	return $array;
    }
}
