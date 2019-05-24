<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\ProyectosServicios
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosServicios newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosServicios newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosServicios query()
 * @mixin \Eloquent
 */
class ProyectosServicios extends Model
{
    protected $connection = 'incore';
    protected $table      = 'proyectos_servicios';
}
