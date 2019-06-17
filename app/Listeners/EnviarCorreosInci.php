<?php

namespace App\Listeners;

use App\Empleados;
use App\Events\IncidenciasEvents;
use App\Mail\AuthCancelInci;
use App\Mail\NuevaIncidencia;
use App\Models\IncidenciasCatalogo;
use App\User;
use DB;
use Exception;
use Illuminate\Contracts\Queue\ShouldQueue;
use Mail;

class EnviarCorreosInci Implements ShouldQueue
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
     * @param  IncidenciasEvents  $event
     * @return void
     */
    public function handle(IncidenciasEvents $event)
    {
        try{
            $incidencia = $event->incidencia;
            $inc_tipo   = IncidenciasCatalogo::find($incidencia->id_incidencia_tipo);
            $empleado   = Empleados::find($incidencia->id_empleado);
            $tipo       = $event->tipo;
            $nombre     = $empleado->empleado_nombre.' '.$empleado->empleado_apaterno.' '.$empleado->empleado_amaterno;
            $email      = config('app.mail_dev');
            $oculto     = config('app.mail_dev');
            switch ($tipo){
                case 'noti_deduc':
                    if (config('app.env')=="local")
                        Mail::to($email)->send(new NuevaIncidencia($inc_tipo, $nombre, $incidencia->id));
                    if (config('app.env')=="production") {
                        if ($incidencia->area_solicitante = 'ESP'){
                            $correos = DB::table('vista_permisos_empleados')
                                ->where('codigo', '=','aut_cancel_inci_dec')
                                ->whereIn('area', ['ESP','ADMIN'])
                                ->groupBy('id_usuario')
                                ->get();
                        }
                        else{
                            $correos = DB::table('vista_permisos_empleados')
                                ->where('codigo', '=','aut_cancel_inci_dec')
                                ->where('area', '<>','ESP')
                                ->groupBy('id_usuario')
                                ->get();
                        }
                        foreach ($correos as $correo){
                            Mail::to($correo->email)->bcc($oculto)->send(new NuevaIncidencia($inc_tipo, $nombre, $incidencia->id));
                        }
                    }
                    break;
                case 'noti_cv':
                    if (config('app.env')=="local")
                        Mail::to($email)->send(new NuevaIncidencia($inc_tipo, $nombre, $incidencia->id));
                    if (config('app.env')=="production") {
                        if ($incidencia->area_solicitante = 'ESP'){
                            $correos = DB::table('vista_permisos_empleados')
                                ->where('codigo', '=','aut_cancel_inci_c_v')
                                ->whereIn('area', ['ESP','ADMIN'])
                                ->groupBy('id_usuario')
                                ->get();
                        }
                        else{
                            $correos = DB::table('vista_permisos_empleados')
                                ->where('codigo', '=','aut_cancel_inci_c_v')
                                ->where('area', '<>','ESP')
                                ->groupBy('id_usuario')
                                ->get();
                        }
                        foreach ($correos as $correo){
                            Mail::to($correo->email)->bcc($oculto)->send(new NuevaIncidencia($inc_tipo, $nombre, $incidencia->id));
                        }
                    }
                    break;
                case 'noti_sv':
                    if (config('app.env')=="local")
                        Mail::to($email)->send(new NuevaIncidencia($inc_tipo, $nombre, $incidencia->id));
                    if (config('app.env')=="production") {
                        if ($incidencia->area_solicitante = 'ESP'){
                            $correos = DB::table('vista_permisos_empleados')
                                ->where('codigo', '=','aut_cancel_inci_s_v')
                                ->whereIn('area', ['ESP','ADMIN'])
                                ->groupBy('id_usuario')
                                ->get();
                        }
                        else{
                            $correos = DB::table('vista_permisos_empleados')
                                ->where('codigo', '=','aut_cancel_inci_s_v')
                                ->where('area', '<>','ESP')
                                ->groupBy('id_usuario')
                                ->get();
                        }
                        foreach ($correos as $correo){
                            Mail::to($correo->email)->bcc($oculto)->send(new NuevaIncidencia($inc_tipo, $nombre, $incidencia->id));
                        }
                    }
                    break;
                case 'autorizar':
                    $msg = "La incidencias con el id: ".$incidencia->id." de tipo: ".$inc_tipo->alias;
                    if (config('app.env')=="local")
                        Mail::to($email)->send(new AuthCancelInci("APROBADA", $msg, $nombre, $incidencia->id));
                    if (config('app.env')=="production") {
                        $solicitante = User::find($incidencia->id_solicitante);
                        if ($solicitante->correo != null)
                            $email = $solicitante->correo;
                        Mail::to($email)->send(new AuthCancelInci("APROBADA", $msg, $nombre, $incidencia->id));
                    }
                    break;
                case 'cancelar':
                    $msg = "La incidencias con el id: ".$incidencia->id." de tipo: ".$inc_tipo->alias;
                    if (config('app.env')=="local")
                        Mail::to($email)->send(new AuthCancelInci("RECHAZADA", $msg, $nombre, $incidencia->id));
                    if (config('app.env')=="production") {
                        $solicitante = User::find($incidencia->id_solicitante);
                        if ($solicitante->correo != null)
                            $email = $solicitante->correo;
                        Mail::to($email)->send(new AuthCancelInci("RECHAZADA", $msg, $nombre, $incidencia->id));
                    }
                    break;
            }
        }catch (Exception $e){
            dd($e);
        }
    }
}
