<?php

namespace App\Http\Controllers;

use App\Empleados;
use App\Models\AjusteSueldo;
use DB;
use Illuminate\Http\Request;

class AjustesController extends Controller
{
    public function index(){
        return view('ajustes.index');
    }

    public function save(Request $request){
        try{
            DB::beginTransaction();
            $empleado              = Empleados::find($request->id);
            $ajuste                = new AjusteSueldo();
            $ajuste->id_empleado   = $empleado->empleado_id;
            $ajuste->num_empleado  = $empleado->empleado_num;
            $ajuste->tradicional   = $request->tradicional;
            $ajuste->asimilado     = $request->asimilado;
            $ajuste->observaciones = $request->observaciones;
            $ajuste->save();
            DB::commit();
            return response()->json([
                'ok' => true,
                'data' => $empleado
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return response()->json([
                'ok' => false,
                'data' => $e->getMessage()
            ]);
        }
    }
}
