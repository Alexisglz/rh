<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\MovimientosSueldo
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosSueldo newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosSueldo newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosSueldo query()
 * @mixin \Eloquent
 */
class MovimientosSueldo extends Model
{
    protected $connection = 'incore';
    protected $table      = 'movimientos_sueldo';
    public $timestamps    = false;
}
