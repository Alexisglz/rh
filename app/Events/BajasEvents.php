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
     * Create a new event instance.
     *
     * @param SolBajaNomina $solicitud
     * @param $tipo
     */
    public function __construct(SolBajaNomina $solicitud, $tipo)
    {
        $this->solicitud = $solicitud;
        $this->tipo     = $tipo;
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
