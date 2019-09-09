<?php

namespace App\Listeners;

use App\Empleados;
use App\Events\BajasEvents;
use App\Mail\BajaGerencial;
use App\Mail\CancelBaja;
use App\Mail\ConfirmarHerraBaja;
use App\Mail\NuevaBaja;
use App\Models\VistaEmpleadosActivos;
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
        $vista_em  = VistaEmpleadosActivos::find($solicitud->id_empleado);
        $nombre    = $empleado->empleado_nombre.' '.$empleado->empleado_apaterno.' '.$empleado->empleado_amaterno;
        $email     = config('app.mail_dev');
        $puestos_gerentes    = ['33','36','228','229','230','231','232','233','234','235','236','237','238','239',
                                '34','44','47','48','51','205','206','207','208','209','210','211','212','213','214','386','569'
                                ];// ID catalogo puesto Gerentes
        switch ($tipo){
            case 'nueva_baja':
                if (in_array($vista_em->id_puesto,$puestos_gerentes) == true){
                    if (config('app.env')=="local")
                        Mail::to($email)->send(new BajaGerencial($vista_em, $solicitud));
                    if (config('app.env')=="production")
                        Mail::to('javier.martinez1@indeplo.com')->send(new BajaGerencial($vista_em, $solicitud));
                }
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
            case 'baja_gerencial':
                break;
            case 'cancel_baja':
                $empleado_nombre = $empleado->empleado_nombre.' '.$empleado->empleado_apaterno.' '.$empleado->empleado_amaterno;
                if (config('app.env')=="local"){
                    Mail::to($email)->send(new CancelBaja($empleado_nombre,$event->correos));
                }
                if (config('app.env')=="production") {
                    foreach ($event->correos as $correo){
                        Mail::to($correo)->send(new CancelBaja($empleado_nombre));
                    }
                }
                break;
        }
    }
}
