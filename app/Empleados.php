<?php

namespace App;

use App\Models\MovimientoRecurso;
use App\Models\MovimientosCoordinador;
use App\Models\MovimientosProyecto;
use App\Models\MovimientosSueldo;
use DB;
use Illuminate\Database\Eloquent\Model;

/**
 * App\Empleados
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Empleados newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Empleados newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Empleados query()
 * @mixin \Eloquent
 */
class Empleados extends Model
{
    protected $connection = 'incore';
    protected $table      = 'empleados';
    protected $primaryKey = 'empleado_id';
    public $timestamps    = false;

    public function getCoordinador(){
        return $this->hasOne(MovimientosCoordinador::class, 'empleado_id','empleado_id')->whereNull('fecha_fin');
    }

    public function getMovimientoRecurso(){
        return $this->hasOne(MovimientoRecurso::class, 'empleado_id','empleado_id')->whereNull('fecha_baja')->with('getRazonRH');
    }

    public function getMovimientoSueldo(){
        return $this->hasOne(MovimientosSueldo::class, 'empleado_id', 'empleado_id')->whereNull('fecha_fin');
    }

    public function getMovimientoProyecto(){
        return $this->hasOne(MovimientosProyecto::class, 'empleado_id', 'empleado_id')->whereNull('fecha_fin');
    }

    public function getWBS(){
        return $this->hasOne(MovimientosProyecto::class, 'empleado_id', 'empleado_id')->whereNull('fecha_fin')->select(DB::raw("id,CONCAT_WS('-',cliente,servicio,region,tecnologia,grupo) AS wbs"));
    }
}
