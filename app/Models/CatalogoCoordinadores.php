<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\CatalogoCoordinadores
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatalogoCoordinadores newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatalogoCoordinadores newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatalogoCoordinadores query()
 * @mixin \Eloquent
 */
class CatalogoCoordinadores extends Model
{
    protected $connection = 'incore';
    protected $table      = 'catalogo_coordinadores';

    public function getMovimientos(){ // Obtener los movimientos activos de este coordinador
        return $this->hasMany(MovimientosCoordinador::class, 'coordinador_id', 'id')
            ->whereNotNull('empleado_id')
            ->whereNull('fecha_fin')
            ->with('getEmpleado'); // Llamar a la funcion que obtiene los datos del empleado de cada movimiento
    }
}
