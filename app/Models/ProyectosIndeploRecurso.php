<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\ProyectosIndeploRecurso
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosIndeploRecurso newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosIndeploRecurso newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosIndeploRecurso query()
 * @mixin \Eloquent
 */
class ProyectosIndeploRecurso extends Model
{
    protected $connection = 'incore';
    protected $table      = 'proyectos_indeplo_recursos';
    public $timestamps    = false;
}
