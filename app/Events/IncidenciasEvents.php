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
     * @var string
     */
    public $correos;

    /**
     * Create a new event instance.
     *
     * @param Incidencias $incidencia
     * @param string $tipo
     * @param array $correos
     */
    public function __construct(Incidencias $incidencia, string $tipo, array $correos = [])
    {
        $this->incidencia = $incidencia;
        $this->tipo       = $tipo;
        $this->correos    = $correos;
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
