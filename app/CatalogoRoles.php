<?php

// MOD:JL,  Modelo para obtener los roles de los usuarios
// Crea un select y muestra  los datos en los controles de la vista
// Creado 15-11-18 
// By: Jose Luis DTI consultores.


namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

/**
 * App\CatalogoRoles
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoRoles newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoRoles newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoRoles query()
 * @mixin \Eloquent
 */
class CatalogoRoles extends Model
{
    protected $table = 'catalogo_roles';

    public static function getRoles(){
    	$array = DB::table('usuarios_roles')->pluck('Descripcion', 'id');
    	return $array;
    }
}