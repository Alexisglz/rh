<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ListoHerramienta extends Mailable
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
    public function __construct(array $msg, $emp)
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
            ->subject(__('Autorizacion de Alta y Firma'))
            ->markdown('emails.listo_herra')
            ->with('msg', $this->msg)
            ->with('emp', $this->emp);
    }
}
