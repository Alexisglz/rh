<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\ProyectosIndeploCodigos
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosIndeploCodigos newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosIndeploCodigos newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\ProyectosIndeploCodigos query()
 * @mixin \Eloquent
 */
class ProyectosIndeploCodigos extends Model
{
    protected $connection = 'incore';
    protected $table      = 'proyectos_indeplo_codigos';
    protected $fillable   = ['cantidad','usuario_id','mes','anio','proyecto_id','codigo_id'];
    public $timestamps    = false;
}
