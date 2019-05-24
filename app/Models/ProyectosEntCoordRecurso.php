<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\ProyectosEntCoordRecurso
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosEntCoordRecurso newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosEntCoordRecurso newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosEntCoordRecurso query()
 * @mixin \Eloquent
 */
class ProyectosEntCoordRecurso extends Model
{
    protected $connection = 'incore';
    protected $table      = 'proyectos_entregables_coordinador_recurso';
    public $timestamps    = false;
    protected $fillable   = ['id_recurso','id_usuario','id_coordinador_nokia'];
}
