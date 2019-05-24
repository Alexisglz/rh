<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\MovimientoRecurso
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientoRecurso newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientoRecurso newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\MovimientoRecurso query()
 * @mixin \Eloquent
 */
class MovimientoRecurso extends Model
{
    protected $connection            = 'incore';
    protected $table                 = 'movimientos_recurso';
    protected $connectionsToTransact = ['incore'];
    public $timestamps               = false;

    public function getRazonRH(){
        return $this->hasOne(CatalogoRazonRH::class, 'razon_id','razon_rh')->with('getRazonCapital');
    }
}
