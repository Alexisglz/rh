<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\ProyectosClientes
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosClientes newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosClientes newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\ProyectosClientes query()
 * @mixin \Eloquent
 */
class ProyectosClientes extends Model
{
    protected $connection = 'incore';
    protected $table      = 'proyectos_clientes';
}
