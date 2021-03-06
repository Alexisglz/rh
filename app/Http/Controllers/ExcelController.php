<?php

namespace App\Http\Controllers;

use App\Empleados;
use App\Exports\AjusteSueldoGeneral;
use App\Exports\AltasExport;
use App\Exports\EmpleadosExport;
use App\Exports\IncidenciasExport;
use App\Exports\IncidenciasFinExport;
use App\Exports\IncidenciasLoteExport;
use App\Exports\UsersExport;
use App\Incidencias;
use App\Solicitudes;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class ExcelController extends Controller
{

    /**
     * @var false|string
     */
    private $date;

    public function __construct()
    {
        $this->date = date('d-m-Y H:i:s');
    }

    public function exportIncidencias(Request $request)
    {
        $area = auth()->user()->getRol->Rol;
        $id   = auth()->user()->id_usuario;
        $periodo = isset($request->periodo) ? $request->periodo:0;
        $estatus = isset($request->estatus) ? $request->estatus:'TODAS';
        return Excel::download(new IncidenciasExport($id, $area, $periodo, $estatus), 'Incidencias_'.$this->date.'.xlsx');
    }
    
    public function ExportIncidenciasLote(Request $request)
    {
        $area = auth()->user()->getRol->Rol;
        $id   = auth()->user()->id_usuario;
        return Excel::download(new IncidenciasLoteExport($id, $area), 'Lotes_'.$this->date.'.xlsx');
    }

    public function getIncidencia($id)
    {
        $sol = new Incidencias;
        $sol_temp = $sol::find($id);
        $sol_temp->download_info = 1;
        $sol_temp->save();
        return json_encode($sol_temp, JSON_FORCE_OBJECT);
    }

    public function ExportAltas($inicio, $fin)
    {
        return Excel::download(new AltasExport($inicio, $fin), 'Altas_'.$this->date.'.xlsx');
        return redirect()->back();
    }

    public function ExportEmpleados($inicio, $fin)
    {
        return Excel::download(new EmpleadosExport($inicio, $fin), 'Empleados_'.$this->date.'.xlsx');
    }

    public function ExportIncidenciasFin(Request $request){
        return Excel::download(new IncidenciasFinExport($request->sql),'Incidencias_Finalizadas_'.$this->date.'.xlsx');
    }

    public function getEmpleado($id)
    {
        $sol = new Empleados;
        $sol_temp = $sol::find($id);
        $sol_temp->download_info = 1;
        $sol_temp->save();
        return json_encode($sol_temp, JSON_FORCE_OBJECT);
    }

    public function getSolAltas($id)
    {

        $sol = new Solicitudes;
        $sol_temp = $sol::find($id);
        $sol_temp->descargado = 1;
        $sol_temp->save();
        return json_encode($sol_temp, JSON_FORCE_OBJECT);
    }

    public function ExcelUsuarios()
    {
        return Excel::download(new UsersExport(), 'Usuarios_'.$this->date.'.xlsx');
    }

    public function exportAjustes(Request $request)
    {
        $estatus = isset($request->estatus) ? $request->estatus:'TODAS';
        $inicio  = isset($request->inicio) ? $request->inicio:'';
        $fin     = isset($request->fin) ? $request->fin:'';
        return Excel::download(new AjusteSueldoGeneral($inicio,$fin,$estatus), 'Ajustes_Sueldos_'.$this->date.'.xlsx');
    }
}