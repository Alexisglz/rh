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
                    $correos  = [];
                    $option   = 'por_director';
                    $puestos_gerentes    = ['33','36','228','229','230','231','232','233','234','235','236','237','238','239',
                        '34','44','47','48','51','205','206','207','208','209','210','211','212','213','214','386','569'
                    ];// ID catalogo puesto Gerentes
                    if (in_array($solicitud->puesto,$puestos_gerentes)){
                        $correos = User::whereIn('id_usuario', [19])->groupBy('id_usuario')->get();
                        if (config('app.env')=="local")
                            Mail::to($email)->bcc($oculto)->send(new SolicitudAlta($message, $nombre, $solicitud->id, $correos->toArray()));
                        if (config('app.env')=="production") {
                            foreach ($correos as $correo){
                                Mail::to($correo->correo)->bcc($oculto)->send(new SolicitudAlta($message, $nombre, $solicitud->id));
                            }
                        }
                    }
                    else{
                        if ($solicitud->servicio == 'TKBS' || $solicitud->servicio == 'POLZ' || $solicitud->servicio == 'SERV'){
                            $margen = $solicitud->margen;
                            if ($margen < 20){
                                $option = 'menor_20';
                            }
                            else
                                $option = 'mayor_20';
                        }

                        if ($option == 'menor_20'){
                            $correos = User::whereIn('id_usuario', [117])->groupBy('id_usuario')->get();
                        }
                        if ($option == 'mayor_20'){
                            $models = DirectorArea::where(DB::raw("CONCAT_WS('-',cliente,servicio)"),'=',$solicitud->cliente.'-'.$solicitud->servicio)->get();
                            if (count($models) == 0){
                                $option = 'sin_director';
                                $correos = User::whereIn('id_usuario', [117])->groupBy('id_usuario')->get();
                            }
                        }
                        if ($option == 'por_director'){
                            $models = DirectorArea::where(DB::raw("CONCAT_WS('-',cliente,servicio)"),'=',$solicitud->cliente.'-'.$solicitud->servicio)->get();
                            if (count($models) == 0){
                                $option = 'sin_director';
                                $correos = User::whereIn('id_usuario', [117])->groupBy('id_usuario')->get();
                            }
                        }
                        if (count($correos) > 0){
                            if (config('app.env')=="local")
                                Mail::to($email)->bcc($oculto)->send(new SolicitudAlta($message, $nombre, $solicitud->id, $correos->toArray()));
                            if (config('app.env')=="production") {
                                foreach ($correos as $correo){
                                    Mail::to($correo->correo)->bcc($oculto)->send(new SolicitudAlta($message, $nombre, $solicitud->id));
                                }
                            }
                        }
                        else{
                            if (config('app.env')=="local")
                                Mail::to($email)->bcc($oculto)->send(new SolicitudAlta($message, $nombre, $solicitud->id, $models->toArray()));
                            if (config('app.env')=="production") {
                                foreach ($models  as $model){
                                    $usuario = User::find($model->id_usuario);
                                    Mail::to($usuario->correo)->bcc($oculto)->send(new SolicitudAlta($message, $nombre, $solicitud->id));
                                }
                            }
                        }
                    }
                    break;
                case 'notificar_auth_rh':
                    $message  = 'Direccion autorizo una solicitud de alta con el id: '.$solicitud->id.' ahora puede entrar a agendar la cita.';
                    if (config('app.env')=="local")
                        Mail::to($email)->bcc($oculto)->send(new AuthDireccion($message, $nombre, $solicitud->id));
                    if (config('app.env')=="production") {
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
                        if (config('app.env')=="production") {
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
                        if (config('app.env')=="production") {
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
                        if (config('app.env')=="production") {
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
                        if (config('app.env')=="production") {
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
                    if (config('app.env')=="production") {
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
