<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\UsuariosTickets
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\UsuariosTickets newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\UsuariosTickets newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\UsuariosTickets query()
 * @mixin \Eloquent
 */
class UsuariosTickets extends Model
{
    protected $connection = 'tickets';
    protected $table      = 'usuarios';
    protected $primaryKey = 'id_usuario';
    public    $timestamps = false;
}
