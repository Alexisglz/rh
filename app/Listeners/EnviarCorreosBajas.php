<?php

namespace App\Listeners;

use App\Events\BajasEvents;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

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
        $empleado = $event->empleado;
        $tipo     = $event->tipo;
    }
}
