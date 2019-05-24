<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\ProyectosIndeplo
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosIndeplo newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosIndeplo newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosIndeplo query()
 * @mixin \Eloquent
 */
class ProyectosIndeplo extends Model
{
    protected $connection = 'incore';
    protected $table      = 'proyectos_indeplo';
    public $timestamps    = false;
}
