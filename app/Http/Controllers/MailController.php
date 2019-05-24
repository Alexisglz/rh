<?php

namespace App\Http\Controllers;

use App\GlobalModel;
use Illuminate\Http\Request;
use Mail;
use Redirect;
use Session;


class MailController extends Controller
{


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
// public function store(Request $request)
//     {
//         $user = User::findOrFail(53);
//         Mail::send('emails.contact', $request->all(), function ($msj) use ($user) {
//             $msj->subject('Correo de notificacion: INDEPLO');
//             $msj->from('samguzman1425@outlook.es', 'Auth RH');
//             $msj->to($user->email, $user->name)->subject('Your Reminder!');
//         });
//         Session::flash('message','Mensahe enviado correctamente');
//              return Redirect::to('emails');
//     }


    public function store(Request $request)
    {
    }


    public function citaFirma(Request $request)
    {


        Mail::send('emails.cita_firma', $request->all(), function ($msj) use ($request) {
            $asunto = $request->input('asunto');
            $para = $request->input('para');
            $de = $request->input('de');
            $usuario = $request->input('usuario');


            $msj->subject($asunto);
            $msj->to($para);
            $msj->from($de, $usuario);
        });
        Session::flash('message', 'Mensahe enviado correctamente');
        return Redirect::to('emails');
    }


    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
