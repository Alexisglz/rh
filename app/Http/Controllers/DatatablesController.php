<?php

namespace App\Http\Controllers;

use App\Models\CatalogoCoordinadores;
use App\Models\IncidenciaPeriodo;
use App\Models\VistaAjusteSueldo;
use App\Models\VistaCitasFirma;
use App\Models\VistaEmpleadosActivos;
use App\Models\VistaIncidenciasPeriodo;
use App\Models\VistaSolAltas;
use App\Models\VistaSolBajas;
use App\User;
use App\VistaIncidencias;
use DB;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;

class DatatablesController extends Controller
{
    /*
     * Displays datatables front end view
     *
     * @return \Illuminate\View\View
     */

    public $array  = [];
    public $coords = [];
    /**
     * @var false|string
     */
    private $date;

    public function __construct()
    {
        $this->date = date('Y-m-d H:i:s');
    }

    /** Funcion recursiva para obtener el arbol de empleados
     * @param int $id
     * @return bool
     */
    public function recursivoEmpleados(int $id){
        if ($id == null) // Si no se envia un id de usuario se termina
            return true;
        else{
            $usuario  = User::find($id);
            if ($usuario->getCoordinador){ // Revisar si es coordinador o terminar en caso de que no lo sea
                $movs = $usuario->getCoordinador->getMovimientos; // Obtenemos los empleados que coordina
                foreach ($movs as $item){
                    if ($item->getEmpleado == null )
                        continue;
                    if ($item->getEmpleado->empleado_id == null) // Obtener el id del empleado en caso de que no exista terminar
                        continue;
                    $this->array[] = $item->getEmpleado->empleado_id; // En caso de existir guardar el id del empleado
                    $user          = User::where('empleado_id', '=', $item->empleado_id)->first(); // Buscar el usuario incore de ese empleado
                    if ($user)
                        $this->recursivoEmpleados($user->id_usuario); // Volver a llamar la funcion con el usuario
                }
            }
            else{
                return true;
            }
        }
    }

    /** Funcion recursiva para obtener el arbol de coordinadores
     * @param int $id
     * @return bool
     */
    public function recursivoCoordinadores(int $id){
        if ($id == null)
            return true;
        else{
            $usuario  = User::find($id);
            if ($usuario->getCoordinador){
                $movs = $usuario->getCoordinador->getMovimientos;
                foreach ($movs as $item){
                    if ($item->getEmpleado == null)
                        continue;
                    if ($item->getEmpleado->empleado_id == null)
                        continue;
                    $user = User::where('empleado_id', '=', $item->empleado_id)->first();
                    if ($user == null){
                        continue;
                    }
                    $coord = CatalogoCoordinadores::where('user_id', '=', $user->id_usuario)->first();
                    if ($coord)
                        $this->coords[] = $coord->id;
                    $this->recursivoCoordinadores($user->id_usuario);
                }
            }
            else{
                return true;
            }
        }
    }

    /**
     * @param $query
     * @return string
     */
    function getRealQuery($query)
    {
        $params = array_map(function ($item) {
            return "'{$item}'";
        }, $query->getBindings());
        $result = str_replace_array('?', $params, $query->toSql());
        return $result;
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getDataAltas(Request $request)
    {
        $usuario     = auth()->user(); // Obtener el usuario mediante los metodos de autenticacion de laravel
        $solicitudes = VistaSolAltas::query(); // Iniciar query de consulta de solicitudes
        if ($usuario->listarTodo == null) { // Verificar que no tenga el permiso de listar todos
            $directivo = $usuario->getDirectorNoti;
            if ($directivo){ // Verificar que pueda autorizar las solicitudes por area
                $solicitudes->where(DB::raw("CONCAT_WS('-',cliente,servicio)"),'=',$directivo->cliente.'-'.$directivo->servicio);
            }
            else{
                $pd = DB::table('incore.coordinadores_project_definition')
                    ->select(DB::raw("CONCAT(cliente,'-',servicio) AS pd"))
                    ->where('usuario_id',$usuario->id_usuario)->pluck('pd');
                if(empty($pd->toArray())){
                    $proyecto = auth()->user()->getEmpleado->getMovimientoProyecto;
                    if (!empty($proyecto))
                        $pd[] = $proyecto->cliente.'-'.$proyecto->servicio;
                }
                $solicitudes->whereIn(DB::raw("CONCAT(cliente,'-',servicio)"),$pd->toArray());
            }
            /*elseif ($usuario->getCoordinador) { // verificar que sea coordinador
                $this->recursivoCoordinadores($usuario->id_usuario); // Llamar la funcion recursiva para obtener el id de los coordinadores
                $this->coords[] = $usuario->getCoordinador->id; // Agregar el id_coordinador del usuario autenticado
                $coords         = array_values(array_unique($this->coords)); // Ordenar el arreglo de ids para que no se repitan y organizar los indices
                $solicitudes->whereIn('coordinador_id', $coords); // Agregar a la consulta la busqueda de ids de coordinadores
            }*/
        }

        // Aplicar Filtros a Datatables
        if ($request->reset == 0){ // Parametro para reiniciar filtros en caso de llegar 1 se reinician
            if ($request->auth != 0) // En caso de llegar 1 se activa el filtro (aplica en todos)
                $solicitudes->where('Auth direccion', '<>', 'x'); // Agregar al query la validacion correspondiente para el filtrado
            if ($request->no_auth != 0)
                $solicitudes->where('Auth direccion', '=', 'x');
            if ($request->rh_auth != 0)
                $solicitudes->where('Auth RH', '<>', 'x');
            if ($request->rh_no_auth != 0)
                $solicitudes->where('Auth RH', '=', 'x');
            if($request->search_id != null)
                $solicitudes->where('id','=',$request->search_id);
            if($request->search_nombre != null)
                $solicitudes->where('Nombre','LIKE','%'.$request->search_nombre.'%');
            if($request->search_wbs != null)
                $solicitudes->where('WBS','LIKE','%'.$request->search_wbs.'%');
            if($request->search_coord != null)
                $solicitudes->where('coordinador','LIKE','%'.$request->search_coord.'%');
        }
        $sql = $this->getRealQuery($solicitudes);
        $data = $solicitudes->get();
        return DataTables::of($data)
            ->with(['sql' => $sql])
            ->make(true);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getDataEmpleados(Request $request)
    {
        $usuario = auth()->user();
        $emp      = VistaEmpleadosActivos::query();
        if ($usuario->listarTodo == null){
            /*if ($usuario->getCoordinador){
                $this->recursivoEmpleados($usuario->id_usuario);
                $emps = array_values(array_unique($this->array));
                $emp->whereIn('id', $emps);
            }*/
            $pd = DB::table('incore.coordinadores_project_definition')
                ->select(DB::raw("CONCAT(cliente,'-',servicio) AS pd"))
                ->where('usuario_id',$usuario->id_usuario)->pluck('pd');
            if(empty($pd->toArray())){
                $proyecto = auth()->user()->getEmpleado->getMovimientoProyecto;
                if (!empty($proyecto))
                    $pd[] = $proyecto->cliente.'-'.$proyecto->servicio;
            }
            $emp->whereIn(DB::raw("CONCAT(cliente,'-',servicio)"),$pd->toArray());
        }
        //Filtros
        if($request->search_id != null)
            $emp->where('id','LIKE', '%'.$request->search_id.'%');
        if($request->num_emp != null)
            $emp->where('empleado_num','LIKE', '%'.$request->num_emp.'%');
        if($request->search_nombre != null)
            $emp->where('nombre_completo','LIKE', '%'.$request->search_nombre.'%');
        if($request->search_coord != null)
            $emp->where('coordinador','LIKE', '%'.$request->search_coord.'%');
        if($request->search_pd != null)
            $emp->where('pd','LIKE', '%'.$request->search_pd.'%');
        $sql = $this->getRealQuery($emp);
        $emp->get();
        return DataTables::of($emp)
            ->with(['sql' => $sql])
            ->make(true);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getBajasNom(Request $request)
    {
        $usuario     = auth()->user();
        $solicitudes = VistaSolBajas::query();
        if ($usuario->listarTodo == null){
            /*if ($usuario->getCoordinador){
                $this->recursivoEmpleados($usuario->id_usuario);
                $emps = array_values(array_unique($this->array));
                $solicitudes->whereIn('empleado_id', $emps);
            }*/
            $pd = DB::table('incore.coordinadores_project_definition')
                ->select(DB::raw("CONCAT(cliente,'-',servicio) AS pd"))
                ->where('usuario_id',$usuario->id_usuario)->pluck('pd');
            if(empty($pd->toArray())){
                $proyecto = auth()->user()->getEmpleado->getMovimientoProyecto;
                if (!empty($proyecto))
                    $pd[] = $proyecto->cliente.'-'.$proyecto->servicio;
            }
            $solicitudes->whereIn('pd',$pd->toArray());
        }
        if ($request->reset == 0){
            if($request->id != null)
                $solicitudes->where('id','=',$request->id);
            if($request->rec != null)
                $solicitudes->where('Recurso','LIKE','%'.$request->rec.'%');
            if($request->wbs != null)
                $solicitudes->where('WBS','LIKE','%'.$request->wbs.'%');
            if($request->est != null)
                $solicitudes->where('baja_definitiva','=',$request->est);
        }
        $data = $solicitudes->get();
        return DataTables::of($data)
            ->make(true);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getCitasFirma(Request $request)
    {
        $citas   = VistaCitasFirma::query();
        $usuario = auth()->user();
        if ($usuario->listarTodo == null) {
            if ($usuario->getCoordinador) {
                $this->recursivoCoordinadores($usuario->id_usuario);
                $this->coords[] = $usuario->getCoordinador->id;
                $coords         = array_values(array_unique($this->coords));
                $citas->whereIn('coordinador_id', $coords);
            }
        }
        if ($request->reset == 0){
            if($request->search_id)
                $citas->where('id','LIKE','%'.$request->search_id.'%');
            if($request->estatus)
                $citas->where('status_cita','=',$request->estatus);
        }
        $citas = $citas->get();
        return DataTables::of($citas)
            ->whitelist([
                'id',
                'WBS',
                'Nombre',
                'coordinador',
                'Auth_entregables',
                'Auth_direccion',
                'Auth_RH',
                'fecha_cita',
                'hora_cita',
                'status_cita',
                'correo_cita',
                'detalles_cita'])
            ->make(true);
    }

    /**
     * @return mixed
     * @throws \Exception
     */
    public function getDataUsuarios()
    {
        $p_noti  = auth()->user()->can('access',[\App\User::class,'notificaciones_usuarios'])? 1:0;
        $p_edit  = auth()->user()->can('access',[\App\User::class,'editar_usuarios'])? 1:0;
        $p_perm  = auth()->user()->can('access',[\App\User::class,'modificar_permisos'])? 1:0;
        $p_elim  = auth()->user()->can('access',[\App\User::class,'baja_usuarios'])? 1:0;
        $user = DB::table('vista_usuarios')->select();
        return DataTables::of($user)
            ->addColumn('action', function ($user) use ($p_noti,$p_perm,$p_edit,$p_elim) {
                $btn = "";
                if ($p_noti == 1)
                    //$btn .= '<button title="Notificaciones de Correos" onClick="asignarnotificaciones(' . $user->id . ')" class="notifications btn btn-sm btn-info btn-primary" style="margin-rigth: 5px;margin-left: 5px"><i class="fa fa-bell"></i></button>';
                if ($p_perm == 1)
                    $btn .= '<button title="Permisos del Usuario" onClick="asignarPermisos(' . $user->id . ')" class="btn btn-sm btn-success" style="margin-rigth: 5px;margin-left: 5px"><i class="fas fa-shield-alt"></i></button>';
                if ($p_edit == 1)
                    $btn .= '<button title="Editar Usuario" onClick="abrirModalEditUsuario(' . $user->id . ')" class="btn btn-sm btn-primary" style="margin-rigth: 5px;margin-left: 5px"><i class="fa fa-pencil-square-o"></i></button>';
                if ($p_elim == 1)
                    $btn .= '<button title="Eliminar usuario" id="" onClick="abrirModalEliminarUsuario(' . $user->id . ')" class="btn btn-sm btn-danger" style="margin-rigth: 5px;margin-left: 5px"><i class="fa fa-trash"></i></button>';
                return $btn;
            })
            ->make(true);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getIncidencias(Request $request){
        $usuario     = auth()->user();
        $area        = $usuario->getRol->Rol;
        $incidencias = VistaIncidencias::query();
        if ($usuario->listarTodo == null) {
            if ($usuario->getCoordinador) {
                $this->recursivoCoordinadores($usuario->id_usuario);
                $this->coords[] = $usuario->getCoordinador->id;
                $coords         = array_values(array_unique($this->coords));
                $incidencias->whereIn('coordinador_id', $coords);
            }
        }
        switch ($area){
            case 'ESP':
            case 'ADMIN':
                break;
            case 'RH':
            case 'DIR':
            case 'ENTR':
                $incidencias
                    ->where('area_solicitante','<>','Esp');
                break;
            default:
                $incidencias
                    ->where('id_solicitante','=',auth()->user()->id_usuario)
                    ->select();
                break;
        }
        if ($request->reset == 0){
            if($request->search_id)
                $incidencias->where('id','LIKE','%'.$request->search_id.'%');
            if($request->search_nombre)
                $incidencias->where('empleado','LIKE','%'.$request->search_nombre.'%');
            if($request->search_tipo)
                $incidencias->where('tipo_incidencia','=',$request->search_tipo);
            if($request->search_periodo)
                $incidencias->where('id_periodo','=',$request->search_periodo);
            if($request->search_estatus)
                $incidencias->where('estatus','=',$request->search_estatus);
        }
        return DataTables::of($incidencias)
            ->whitelist(['empleado', 'solicitante', 'tipo_incidencia', 'id',
                'fecha_solicitud', 'fecha_inicio', 'fecha_fin', 'id_lote','descargado','emp_id'])
            ->make(true);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getIncidenciasGerente(Request $request)
    {
        $usuario     = auth()->user();
        $area        = $usuario->getRol->Rol;
        $incidencias = VistaIncidencias::query();
        $periodo     = IncidenciaPeriodo::where('fecha_inicio','<=', $this->date)
                        ->where('limite_directivo','>=', $this->date)->first();
        if ($area != 'ADMIN') {
            $director = auth()->user()->getDirectorInc;
            if ($director) {
                foreach ($director AS $item) {
                    $director_pd = $item->cliente.'-'.$item->servicio;
                    $incidencias->orWhere('pd_recurso', $director_pd)->where('estatus', 'SOLICITADO');
                }
            }
        }
        else{
            $incidencias->where('estatus', 'SOLICITADO');
        }
        if($request->reset == 0){
            if($request->id != null)
                $incidencias->where('id','=',$request->id);
            if($request->emp != null)
                $incidencias->where('empleado','LIKE','%'.$request->emp.'%');
        }
        if($periodo)
            $incidencias->where('id_periodo',$periodo->id);
        else
            $incidencias = [];
        return DataTables::of($incidencias)
            ->whitelist(['empleado', 'solicitante', 'tipo_incidencia', 'id',
                'fecha_solicitud', 'fecha_inicio', 'fecha_fin', 'id_lote','descargado','emp_id'])
            ->make(true);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getIncidenciasAuth(Request $request)
    {
        $usuario     = auth()->user();
        $area        = $usuario->getRol->Rol;
        $incidencias = VistaIncidencias::query();
        $periodo     = IncidenciaPeriodo::where('fecha_inicio','<=', $this->date)
                        ->where('fecha_fin','>=', $this->date)->first();
        $inc_c_v     = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_c_v'])? 1:0;
        $inc_s_v     = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_s_v'])? 1:0;
        $inc_ded     = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_dec'])? 1:0;
        if($area == 'ADMIN' || $area == 'ESP'){
        }
        else{
            if ($inc_s_v == 1)
                $incidencias->orWhere('venta','<=',0)->where('tipo_incidencia', '!=','DEDUCCION');
            if ($inc_c_v == 1)
                $incidencias->orWhere('venta','>',0)->where('tipo_incidencia', '!=','DEDUCCION');
            if ($inc_ded == 1)
                $incidencias->orWhere('tipo_incidencia','=','DEDUCCION');
        }
        switch ($area){
            case 'ESP':
            case 'ADMIN':
                break;
            case 'RH':
            case 'DIR':
            case 'ENTR':
                $incidencias
                    ->where('area_solicitante','<>','Esp')
                    ->select();
                break;
            default:
                $incidencias
                    ->where('id_solicitante','=',auth()->user()->id_usuario)
                    ->select();
                break;
        }
        if($request->reset == 0){
            if($request->id != null)
                $incidencias->where('id','=',$request->id);
            if($request->emp != null)
                $incidencias->where('empleado','LIKE','%'.$request->emp.'%');
        }
        if($periodo)
            $incidencias->whereBetween('fecha_solicitud',[$periodo->fecha_inicio, $periodo->fecha_fin]);
        else
            $incidencias = [];
        return DataTables::of($incidencias)
            ->whitelist(['empleado', 'solicitante', 'tipo_incidencia', 'id',
                'fecha_solicitud', 'fecha_inicio', 'fecha_fin', 'id_lote','descargado','emp_id'])
            ->make(true);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getIncidenciasPeriodo(Request $request){
        $usuario = auth()->user();
        $area    = $usuario->getRol->Rol;
        $periodo = IncidenciaPeriodo::where('fecha_inicio','<=', $this->date)
            ->where('fecha_envio','>=', $this->date)->first();
        $incidencias = VistaIncidenciasPeriodo::query();
        if ($usuario->listarTodo == null) {
            if ($usuario->getCoordinador) {
                $this->recursivoCoordinadores($usuario->id_usuario);
                $this->coords[] = $usuario->getCoordinador->id;
                $coords         = array_values(array_unique($this->coords));
                $incidencias->whereIn('coordinador_id', $coords);
            }
        }
        switch ($area){
            case 'ESP':
            case 'ADMIN':
                $incidencias->where('estatus','=','POR ENVIAR');
                break;
            case 'RH':
            case 'DIR':
            case 'ENTR':
                $incidencias->where('area_solicitante','<>','Esp')
                    ->where('estatus','=','POR ENVIAR');
                break;
            default:
                $incidencias->where('id_solicitante','=',auth()->user()->id_usuario)
                    ->where('estatus','=','POR ENVIAR');
                break;
        }
        if($periodo)
            $incidencias->whereBetween('fecha_solicitud',[$periodo->fecha_inicio, $periodo->fecha_envio]);
        else
            $incidencias = [];
        return DataTables::of($incidencias)
            ->whitelist(['empleado', 'solicitante', 'tipo_incidencia', 'id',
                'fecha_solicitud', 'fecha_inicio', 'fecha_fin', 'id_lote','descargado','emp_id'])
            ->make(true);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getIncidenciasFinalizadas(Request $request)
    {
        $usuario = auth()->user();
        $area    = $usuario->getRol->Rol;
        $incidencias = VistaIncidencias::query();
        $incidencias
            ->whereIn('estatus',['ENVIADO','CANCELAR'])->select();
        if ($usuario->listarTodo == null) {
            if ($usuario->getCoordinador) {
                $this->recursivoCoordinadores($usuario->id_usuario);
                $this->coords[] = $usuario->getCoordinador->id;
                $coords         = array_values(array_unique($this->coords));
                $incidencias->whereIn('coordinador_id', $coords);
            }
        }
        switch ($area){
            case 'ESP':
            case 'ADMIN':
                break;
            case 'RH':
            case 'DIR':
            case 'ENTR':
                $incidencias->where('area_solicitante','<>','Esp');
                break;
            default:
                $incidencias->where('id_solicitante','=',auth()->user()->id_usuario);
                break;
        }
        if ($request->reset == 0){
            if($request->search_id)
                $incidencias->where('id','LIKE','%'.$request->search_id.'%');
            if($request->search_nombre)
                $incidencias->where('empleado','LIKE','%'.$request->search_nombre.'%');
            if($request->search_num)
                $incidencias->where('emp_id','LIKE','%'.$request->search_num.'%');
            if($request->search_inci)
                $incidencias->where('incidencia','LIKE','%'.$request->search_inci.'%');
            if($request->search_sol)
                $incidencias->where('solicitante','LIKE','%'.$request->search_sol.'%');
            if($request->search_esta)
                $incidencias->where('estatus','=',$request->search_esta);
            if($request->search_tipo)
                $incidencias->where('tipo_incidencia','=',$request->search_tipo);
        }
        $sql = $this->getRealQuery($incidencias);
        return DataTables::of($incidencias)
            ->with(['sql' => $sql])
            ->whitelist(['empleado', 'solicitante', 'tipo_incidencia', 'id',
                'fecha_solicitud', 'fecha_inicio', 'fecha_fin', 'id_lote','descargado','emp_id'])
            ->make(true);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getDataAjustes(Request $request){
        $ajustes = VistaAjusteSueldo::query();
        if ($request->reset == 0){
            if($request->search_id)
                $ajustes->where('id','=',$request->search_id);
            if($request->search_nombre)
                $ajustes->where('nombre','LIKE','%'.$request->search_nombre.'%');
            if($request->search_est){
                if ($request->search_est == 'cancelado')
                    $ajustes->whereIn('estatus',['cancelado','rechazado']);
                else
                    $ajustes->where('estatus','=',$request->search_est);
            }
        }
        $ajustes = $ajustes->get();
        return DataTables::of($ajustes)
            ->make(true);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getValiAjustes(Request $request){
        $ajustes = VistaAjusteSueldo::query();
        $ajustes->where('estatus','=','solicitado');
        if ($request->reset == 0){
            if($request->search_id)
                $ajustes->where('id','=',$request->search_id);
            if($request->search_nombre)
                $ajustes->where('nombre','LIKE','%'.$request->search_nombre.'%');
            if($request->search_est)
                $ajustes->where('enviado','=',$request->search_est);
        }
        $ajustes = $ajustes->get();
        return DataTables::of($ajustes)
            ->make(true);
    }
}