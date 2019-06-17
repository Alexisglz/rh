<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class NuevaIncidencia extends Mailable
{
    use Queueable, SerializesModels;

    protected $tipo;
    protected $emp;
    protected $id;

    /**
     * Create a new message instance.
     *
     * @param $tipo
     * @param $emp
     * @param $id
     */
    public function __construct($tipo, $emp, $id)
    {
        $this->tipo = $tipo;
        $this->emp  = $emp;
        $this->id = $id;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this
            ->subject(__('Nueva incidencia'))
            ->markdown('emails.nueva_inci')
            ->with('id', $this->id)
            ->with('emp', $this->emp)
            ->with('tipo', $this->tipo);
    }
}
