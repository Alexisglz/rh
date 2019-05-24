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

    /**
     * Create a new message instance.
     *
     * @param $tipo
     * @param $emp
     */
    public function __construct($tipo, $emp)
    {
        //
        $this->tipo = $tipo;
        $this->emp  = $emp;
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
            ->with('emp', $this->emp)
            ->with('tipo', $this->tipo);
    }
}
