<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class CancelBaja extends Mailable
{
    use Queueable, SerializesModels;
    private $empleado;
    /**
     * @var null
     */
    private $users;

    /**
     * Create a new message instance.
     *
     * @param $empleado
     * @param null $users
     */
    public function __construct($empleado,$users = null)
    {
        $this->empleado = $empleado;
        $this->users    = $users;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this
            ->subject(__('Solicitud de Baja Cancelada'))
            ->markdown('emails.cancel_baja')
            ->with('empleado', $this->empleado)
            ->with('users', $this->users);
    }
}
