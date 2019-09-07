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
     * @var null
     */
    private $correos;

    /**
     * Create a new message instance.
     *
     * @param $tipo
     * @param $emp
     * @param $id
     * @param array $correos
     */
    public function __construct($tipo, $emp, $id, $correos = [])
    {
        $this->tipo    = $tipo;
        $this->emp     = $emp;
        $this->id      = $id;
        $this->correos = $correos;
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
            ->with('correos', $this->correos)
            ->with('tipo', $this->tipo);
    }
}
