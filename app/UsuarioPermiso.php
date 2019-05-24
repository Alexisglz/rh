<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\UsuarioPermiso
 *
 * @property-read \App\Permiso $permisos
 * @method static \Illuminate\Database\Eloquent\Builder|\App\UsuarioPermiso newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\UsuarioPermiso newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\UsuarioPermiso query()
 * @mixin \Eloquent
 */
class UsuarioPermiso extends Model
{
    protected $connection = 'mysql';
    protected $table = 'usuario_permisos';
    public function permisos(){
        return $this->hasOne(Permiso::class, 'id','id_permiso');
    }
}
