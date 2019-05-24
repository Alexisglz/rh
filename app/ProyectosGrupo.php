<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\ProyectosGrupo
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosGrupo newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosGrupo newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosGrupo query()
 * @mixin \Eloquent
 */
class ProyectosGrupo extends Model
{
    protected $connection = 'incore';
    protected $table      = 'proyectos_grupos';
}
