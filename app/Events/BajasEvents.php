<?php

namespace App\Events;

use App\Empleados;
use App\SolBajaNomina;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class BajasEvents
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    /**
     * @var Empleados
     */
    public $solicitud;
    public $tipo;
    /**
     * @var array
     */
    public $correos;

    /**
     * Create a new event instance.
     *
     * @param SolBajaNomina $solicitud
     * @param $tipo
     * @param array $correos
     */
    public function __construct(SolBajaNomina $solicitud, $tipo, $correos = [])
    {
        $this->solicitud = $solicitud;
        $this->tipo      = $tipo;
        $this->correos   = $correos;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('channel-name');
    }
}
