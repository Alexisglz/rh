<?php

namespace App\Listeners;

use App\Empleados;
use App\Events\IncidenciasEvents;
use App\Mail\NuevaIncidencia;
use App\Models\IncidenciasCatalogo;
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
            $inc_tipo       = IncidenciasCatalogo::find($incidencia->id_incidencia_tipo);
            $empleado   = Empleados::find($incidencia->id_empleado);
            $tipo       = $event->tipo;
            $nombre     = $empleado->empleado_nombre.' '.$empleado->empleado_apaterno.' '.$empleado->empleado_amaterno;
            $email      = config('app.mail_dev');
            switch ($tipo){
                case 'noti_deduc':
                    if (config('app.env')=="local")
                        Mail::to($email)->send(new NuevaIncidencia($inc_tipo, $nombre));
                    else {
                        $correos = DB::table('vista_permisos_empleados')
                            ->where('codigo', '=','aut_cancel_inci_dec')
                            ->groupBy('id_usuario')
                            ->get();
                        foreach ($correos as $correo){
                            Mail::to($correo->email)->send(new NuevaIncidencia($inc_tipo, $nombre));
                        }
                    }
                    break;
                case 'noti_cv':
                    if (config('app.env')=="local")
                        Mail::to($email)->send(new NuevaIncidencia($inc_tipo, $nombre));
                    else {
                        $correos = DB::table('vista_permisos_empleados')
                            ->where('codigo', '=','aut_cancel_inci_c_v')
                            ->groupBy('id_usuario')
                            ->get();
                        foreach ($correos as $correo){
                            Mail::to($correo->email)->send(new NuevaIncidencia($inc_tipo, $nombre));
                        }
                    }
                    break;
                case 'noti_sv':
                    if (config('app.env')=="local")
                        Mail::to($email)->send(new NuevaIncidencia($inc_tipo, $nombre));
                    else {
                        $correos = DB::table('vista_permisos_empleados')
                            ->where('codigo', '=','aut_cancel_inci_s_v')
                            ->groupBy('id_usuario')
                            ->get();
                        foreach ($correos as $correo){
                            Mail::to($correo->email)->send(new NuevaIncidencia($inc_tipo, $nombre));
                        }
                    }
                    break;
            }
        }catch (Exception $e){
            dd($e);
        }
    }
}
