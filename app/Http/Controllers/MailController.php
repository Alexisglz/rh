<?php

namespace App\Http\Controllers;

use App\GlobalModel;
use App\Mail\IncoreMail;
use Illuminate\Http\Request;
use Mail;
use Redirect;
use Session;


class MailController extends Controller
{
    public function emailIncore(Request $request){
        $body              = $request->body;
        $subject           = $request->subject;
        $from              = $request->from;
        $from_name         = $request->from_name;
        $dest              = $request->dest;
        $dest_copia        = $request->dest_copia;
        $dest_copia_oculta = $request->dest_copia_oculta;
        $url_adjunto       = $request->url_adjunto;
        //dd($dest);
        foreach ($dest as $item){
            Mail::to($item)->cc($dest_copia)->bcc($dest_copia_oculta)->send(new IncoreMail($body,$subject));
        }
        return response()->json(true);
    }
}
