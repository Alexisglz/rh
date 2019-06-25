<?php

namespace App\Listeners;

use App\Events\SueldosEvents;
use App\Mail\AjusteSueldo;
use App\Mail\AuthAjuste;
use DB;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Mail;

class EnviarCorreosSueldos implements ShouldQueue
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
     * @param  SueldosEvents  $event
     * @return void
     */
    public function handle(SueldosEvents $event)
    {
        try{
            $doc        = $event->doc;
            $tipo       = $event->tipo;
            $email      = config('app.mail_dev');
            $oculto     = config('app.mail_dev');
            switch ($tipo){
                case 'auth_ajuste':
                    $ajuste = \App\Models\AjusteSueldo::from('ajustes_sueldos AS as')
                        ->select(DB::raw("as.id,CONCAT(emp.empleado_nombre,' ',emp.empleado_apaterno,' ',emp.empleado_amaterno) AS empleado,emp.empleado_num,
                         as.tradicional, as.asimilado,pi.id AS id_pedido,pi.pedido,pi.monto_venta"))
                        ->join('incore.proyectos_indeplo AS pi',DB::raw('pi.id'),'=',DB::raw('as.ro'))
                        ->join('incore.empleados AS emp',DB::raw('emp.empleado_id'),'=',DB::raw('as.id_empleado'))
                        ->where(DB::raw('as.id'),'=',$event->id)
                        ->first();
                    if (config('app.env')=="local")
                        Mail::to($email)->bcc($oculto)->send(new AuthAjuste($ajuste));
                    else{
                        $correos = DB::table('vista_permisos_empleados')
                            ->where('codigo', '=','validar_ajuste_s')
                            ->groupBy('id_usuario')
                            ->get();
                        foreach ($correos as $correo){
                            Mail::to($correo->email)->bcc($oculto)->send(new AuthAjuste($ajuste));
                        }
                    }
                    break;
                case 'envio_ajustes':
                    if (config('app.env')=="local")
                        Mail::to($email)->bcc($oculto)->send(new AjusteSueldo($doc));
                    if (config('app.env')=="production") {
                        $correos = DB::table('vista_permisos_empleados')
                            ->whereIn('area', ['ENTR','ESP','ADMIN'])
                            ->groupBy('id_usuario')
                            ->get();
                        foreach ($correos as $correo){
                            Mail::to($correo->email)->bcc($oculto)->send(new AjusteSueldo($doc));
                        }
                    }
                    break;
            }
        }catch (\Exception $e){
            dd($e);
        }
    }
}
