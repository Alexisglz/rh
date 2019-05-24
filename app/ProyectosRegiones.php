<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\ProyectosRegiones
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosRegiones newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosRegiones newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosRegiones query()
 * @mixin \Eloquent
 */
class ProyectosRegiones extends Model
{
    protected $connection = 'incore';
    protected $table      = 'proyectos_regiones';
}
