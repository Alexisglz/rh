<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class BajaGerencial extends Mailable
{
    use Queueable, SerializesModels;
    private $empleado;
    private $baja;
    /**
     * @var null
     */
    private $users;

    /**
     * Create a new message instance.
     *
     * @param $empleado
     * @param $baja
     * @param null $users
     */
    public function __construct($empleado, $baja, $users = null)
    {
        $this->empleado = $empleado;
        $this->baja     = $baja;
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
            ->subject(__('Solicitud Baja Gerencial'))
            ->markdown('emails.baja_gerente')
            ->with('empleado', $this->empleado)
            ->with('baja', $this->baja);
    }
}
