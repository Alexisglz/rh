<?php

namespace App\Mail;

use App\SolBajaNomina;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class NuevaBaja extends Mailable
{
    use Queueable, SerializesModels;
    /**
     * @var SolBajaNomina
     */
    public $sol;
    /**
     * @var string|null
     */
    public $emp;

    /**
     * Create a new message instance.
     *
     * @param SolBajaNomina $sol
     * @param string|null $emp
     */
    public function __construct(SolBajaNomina $sol, string $emp = null)
    {
        $this->sol = $sol;
        $this->emp = $emp;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this
            ->subject(__('Solicitud nueva de baja'))
            ->markdown('emails.solicitud_baja')
            ->with('sol', $this->sol)
            ->with('emp', $this->emp);
    }
}
