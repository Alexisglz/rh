<?php

namespace App\Listeners;

use App\Events\AltaEvents;
use App\Mail\AuthDireccion;
use App\Mail\AuthRH;
use App\Mail\ListoHerramienta;
use App\Mail\SolicitudAlta;
use App\Models\DirectorArea;
use App\User;
use DB;
use Illuminate\Contracts\Queue\ShouldQueue;
use Mail;

/* Para habilitar la cola de correos agregar a la clase  implements ShouldQueue y habilitar el cron  */

class EnviarCorreos implements ShouldQueue
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  AltaEvents  $event
     * @return void
     */
    public function handle(AltaEvents $event)
    {
        try{
            $solicitud   = $event->solicitud;
            $tipo        = $event->tipo;
            $herramienta = $event->herramienta;
            $email       = config('app.mail_dev');
            $oculto      = config('app.mail_dev');
            $nombre      = $solicitud->nombre.' '.$solicitud->apaterno.' '.$solicitud->amaterno;
            switch ($tipo){
                case 'notificar_dir':
                    $message  = 'Se ha registrado una solicitud de alta con el id: '.$solicitud->id;
                    if (config('app.env')=="local")
                        Mail::to($email)->bcc($oculto)->send(new SolicitudAlta($message, $nombre, $solicitud->id));
                    else {
                        if ($solicitud->cliente == 'IND'){
                            $models = DirectorArea::where(DB::raw("CONCAT_WS('-',cliente,servicio)"),'=',$solicitud->cliente.'-'.$solicitud->servicio)->get();
                            foreach ($models  as $model){
                                $usuario = User::find($model->id_usuario);
                                Mail::to($usuario->correo)->bcc($oculto)->send(new SolicitudAlta($message, $nombre, $solicitud->id));
                            }
                        }
                        else{
                            $correos = DB::table('vista_permisos_empleados')
                                ->where('codigo', '=','autorizar_solicitudes')
                                ->orWhere('area', '=','Recursos Humanos')
                                ->groupBy('id_usuario')
                                ->get();
                            foreach ($correos as $correo){
                                Mail::to($correo->email)->bcc($oculto)->send(new SolicitudAlta($message, $nombre, $solicitud->id));
                            }
                        }
                    }
                    break;
                case 'notificar_auth_rh':
                    $message  = 'Direccion autorizo una solicitud de alta con el id: '.$solicitud->id.' ahora puede entrar a agendar la cita.';
                    if (config('app.env')=="local")
                        Mail::to($email)->bcc($oculto)->send(new AuthDireccion($message, $nombre, $solicitud->id));
                    else {
                        $correos = DB::table('vista_permisos_empleados')
                            ->where('codigo', '=','agendar_cita')
                            ->groupBy('id_usuario')
                            ->get();
                        foreach ($correos as $correo){
                            Mail::to($correo->email)->bcc($oculto)->send(new AuthDireccion($message, $nombre,$solicitud->id));
                        }
                    }
                    break;
                case 'notificar_alta_herramientas':
                    if( $solicitud->celular == 1 || $solicitud->bam == 1){
                        $message  = 'Se ha registrado una solicitud de alta con el id '.$solicitud->id.', con cita para el: '.$solicitud->fecha_cita.' que requiere celular/bam:';
                        if (config('app.env')=="local")
                            Mail::to($email)->bcc($oculto)->send(new AuthRH($message, $nombre, $solicitud->id));
                        else {
                            $correos = DB::table('vista_permisos_empleados')
                                ->where('codigo', '=','autorizar_celular')
                                ->get();
                            foreach ($correos as $correo){
                                Mail::to($correo->email)->bcc($oculto)->send(new AuthRH($message, $nombre, $solicitud->id));
                            }
                        }
                    }
                    if( $solicitud->computadora == 1 || $solicitud->software == 1){
                        $message  = 'Se ha registrado una solicitud de alta con el id '.$solicitud->id.', con cita para el: '.$solicitud->fecha_cita.' que requiere computadora/software:';
                        if (config('app.env')=="local")
                            Mail::to($email)->bcc($oculto)->send(new AuthRH($message, $nombre, $solicitud->id));
                        else {
                            $correos = DB::table('vista_permisos_empleados')
                                ->where('codigo', '=','autorizar_computadora')
                                ->get();
                            foreach ($correos as $correo){
                                Mail::to($correo->email)->bcc($oculto)->send(new AuthRH($message, $nombre, $solicitud->id));
                            }
                        }
                    }
                    if( $solicitud->auto == 1){
                        $message  = 'Se ha registrado una solicitud de alta con el id '.$solicitud->id.', con cita para el: '.$solicitud->fecha_cita.' que requiere auto:';
                        if (config('app.env')=="local")
                            Mail::to($email)->bcc($oculto)->send(new AuthRH($message, $nombre, $solicitud->id));
                        else {
                            $correos = DB::table('vista_permisos_empleados')
                                ->where('codigo', '=','autorizar_coche')
                                ->get();
                            foreach ($correos as $correo){
                                Mail::to($correo->email)->bcc($oculto)->send(new AuthRH($message, $nombre, $solicitud->id));
                            }
                        }
                    }
                    if( $solicitud->botas == 1 || $solicitud->playera){
                        $message  = 'Se ha registrado una solicitud de alta con el id '.$solicitud->id.', con cita para el: '.$solicitud->fecha_cita.' que requiere herramientas:';
                        if (config('app.env')=="local")
                            Mail::to($email)->bcc($oculto)->send(new AuthRH($message, $nombre, $solicitud->id));
                        else {
                            $correos = DB::table('vista_permisos_empleados')
                                ->where('codigo', '=','autorizar_herramientas')
                                ->get();
                            foreach ($correos as $correo){
                                Mail::to($correo->email)->bcc($oculto)->send(new AuthRH($message, $nombre, $solicitud->id));
                            }
                        }
                    }
                    break;
                case 'listo_herra':
                    $message = [];
                    switch ($herramienta){
                        case 'computo':
                            if ($solicitud->computadora == 1)
                                $message[] = 'Computadora';
                            if ($solicitud->tipo_correo != "" && $solicitud->tipo_correo != null)
                                $message[] = 'Correo';
                            break;
                        case 'celular':
                            if ($solicitud->celular == 1)
                                $message[] = 'Celular';
                            if ($solicitud->bam == 1)
                                $message[] = 'Bam';
                            break;
                        case 'auto':
                            if ($solicitud->auto == 1)
                                $message[] = 'Auto';
                            break;
                        case 'almacen':
                            if ($solicitud->botas == 1)
                                $message[] = 'Botas';
                            if ($solicitud->playera == 1)
                                $message[] = 'Playera';
                            break;
                    }
                    if (config('app.env')=="local")
                        Mail::to($email)->bcc($oculto)->send(new ListoHerramienta($message, $nombre));
                    else {
                        $correos = DB::table('vista_permisos_empleados')
                            ->where('codigo', '=', 'autorizar_herramientas')
                            ->get();
                        foreach ($correos as $correo) {
                            Mail::to($correo->email)->bcc($oculto)->send(new ListoHerramienta($message, $nombre));
                        }
                    }
                    break;
            }

        }catch (\Exception $e){
            dd($e);
        }
    }
}
