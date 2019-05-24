<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\EmpleadoCodigoMovimiento
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\EmpleadoCodigoMovimiento newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\EmpleadoCodigoMovimiento newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\EmpleadoCodigoMovimiento query()
 * @mixin \Eloquent
 */
class EmpleadoCodigoMovimiento extends Model
{
    protected $connection = 'incore';
    protected $table      = 'empleados_codigos_movimientos';
    public $timestamps    = false;
}
