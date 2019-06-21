<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class AjusteSueldo extends Mailable
{
    use Queueable, SerializesModels;
    public $url;

    /**
     * Create a new message instance.
     *
     * @param $url
     */
    public function __construct($url)
    {
        $this->url = $url;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this
            ->subject(__('Solicitudes de Cambio de Sueldo'))
            ->markdown('emails.cambio_sueldo')
            ->with('url', $this->url);
    }
}
