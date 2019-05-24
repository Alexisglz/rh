<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

/**
 * App\Bitacoras
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Bitacoras newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Bitacoras newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Bitacoras query()
 * @mixin \Eloquent
 */
class Bitacoras extends Model
{
    protected $table = 'bitacoras';

    public static function getbitacoras(){
    	$array = DB::table('bitacoras')->pluck('id','tipo');
    	return $array;
    }
}
