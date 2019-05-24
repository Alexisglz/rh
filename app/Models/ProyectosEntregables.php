<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\ProyectosEntregables
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosEntregables newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosEntregables newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosEntregables query()
 * @mixin \Eloquent
 */
class ProyectosEntregables extends Model
{
    protected $connection = 'incore';
    protected $table      = 'proyectos_entregables';
    public $timestamps    = false;
}
