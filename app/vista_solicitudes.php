<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


/**
 * App\vista_solicitudes
 *
 * @method static bool|null forceDelete()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\vista_solicitudes newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\vista_solicitudes newQuery()
 * @method static \Illuminate\Database\Query\Builder|\App\vista_solicitudes onlyTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\vista_solicitudes query()
 * @method static bool|null restore()
 * @method static \Illuminate\Database\Query\Builder|\App\vista_solicitudes withTrashed()
 * @method static \Illuminate\Database\Query\Builder|\App\vista_solicitudes withoutTrashed()
 * @mixin \Eloquent
 */
class vista_solicitudes extends Model
{
	 use SoftDeletes;
	 protected $table = 'vista_solicitudes';   
	protected $dates = ['deleted_at'];
}
