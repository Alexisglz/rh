<?php

namespace App\Listeners;

use App\Events\IncidenciasNotificar;
use App\Mail\IncidenciasAutorizar;
use App\Models\IncidenciaPeriodo;
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
            $periodo = IncidenciaPeriodo::where('fecha_inicio','<=', $this->date)
                ->where('fecha_fin','>=', $this->date)->first();
            $fecha_inicio = $periodo->fecha_inicio;
            $fecha_fin    = $periodo->fecha_fin;
            $fecha_envio  = $periodo->fecha_envio;
            $email        = config('app.mail_dev');
            $oculto       = config('app.mail_dev');
            switch ($tipo){
                case 'auth':
                    $correos = DB::table('vista_permisos_empleados')
                        ->whereIn('codigo', $perms)
                        ->groupBy('id_usuario')
                        ->get();
                    if (config('app.env')=="local")
                        Mail::to($email)->bcc($oculto)->send(new IncidenciasAutorizar('/auth',$fecha_envio,$correos->toArray(),$periodo->periodo_nombre));
                    if (config('app.env')=="production") {
                        foreach ($correos  as $correo){
                            Mail::to($correo->email)->bcc($oculto)->send(new IncidenciasAutorizar('/auth',$fecha_envio,$correos->toArray(),$periodo->periodo_nombre));
                        }
                    }
                    break;
                case 'envio':
                    break;
            }
        }catch (\Exception $e){
            echo $e->getMessage();
        }
    }
}
