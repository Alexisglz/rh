<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\ProyectosTecnologias
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosTecnologias newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosTecnologias newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosTecnologias query()
 * @mixin \Eloquent
 */
class ProyectosTecnologias extends Model
{
    protected $connection = 'incore';
    protected $table      = 'proyectos_tecnologias';
}
