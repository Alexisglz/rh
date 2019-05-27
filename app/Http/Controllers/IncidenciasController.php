<?php

namespace App\Http\Controllers;

use App\Empleados;
use App\Events\IncidenciasEvents;
use App\GlobalModel;
use App\Helpers\Upload;
use App\Incidencias;
use App\Models\IncidenciasCatalogo;
use App\Models\ProyectosIndeplo;
use App\Models\ProyectosIndeploRecurso;
use App\User;
use DateTime;
use DB;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;

class IncidenciasController extends Controller
{

    public $array;
    /** Funcion recursiva para obtener el arbol de empleados
     * @param int $id
     * @return bool
     */
    public function recursivoEmpleados(int $id){
        if ($id == null)
            return true;
        else{
            $usuario  = User::find($id);
            if ($usuario->getCoordinador){
                $movs = $usuario->getCoordinador->getMovimientos;
                foreach ($movs as $item){
                    if ($item->getEmpleado->empleado_id == null)
                        continue;
                    $this->array[] = $item->getEmpleado->empleado_id;
                    $user          = User::where('empleado_id', '=', $item->empleado_id)->first();
                    $this->recursivoEmpleados($user->id_usuario);
                }
            }
            else{
                return true;
            }
        }
    }

    public function index()
    {
        $this->authorize('access',[User::class, 'listado_incidencias']);
        return view('incidencias.index');
    }

    public function Eliminar(Request $request)
    {
        return "<>";
    }

    public function create()
    {
        $this->authorize('access',[User::class, 'crear_incidencias']);
        $tipos = IncidenciasCatalogo::where('estatus', '=', 'ACTIVO')
            ->get();
        return view('incidencias.create', ['tipos' => $tipos]);
    }

    public function store(Request $request)
    {
        $this->authorize('access',[User::class, 'crear_incidencias']);
        try{
            DB::beginTransaction();
            $user = User::find(auth()->user()->id_usuario);
            $hoy  = date('d');
            if ($hoy <= 13) {
                $fecha_max = date('Y-m-13');
                $fecha_min = date('Y-m-29', strtotime('-1 month', time()));
            } else {
                $fecha_min = date('Y-m-14');
                $fecha_max = date('Y-m-28');
            }
            switch ($request->tratamiento) {
                case 'LAPSO':
                    $reglas = [
                        'vobo'        => 'required',
                        'id_empleado' => 'required',
                        'tipo'        => 'required',
                        'motivo'      => 'required|max:255',
                        'fecha_i'     => "required|after_or_equal:$fecha_min|before_or_equal:$fecha_max",
                        'dias'        => 'required|integer|min:1'
                    ];
                    break;
                case 'MONTO':
                    $reglas = [
                        'vobo'        => 'required',
                        'id_empleado' => 'required',
                        'tipo'        => 'required',
                        'motivo'      => 'required|max:255',
                        'monto'       => 'required|numeric|min:0'
                    ];
                    break;
                case 'DIAS':
                    $reglas = [
                        'vobo'        => 'required',
                        'id_empleado' => 'required',
                        'tipo'        => 'required',
                        'motivo'      => 'required|max:255',
                        'dias'        => 'required|integer|min:1'
                    ];
                    break;

                default:
                    $reglas = [
                        'tratamiento' => 'required',
                    ];
                    break;
            }
            $validator = Validator::make($request->all(), $reglas);
            if ($validator->fails()){
                return back()->with([
                    'errors' => $validator->messages()->all()
                ]);
            }
            $incidencia = new Incidencias;
            $empleado = Empleados::find($request->id_empleado);
            $tipo_incidencia = IncidenciasCatalogo::find($request->incidencia);
            switch ($tipo_incidencia->tratamiento) {
                case 'LAPSO':
                    $incidencia->fecha_inicio = $request->fecha_i;
                    $incidencia->dias         = $request->dias;
                    break;
                case 'MONTO':
                    $incidencia->monto        = $request->monto;
                    break;
                case 'DIAS':
                    $incidencia->dias         = $request->dias;

                    /*$f1 = new DateTime($request->fecha_i); // Calculo de monto en base a fechas
                    $f2 = new DateTime($request->fecha_f);
                    $dias = $f1->diff($f2);
                    $total_dias = $dias->d+1; // Obtener dias en base a las fechas sumarle un dia para compensar el primer dia
                                              // que el formulario omite
                    $incidencia->dias = $total_dias;
                    if ($empleado->getMovimientoSueldo){ //buscar el sueldo del empleado
                        $sueldo_diario = $empleado->getMovimientoSueldo->sueldo_diario;
                        $total = $sueldo_diario * $total_dias;
                        $incidencia->monto        = $total;
                    }*/
                    break;
                default:
                    break;
            }
            $incidencia->id_empleado        = $request->id_empleado;
            $incidencia->id_incidencia_tipo = $request->incidencia;
            $incidencia->fecha_solicitud    = date('Y-m-d');
            $incidencia->id_solicitante     = auth()->user()->id_usuario;
            $incidencia->area_solicitante   = $user->area;
            $incidencia->motivo             = $request->motivo;
            if ($request->id_risk != "" && $request->id_risk != null)
                $incidencia->id_proyecto    = $request->id_risk;
            $incidencia->save();

            $nombre           = "vobo_jefe_" . $incidencia->id;
            $incidencia->vobo = Upload::uploadFile('incidencias/'.$nombre,'vobo', $incidencia, $nombre);
            $incidencia->save();

            $Tipo_bita = 'incidencia';
            $mensaje   = 'Se ha creado una incidencia';
            $opcional  = 'Creacion de incidencia';
            GlobalModel::SetBitacoras("$Tipo_bita", $incidencia->id, auth()->user()->id_usuario, $incidencia->id_empleado, "$mensaje", "$opcional");
            DB::commit();
            if ($tipo_incidencia->tipo == "DEDUCCION"){
                event(new IncidenciasEvents($incidencia,'noti_deduc'));
            }
            else{
                $proyecto = ProyectosIndeplo::find($incidencia->id_proyecto);
                if ($proyecto->monto_venta == 0){
                    event(new IncidenciasEvents($incidencia,'noti_sv'));
                }
                if ($proyecto->monto_venta > 0){
                    event(new IncidenciasEvents($incidencia,'noti_cv'));
                }
            }
            return redirect('incidencias')->with('mensaje', 'Incidencia solicitada');
        }catch (\Exception $e){
            DB::rollBack();
            return back()->with(['error' => $e]);
        }
    }

    public function getEmpleados(Request $request)
    {
        try{
            $busqueda  = $request->term;
            $empleados = Empleados::query();
            $usuario   = auth()->user();
            if ($usuario->listarTodo == null){
                if ($usuario->getCoordinador){
                    $this->recursivoEmpleados($usuario->id_usuario);
                    $emps = array_values(array_unique($this->array));
                    $empleados->whereIn('empleado_id', $emps);
                }
            }
            $empleados->select(DB::raw("concat_ws(' ',empleado_nombre, empleado_apaterno, empleado_amaterno) AS Nombre, empleado_id as id"));
            $empleados->where(DB::raw("CONCAT_WS(' ',empleado_nombre,empleado_apaterno,empleado_amaterno)"), 'LIKE', '%'.$busqueda.'%');
            $empleados->whereNull('empleado_fecha_baja');
            $emps = $empleados->get();
            $data = array();

            foreach ($emps as $empleado) {
                $data[] = array('value' => $empleado->Nombre, 'id' => $empleado->id);
            }
            return response()->json($data);
        }catch (Exception $e){
            return [];
        }
    }

    public function getSolicitante(Request $request)
    {
        $Usuarios = DB::table('users')
            ->select(DB::raw("name AS Nombre"), 'id as id')
            ->where("name", "LIKE", "%{$request->input('term')}%")
            ->get();
        $data = array();
        foreach ($Usuarios as $users) {
            $data[] = array('value' => $users->nombre, 'id' => $users->id);
        }
    }

    public function GetUser()
    {
        $user_id = Auth::user()->id;
        return $user_id;
    }

    public function catalogoFiltro(Request $request){
        try{
            $catalogo = IncidenciasCatalogo::query();
            if ($request->tipo != "")
                $catalogo->where('tipo', '=', $request->tipo);
            if ($request->esquema != "")
                $catalogo->where('descripcion', '=', $request->esquema);
            $catalogo->where('estatus', '=', 'ACTIVO');
            $catalogo = $catalogo->get();
            return response()->json([
                'ok' => true,
                'data' => $catalogo
            ]);
        }catch (\Exception $e){
            dd($e);
            return response()->json([
                'ok' => false,
                'data' => []
            ]);
        }
    }

    public function getRisk(Request $request){
        try{
            $data         = [];
            $usuario      = auth()->user();
            $rec_proyecto = ProyectosIndeploRecurso::where('empleado_id', $request->id)
                            ->orderByDesc('id')->first();
            if ($rec_proyecto) {//Buscar si el usuario esta relacionado a una RO
                $proyecto_ind = ProyectosIndeplo::where('id', '=', $rec_proyecto->proyecto_id)
                    ->whereNull('fecha_termino')->where(DB::raw('MONTH(fecha_fin)'), '=', date('m'))->first();
                if ($proyecto_ind) { //validar que la RO sea valida
                    $servicio = $proyecto_ind->servicio;
                    $tipo_proyecto = $proyecto_ind->tipo_proyecto;
                    if ($tipo_proyecto == 2 || $tipo_proyecto == 3 || $tipo_proyecto == 4 || $tipo_proyecto == 6){
                        if ($servicio == "RREC" || $servicio == "POLZ" || $servicio == "TKBS" || $servicio == "SERV") { // En caso de estos servicios se regresa la RO a la que pertenecen
                            $text = $proyecto_ind->pedido . ' ' . $proyecto_ind->proyecto_nombre . ' ' . $proyecto_ind->sitio;
                            $data[] = ['value' => $text, 'id' => $proyecto_ind->id];
                            return response()->json($data);
                        } elseif ($proyecto_ind->cliente == "NAE" && $proyecto_ind->tecnologia == "GEST") {// En caso de los NAE se regresa la RO a la que pertenecen
                            $text = $proyecto_ind->pedido . ' ' . $proyecto_ind->proyecto_nombre . ' ' . $proyecto_ind->sitio;
                            $data[] = ['value' => $text, 'id' => $proyecto_ind->id];
                            return response()->json($data);
                        }
                    }
                }
            }
            $proyecto = ProyectosIndeplo::query();
            $proyecto->where(DB::raw('CONCAT(pedido,proyecto_nombre,sitio)'),'LIKE', '%'.strval($request->term).'%');
            if ($usuario->listarTodo == null) {
                if ($usuario->getCoordinador) { // Validar que coordine recursos
                    if (!empty($usuario->getCoordPD)) { // Validar que tenga registros en la tabla coordinadores_pd
                        $projects = $usuario->getCoordPD; // Obtener las wbs que puede ver
                        $array = [];
                        foreach ($projects as $project) {
                            $wbs = $project->cliente;
                            if ($project->servicio != "")
                                $wbs .= '-' . $project->servicio;
                            $array[] = $wbs; // Guardar las WBS
                        }
                        $proyecto->whereIn(DB::raw("CONCAT_WS('-',cliente,servicio)"), $array); // Limitar los registros a las wbs que puede ver
                    }
                }
            }
            $proyecto->whereNull('fecha_termino');
            $proyecto->where(DB::raw('MONTH(fecha_fin)'),'=',date('m'));
            $proyectos = $proyecto->get();
            foreach ($proyectos as $proyecto){
                $text = $proyecto->pedido.' '.$proyecto->proyecto_nombre.' '.$proyecto->sitio;
                $data[] = ['value' => $text, 'id' => $proyecto->id];
            }
            return response()->json($data);
        }catch (\Exception $e){
            return $e;
        }
    }
}