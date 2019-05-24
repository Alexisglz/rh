<?php

namespace App\Http\Controllers;

class FrontController extends Controller
{
    public function contacto(){
        return view('emails.index');
   }
}
