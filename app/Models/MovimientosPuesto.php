<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\MovimientosPuesto
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosPuesto newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosPuesto newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosPuesto query()
 * @mixin \Eloquent
 */
class MovimientosPuesto extends Model
{
    protected $connection = 'incore';
    protected $table      = 'movimientos_puestos';
    public $timestamps    = false;
}
