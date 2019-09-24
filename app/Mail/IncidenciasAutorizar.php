<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class IncidenciasAutorizar extends Mailable
{
    use Queueable, SerializesModels;
    /**
     * @var string|null
     */
    private $url;
    /**
     * @var string|null
     */
    private $date;
    /**
     * @var null
     */
    private $users;
    /**
     * @var null
     */
    private $periodo;

    /**
     * Create a new message instance.
     *
     * @param string|null $url
     * @param string|null $date
     * @param null $users
     * @param null $periodo
     */
    public function __construct(string $url = null, string $date = null, $users = null, $periodo = null)
    {
        $this->url = $url;
        $this->date = $date;
        $this->users = $users;
        $this->periodo = $periodo;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this
            ->subject(__('Validar Incidencias'))
            ->markdown('emails.auth_inc')
            ->with('url', $this->url)
            ->with('date', $this->date)
            ->with('periodo', $this->periodo)
            ->with('users', $this->users);
    }
}
