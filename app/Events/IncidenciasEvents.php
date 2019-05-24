<?php

namespace App\Events;

use App\Incidencias;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class IncidenciasEvents
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    /**
     * @var Incidencias
     */
    public $incidencia;
    /**
     * @var string
     */
    public $tipo;

    /**
     * Create a new event instance.
     *
     * @param Incidencias $incidencia
     * @param string $tipo
     */
    public function __construct(Incidencias $incidencia, string $tipo)
    {
        $this->incidencia = $incidencia;
        $this->tipo = $tipo;
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
