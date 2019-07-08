<?php

namespace App;

use App\Models\CatalogoCoordinadores;
use App\Models\CoordinadorPD;
use App\Models\DirectorArea;
use App\Notifications\ResetPassword;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Str;
use Session;

/**
 * App\User
 *
 * @property-read \Illuminate\Notifications\DatabaseNotificationCollection|\Illuminate\Notifications\DatabaseNotification[] $notifications
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User query()
 * @mixin \Eloquent
 * @property-read \App\UsuarioPermiso $listarTodo
 */
class User extends Authenticatable
{
    use Notifiable;

    protected $connection = 'incore';
    protected $table      = 'usuarios';
    protected $primaryKey = 'id_usuario';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        //'name', 'email', 'password', 'id_area', 'edit_pass','fecha_creacion'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'password2',
    ];

    public function getRol(){
        return $this->hasOne(UsuarioRol::class, 'id','id_area');
    }

    public function getPermisos(){
        return $this->hasMany(UsuarioPermiso::class, 'id_usuario','id_usuario');
    }

    public function listarTodo(){
        return $this->hasOne(UsuarioPermiso::class, 'id_usuario','id_usuario')
            ->where('id_permiso','=', 44);
    }

    // IMPORTANTE: Esta es la funcion que se utiliza en el arbol de empleados y coordinadores
    public function getCoordinador(){ // Obtener los datos del coordinador en caso de que lo sea
        return $this
            ->hasOne(CatalogoCoordinadores::class,'user_id','id_usuario')
            ->with('getMovimientos');// Llamar a la funcion que obtinene los moviementos del coordinador del modelo CatalogoCoordinadores
    }

    public function getEmpleado(){
        return $this->hasOne(Empleados::class,'empleado_id','empleado_id')->with('getMovimientoProyecto');
    }

    public function getDirectorNoti(){
        return $this->hasOne(DirectorArea::class,'id_usuario','id_usuario');
    }

    public function getCoordPD(){
        return $this->hasMany(CoordinadorPD::class, 'usuario_id','id_usuario');
    }

    public function getEmailForPasswordReset()
    {
        return $this->correo;
    }

    public function routeNotificationFor($driver)
    {
        if (method_exists($this, $method = 'routeNotificationFor'.Str::studly($driver))) {
            return $this->{$method}();
        }

        switch ($driver) {
            case 'database':
                return $this->notifications();
            case 'mail':
                return $this->correo;
        }
    }

    public function getAuthPassword() {
        return $this->password2;
    }

    public function sendPasswordResetNotification($token)
    {
        $this->notify(new ResetPassword($token));
    }

    public function setImpersonating($id)
    {
        Session::put('impersonate', $id);
    }

    public function stopImpersonating()
    {
        Session::forget('impersonate');
    }

    public function isImpersonating()
    {
        return Session::has('impersonate');
    }
}
