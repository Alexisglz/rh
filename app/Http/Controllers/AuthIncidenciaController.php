<?php

namespace App\Http\Controllers;

use App\Models\IncidenciaPeriodo;
use App\VistaIncidenciasSinLote;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class AuthIncidenciaController extends Controller
{

    public function __construct()
    {
        $this->date = date('Y-m-d H:i:s');
    }

    public function index(){
        return view('incidencias.validaciones.directivo');
    }

    public function getIncidencias(){
        $user    = auth()->user();
        $area    = $user->getRol->Rol;
        $inc_c_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_c_v'])? 1:0;
        $inc_s_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_s_v'])? 1:0;
        $inc_ded = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_dec'])? 1:0;
        $periodo = IncidenciaPeriodo::where('fecha_inicio','<=', $this->date)
            ->where('fecha_fin','>=', $this->date)->first();
        $incidencias = VistaIncidenciasSinLote::query();
        if($area == 'ADMIN' || $area == 'ESP'){
        }
        else{
            if ($inc_s_v == 1)
                $incidencias->orWhere('venta','=',0)->where('tipo_incidencia', '!=','DEDUCCION');
            if ($inc_c_v == 1)
                $incidencias->orWhere('venta','>',0)->where('tipo_incidencia', '!=','DEDUCCION');
            if ($inc_ded == 1)
                $incidencias->orWhere('tipo_incidencia','=','DEDUCCION');
        }
        if($periodo)
            $incidencias->whereBetween('fecha_solicitud',[$periodo->fecha_inicio, $periodo->fecha_fin])->get();
        else
            $incidencias = [];
        return DataTables::of($incidencias)->make(true);
    }

    public function validarMasivo(Request $request){
        dd($request);
    }
}
