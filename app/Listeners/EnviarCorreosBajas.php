<?php

namespace App\Listeners;

use App\Empleados;
use App\Events\BajasEvents;
use App\Mail\ConfirmarHerraBaja;
use App\Mail\NuevaBaja;
use DB;
use Illuminate\Contracts\Queue\ShouldQueue;
use Mail;

class EnviarCorreosBajas implements ShouldQueue
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
     * @param  BajasEvents  $event
     * @return void
     */
    public function handle(BajasEvents $event)
    {
        $solicitud = $event->solicitud;
        $tipo      = $event->tipo;
        $empleado  = Empleados::find($solicitud->id_empleado);
        $nombre    = $empleado->empleado_nombre.' '.$empleado->empleado_apaterno.' '.$empleado->empleado_amaterno;
        $email     = config('app.mail_dev');
        switch ($tipo){
            case 'nueva_baja':
                if (config('app.env')=="local")
                    Mail::to($email)->send(new NuevaBaja($solicitud, $nombre));
                else{
                    $correos = DB::table('vista_permisos_empleados')
                        ->where('codigo', '=','cita_baja')
                        ->groupBy('id_usuario')
                        ->get();
                    foreach ($correos as $correo){
                        Mail::to($correo->email)->send(new NuevaBaja($solicitud, $nombre));
                    }
                }
                break;
            case 'confirmar_herra':
                $herra = ['baja_computo','baja_coche','baja_celular','baja_herramientas','baja_rh'];
                $correos = DB::table('vista_permisos_empleados')
                    ->whereIn('codigo', $herra)
                    ->groupBy('id_usuario','codigo')
                    ->get();
                foreach ($correos as $correo){
                    if (config('app.env')!="local")
                        $email = $correo->email;
                    Mail::to($email)->send(new ConfirmarHerraBaja($solicitud, $nombre, $correo->nombre));
                }
                break;
        }
    }
}
