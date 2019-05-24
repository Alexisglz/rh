<?php

namespace App\Models;

use App\Empleados;
use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\MovimientosCoordinador
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosCoordinador newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosCoordinador newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientosCoordinador query()
 * @mixin \Eloquent
 */
class MovimientosCoordinador extends Model
{
    protected $connection = 'incore';
    protected $table      = 'movimientos_coordinador';
    public $timestamps    = false;

    public function getEmpleado(){
        return $this->hasOne(Empleados::class, 'empleado_id','empleado_id');
    }
}
