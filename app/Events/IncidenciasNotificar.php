<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class IncidenciasNotificar
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    public $tipo;
    /**
     * @var array
     */
    public $perms;

    /**
     * Create a new event instance.
     *
     * @param $tipo
     * @param array $perms
     */
    public function __construct($tipo, array $perms = [])
    {
        $this->tipo  = $tipo;
        $this->perms = $perms;
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
