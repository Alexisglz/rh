<?php

namespace App\Listeners;

use App\Events\SueldosEvents;
use App\Mail\AjusteSueldo;
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
