<?php

namespace App\Events;

use App\Empleados;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class BajasEvents
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    /**
     * @var Empleados
     */
    public $empleado;
    public $tipo;

    /**
     * Create a new event instance.
     *
     * @param Empleados $empleado
     * @param $tipo
     */
    public function __construct(Empleados $empleado, $tipo)
    {
        $this->empleado = $empleado;
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
