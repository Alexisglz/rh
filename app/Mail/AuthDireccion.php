<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AuthDireccion extends Mailable
{
    use Queueable, SerializesModels;

    protected  $msg;
    protected  $emp;
    protected $id;

    /**
     * Create a new message instance.
     *
     * @param string $msg
     * @param $emp
     * @param $id
     */
    public function __construct(string $msg, $emp,$id)
    {
        $this->msg = $msg;
        $this->emp = $emp;
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
            ->subject(__('Autorizacion de Alta y Firma'))
            ->markdown('emails.auth_direccion')
            ->with('id', $this->id)
            ->with('msg', $this->msg)
            ->with('emp', $this->emp);
    }
}
