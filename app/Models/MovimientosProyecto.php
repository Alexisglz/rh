<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\MovimientosProyecto
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosProyecto newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosProyecto newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosProyecto query()
 * @mixin \Eloquent
 */
class MovimientosProyecto extends Model
{
    protected $connection = 'incore';
    protected $table      = 'movimientos_proyectos';
    public $timestamps    = false;
}
