<?php

namespace App\Listeners;

use App\Events\IncidenciasNotificar;
use App\Mail\IncidenciasAutorizar;
use App\Models\CatalogoCoordinadores;
use App\Models\DirectorArea;
use App\Models\IncidenciaPeriodo;
use App\User;
use DB;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Mail;

class EnviarCorreosDir implements ShouldQueue
{
    /**
     * @var false|string
     */
    private $date;

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        $this->date = date('Y-m-d');
    }

    /**
     * Handle the event.
     *
     * @param  IncidenciasNotificar  $event
     * @return void
     */
    public function handle(IncidenciasNotificar $event)
    {
        try{
            $tipo    = $event->tipo;
            $perms   = $event->perms;
            $url     = $event->opc;
            $periodo = IncidenciaPeriodo::where('fecha_inicio','<=', $this->date)
                ->where('fecha_envio','>=', $this->date)->first();
            $fecha_direc  = $periodo->limite_directivo;
            $fecha_jav    = $periodo->limite_direccion;
            $fecha_coord  = $periodo->fecha_fin;
            $email        = config('app.mail_dev');
            $oculto       = config('app.mail_dev');
            switch ($tipo){
                case 'auth':
                    $correos = DB::table('vista_permisos_empleados')
                        ->whereIn('codigo', $perms)
                        ->groupBy('id_usuario')
                        ->get();
                    if (config('app.env')=="local")
                        Mail::to($email)->bcc($oculto)->send(new IncidenciasAutorizar($url,$fecha_jav,$correos->toArray(),$periodo->periodo_nombre));
                    if (config('app.env')=="production") {
                        foreach ($correos  as $correo){
                            Mail::to($correo->email)->bcc($oculto)->send(new IncidenciasAutorizar($url,$fecha_jav,$correos->toArray(),$periodo->periodo_nombre));
                        }
                    }
                    break;
                case 'dir':
                    $directivos = DirectorArea::query()->groupBy('id_usuario')->get();
                    $correos = [];
                    foreach ($directivos as $directivo){
                        $usuario = User::where('id_usuario',$directivo->id_usuario)->first();
                        if (isset($usuario->correo))
                            $correos[] = $usuario->correo;
                    }
                    if (config('app.env')=="local")
                        Mail::to($email)->bcc($oculto)->send(new IncidenciasAutorizar($url,$fecha_direc,$correos,$periodo->periodo_nombre));
                    if (config('app.env')=="production") {
                        foreach ($correos  as $correo){
                            Mail::to($correo)->bcc($oculto)->send(new IncidenciasAutorizar($url,$fecha_direc,$correos,$periodo->periodo_nombre));
                        }
                    }
                    break;
                case 'coord':
                    $coordinadores = CatalogoCoordinadores::where('user_id','<>',0)->where('estatus',1)
                        ->get();
                    $correos = [];
                    foreach ($coordinadores as $coordinador){
                        $usuario = User::where('id_usuario',$coordinador->user_id)->first();
                        if (isset($usuario->correo))
                            $correos[] = $usuario->correo;
                    }
                    if (config('app.env')=="local")
                        Mail::to($email)->bcc($oculto)->send(new IncidenciasAutorizar($url,$fecha_coord,$correos,$periodo->periodo_nombre));
                    if (config('app.env')=="production") {
                        foreach ($correos  as $correo){
                            Mail::to($correo)->bcc($oculto)->send(new IncidenciasAutorizar($url,$fecha_coord,$correos,$periodo->periodo_nombre));
                        }
                    }
                    break;
            }
        }catch (\Exception $e){
            echo $e->getMessage();
        }
    }
}
