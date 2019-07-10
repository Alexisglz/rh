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
    public $user;

    /**
     * Create a new message instance.
     *
     * @param SolBajaNomina $sol
     * @param $emp
     * @param $tipo
     * @param null $user
     */
    public function __construct(SolBajaNomina $sol, $emp, $tipo, $user = null)
    {
        $this->sol  = $sol;
        $this->emp  = $emp;
        $this->tipo = $tipo;
        $this->user = $user;
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
            ->with('emp', $this->emp)
            ->with('user', $this->user);
    }
}
