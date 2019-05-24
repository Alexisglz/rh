<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AuthRH extends Mailable
{
    use Queueable, SerializesModels;

    protected  $msg;
    protected  $emp;
    /**
     * Create a new message instance.
     *
     * @param $msg
     * @param $emp
     */
    public function __construct($msg, $emp)
    {
        $this->msg = $msg;
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
            ->subject(__('Asignacion de equipo'))
            ->markdown('emails.auth_rh')
            ->with('msg', $this->msg)
            ->with('emp', $this->emp);
    }
}
