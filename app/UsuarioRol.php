<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\UsuarioRol
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\UsuarioRol newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\UsuarioRol newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\UsuarioRol query()
 * @mixin \Eloquent
 */
class UsuarioRol extends Model
{
    protected $connection = 'mysql';
    protected $table = 'usuarios_roles';
}
