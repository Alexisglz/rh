<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class SueldosEvents
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    public $doc;
    public $tipo;
    public $id;

    /**
     * Create a new event instance.
     *
     * @param null $doc
     * @param $tipo
     * @param null $id
     */
    public function __construct($doc = null, $tipo, $id = null)
    {
        $this->doc = $doc;
        $this->tipo = $tipo;
        $this->id = $id;
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
