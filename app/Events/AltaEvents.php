<?php

namespace App\Events;

use App\Solicitudes;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class AltaEvents
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    /**
     * @var Solicitudes
     */
    public $solicitud;
    /**
     * @var string
     */
    public $tipo;
    /**
     * @var string
     */
    public $herramienta;

    /**
     * Create a new event instance.
     *
     * @param Solicitudes $solicitud
     * @param string $tipo
     * @param string $herramienta
     */
    public function __construct(Solicitudes $solicitud, string $tipo, string $herramienta = null)
    {
        $this->solicitud = $solicitud;
        $this->tipo      = $tipo;
        $this->herramienta = $herramienta;
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
