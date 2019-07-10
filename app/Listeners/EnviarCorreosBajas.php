<?php

namespace App\Listeners;

use App\Empleados;
use App\Events\BajasEvents;
use App\Mail\ConfirmarHerraBaja;
use App\Mail\NuevaBaja;
use App\Models\VistaSolBajas;
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
                if (config('app.env')=="production") {
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
                $herra = ['baja_rh'];
                $vista = VistaSolBajas::find($solicitud->id);
                if ($vista->adeudo_compu == 'SI' || $vista->adeudo_accesorios == 'SI')
                    $herra[] = 'baja_computo';
                if ($vista->adeudo_celular == 'SI' || $vista->adeudo_lin == 'SI')
                    $herra[] = 'baja_celular';
                if ($vista->adeudo_auto == 'SI')
                    $herra[] = 'baja_coche';
                if ($vista->adeudo_herra == 'SI')
                    $herra[] = 'baja_herramientas';
                $correos = DB::table('vista_permisos_empleados')
                    ->whereIn('codigo', $herra)
                    ->groupBy('id_usuario','codigo')
                    ->get();
                foreach ($correos as $correo){
                    if (config('app.env')!="local")
                        $email = $correo->email;
                    Mail::to($email)->send(new ConfirmarHerraBaja($solicitud, $nombre, $correo->nombre,$correo));
                }
                break;
        }
    }
}
