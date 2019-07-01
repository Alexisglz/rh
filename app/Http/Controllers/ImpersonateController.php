<?php

namespace App\Http\Controllers;

use App\User;
use Auth;
use DB;
use Exception;
use Illuminate\Http\Request;

class ImpersonateController extends Controller
{
    public function getUsers(Request $request){
        try{
            $busqueda  = $request->term;
            $usuarios = User::query();
            $usuario   = auth()->user();
            if ($usuario->listarTodo == null){
                if ($usuario->getCoordinador){
                    $this->recursivoEmpleados($usuario->id_usuario);
                    $emps = array_values(array_unique($this->array));
                    $usuarios->whereIn('empleado_id', $emps);
                }
            }
            $usuarios->select(DB::raw("CONCAT(usuario,'-',nombre,' ',apellido) AS Nombre, id_usuario as id"));
            $usuarios->where(DB::raw("CONCAT(nombre,apellido,usuario)"), 'LIKE', '%'.$busqueda.'%');
            $usuarios->where('estatus','=','ACTIVO');
            $users = $usuarios->get();
            $data  = array();

            foreach ($users as $user) {
                $data[] = array('value' => $user->Nombre, 'id' => $user->id);
            }
            return response()->json($data);
        }catch (Exception $e){
            return [];
        }
    }
    public function impersonate(Request $request)
    {
        $user = User::find($request->id_ver_user);
        Auth::user()->setImpersonating($user->id_usuario);
        $msg = 'Ingreso como '.strtoupper($user->usuario).' correctamente!';
        return redirect()->back()->with('success',$msg);
    }

    public function stopImpersonate()
    {
        Auth::user()->stopImpersonating();
        return redirect()->back()->with('success','Bienvenido de vuelta');
    }
}
