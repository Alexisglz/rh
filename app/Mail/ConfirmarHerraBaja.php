<?php

namespace App\Mail;

use App\SolBajaNomina;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ConfirmarHerraBaja extends Mailable
{
    use Queueable, SerializesModels;
    /**
     * @var SolBajaNomina
     */
    public $sol;
    public $emp;
    public $tipo;

    /**
     * Create a new message instance.
     *
     * @param SolBajaNomina $sol
     * @param $emp
     * @param $tipo
     */
    public function __construct(SolBajaNomina $sol, $emp, $tipo)
    {
        $this->sol  = $sol;
        $this->emp  = $emp;
        $this->tipo = $tipo;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this
            ->subject(__('Confirmar Baja de Herramientas'))
            ->markdown('emails.baja_herra')
            ->with('sol', $this->sol)
            ->with('tipo', $this->tipo)
            ->with('emp', $this->emp);
    }
}
