<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SolicitudAlta extends Mailable
{
    use Queueable, SerializesModels;

    protected $msg;
    protected $emp;
    protected $id;
    protected $users;

    /**
     * Create a new message instance.
     *
     * @param $msg
     * @param $emp
     * @param $id
     * @param array $users
     */
    public function __construct($msg, $emp, $id, $users = [])
    {
        $this->msg   = $msg;
        $this->emp   = $emp;
        $this->id    = $id;
        $this->users = $users;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this
            ->subject(__('Solicitud de Alta'))
            ->markdown('emails.solicitud_alta')
            ->with('id', $this->id)
            ->with('msg', $this->msg)
            ->with('emp', $this->emp)
            ->with('users', $this->users);
    }
}
