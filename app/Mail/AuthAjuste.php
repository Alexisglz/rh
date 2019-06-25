<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class AuthAjuste extends Mailable
{
    use Queueable, SerializesModels;
    private $ajuste;

    /**
     * Create a new message instance.
     *
     * @param $ajuste
     */
    public function __construct($ajuste)
    {
        $this->ajuste = $ajuste;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject(__('Solicitud para Ajuste de Sueldo'))
        ->markdown('emails.nueva_solicitud')
        ->with('ajuste', $this->ajuste);
    }
}
