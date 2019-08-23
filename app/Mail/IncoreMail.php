<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class IncoreMail extends Mailable
{
    use Queueable, SerializesModels;
    private $body,$subject_incore;
    private $file;

    /**
     * Create a new message instance.
     *
     * @param $body
     * @param $subject_incore
     * @param $file
     */
    public function __construct($body, $subject_incore, $file = null)
    {
        $this->body            = $body;
        $this->subject_incore  = $subject_incore;
        $this->file            = $file;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this
            ->subject(__($this->subject_incore))
            //->attach($this->file)
            ->html($this->body);
            //->from('Viaticos')
            //->markdown('emails.email_incore')
            //->with('body', $this->body);
    }
}
