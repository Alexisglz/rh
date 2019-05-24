<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\solicitudbaja
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\solicitudbaja newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\solicitudbaja newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\solicitudbaja query()
 * @mixin \Eloquent
 */
class solicitudbaja extends Model
{
    protected $table = 'solicitudes_baja_nomina';
    protected $dateFormat = 'Y-m-d H:i:s';
}
