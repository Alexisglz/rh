<?php

namespace App\Http\Controllers;

use App\Classes\AsignacionEmpleado;
use App\GlobalModel;
use DB;
use Illuminate\Http\Request;
use Storage;


class AsignacionHerramientasController extends Controller
{
    protected $rules = [
        'grupo'=>['required']
    ];

    public function index()
    {
        return view('asignaciones.index');
    }

    public function getComputo(Request $request){
        $computo = AsignacionEmpleado::computoEmpleado($request->id);
        return response()->json([
            "ok"    => true,
            "data"  => $computo
        ]);
    }

    public function getCelularesLineas(Request $request){
        $array = AsignacionEmpleado::celularesLineasEmpleado($request->id);
        return response()->json([
            "ok"        => true,
            "celulares" => $array["celulares"],
            "lineas"    => $array["lineas"]
        ]);
    }

    public function getAutos(Request $request){
        $autos = AsignacionEmpleado::autosEmpleado($request->id);
        return response()->json([
            'ok'   => true,
            'data' => $autos
        ]);
    }
    public function getHerramientas(Request $request){
        $herramientas = AsignacionEmpleado::HerramientasEmpleado($request->id);
        return response()->json([
            'ok'   => true,
            'data' => $herramientas
        ]);
    }
}
