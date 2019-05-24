<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\ProyectosEntregablesCodigos
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosEntregablesCodigos newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosEntregablesCodigos newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosEntregablesCodigos query()
 * @mixin \Eloquent
 */
class ProyectosEntregablesCodigos extends Model
{
    protected $connection = 'incore';
    protected $table      = 'proyectos_entregables_codigos';
    public $timestamps    = false;
}
