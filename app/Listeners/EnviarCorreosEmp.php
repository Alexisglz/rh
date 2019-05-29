<?php

namespace App\Listeners;

use App\Events\EmpleadosEvents;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class EnviarCorreosEmp implements ShouldQueue
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
     * @param  EmpleadosEvents  $event
     * @return void
     */
    public function handle(EmpleadosEvents $event)
    {
        $empleado = $event->empleado;
        $tipo     = $event->tipo;
    }
}
