<?php

namespace App\Http\Controllers;

use App\GlobalModel;
use App\Mail\IncoreMail;
use Illuminate\Http\Request;
use Mail;
use Redirect;
use Session;
use Storage;


class MailController extends Controller
{
    public function emailIncore(Request $request){
        try{
            $body              = $request->body;
            $subject           = $request->subject;
            $from              = $request->from;
            $from_name         = $request->from_name;
            $dest              = $request->dest;
            $dest_copia        = $request->dest_copia;
            $dest_copia_oculta = $request->dest_copia_oculta;
            $urls              = $request->url_adjunto;
            $files             = [];
            if (!empty($urls)){
                foreach ($urls as $url){
                    $file    = $this->saveFile($url);
                    if ($file != false)
                        $files[] = $file;
                }
            }
            Mail::to($dest)->cc($dest_copia)->bcc($dest_copia_oculta)->send(new IncoreMail($body,$subject,$files));
            if (!empty($files)){
                foreach ($files as $file){
                    $this->deleteFile($file);
                }
            }
            return response()->json(true);
        }catch (\Exception $e){
            return response()->json(false);
        }
    }

    public function saveFile($url){
        try{
            $array = explode("/",$url);
            $file  = end($array);
            Storage::disk('public')->put($file, file_get_contents($url));
            return Storage::disk('public')->path($file);
        }catch (\Exception $e){
            return false;
        }
    }

    public function deleteFile($url){
        try{
            $array = explode("/",$url);
            $file  = end($array);
            return Storage::disk('public')->delete($file);
        }catch (\Exception $e){
            return $e->getMessage();
        }
    }
}
