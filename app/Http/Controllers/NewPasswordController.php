<?php

namespace App\Http\Controllers;

use App\User;
use Auth;
use DB;
use Illuminate\Http\Request;

class NewPasswordController extends Controller
{

    public function index(Request $request){
        if (isset(auth()->user()->id_usuario))
            return redirect()->route('altas.index');
        if (isset($request->id)){
            return view('nuevo_password.reset',['id' => $request->id]);
        }
        else
            return redirect('/login');
    }

    public function update(Request $request){
        $conn = DB::connection('incore');
        try{
            $conn->beginTransaction();
            $user            = User::find($request->id);
            $user->password  = md5($request->password);
            $user->password2 = bcrypt($request->password);
            $user->pwdcgd    = 1;
            $user->save();
            $conn->commit();
            if (Auth::attempt(['usuario'=>$user->usuario, 'password' =>$request->password]) == true)
            {
                return redirect()->route('altas.index');
            }
            else
                return redirect('/login')->with('success','Contraseña Actualizada Correctamente');
        }catch (\Exception $e){
            $conn->rollBack();
            dd($e);
            return back()->with('error',$e->getMessage());
        }
    }
}
