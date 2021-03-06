<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class AuthCancelInci extends Mailable
{
    use Queueable, SerializesModels;
    private $tipo;
    private $msg;
    private $emp;
    private $id;

    /**
     * Create a new message instance.
     *
     * @param $tipo
     * @param $msg
     * @param $emp
     * @param $id
     */
    public function __construct($tipo,$msg,$emp,$id)
    {
        $this->tipo = $tipo;
        $this->msg  = $msg;
        $this->emp  = $emp;
        $this->id   = $id;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $subject = "";
        if ($this->tipo == "APROBADA")
            $subject = "Incidencia Aprobada";
        else
            $subject = "Incidencia No Aprobada";
        return $this
            ->subject($subject)
            ->markdown('emails.auth_cancel_inci')
            ->with('id', $this->id)
            ->with('msg', $this->msg)
            ->with('estatus', $this->tipo)
            ->with('emp', $this->emp);
    }
}
