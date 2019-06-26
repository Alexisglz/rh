<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


/**
 * App\Incidencias
 *
 * @method static bool|null forceDelete()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Incidencias newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Incidencias newQuery()
 * @method static \Illuminate\Database\Query\Builder|\App\Incidencias onlyTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Incidencias query()
 * @method static bool|null restore()
 * @method static \Illuminate\Database\Query\Builder|\App\Incidencias withTrashed()
 * @method static \Illuminate\Database\Query\Builder|\App\Incidencias withoutTrashed()
 * @mixin \Eloquent
 */
class Incidencias extends Model
{
	 //use SoftDeletes;
	 protected $table = 'incidencias';   
	 protected $dates = ['deleted_at'];
}
