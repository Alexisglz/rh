<?php

namespace App\Http\Controllers;

use App\Coordinador;
use App\Http\Requests;
use App\Models\CatalogoCoordinadores;
use App\Models\VistaEmpleadosActivos;
use App\Models\VistaSolAltas;
use App\PlanesLineas;
use App\User;
use App\WBS;
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
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getDataAltas(Request $request)
    {
        $usuario     = auth()->user(); // Obtener el usuario mediante los metodos de autenticacion de laravel
        $solicitudes = VistaSolAltas::query(); // Iniciar query de consulta de solicitudes
        if ($usuario->listarTodo == null) { // Verificar que no tenga el permiso de listar todos
            if ($usuario->getCoordinador) { // verificar que sea coordinador
                $this->recursivoCoordinadores($usuario->id_usuario); // Llamar la funcion recursiva para obtener el id de los coordinadores
                $this->coords[] = $usuario->getCoordinador->id; // Agregar el id_coordinador del usuario autenticado
                $coords         = array_values(array_unique($this->coords)); // Ordenar el arreglo de ids para que no se repitan y organizar los indices
                $solicitudes->whereIn('coordinador_id', $coords); // Agregar a la consulta la busqueda de ids de coordinadores
            }
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
        }
        $data = $solicitudes->get();
        return DataTables::of($data)
            ->make(true);
    }

    public function getDataEmpleados(Request $request)
    {
        $usuario = auth()->user();
        $emp      = VistaEmpleadosActivos::query();
        if ($usuario->listarTodo == null){
            if ($usuario->getCoordinador){
                $this->recursivoEmpleados($usuario->id_usuario);
                $emps = array_values(array_unique($this->array));
                $emp->whereIn('id', $emps);
            }
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
        $emp->get();
        return DataTables::of($emp)
            ->make(true);
    }

    public function getBajasNom()
    {
        $solicitudes = DB::table('vista_solicitudes_baja_nom')->get();
        return DataTables::of($solicitudes)
            ->make(true);
    }

    public static function getCatalogoCodigos()
    {
        $sol = DB::table('catalogo_codigos')
            ->select(DB::raw(
                "id, codigo, concepto, precio, costo, incluye, tipo, diario, pd, diario_gasolina, 
                        monto_viatico, incluye_viaticos, incluye_equipo, descripcion, horas, caduca"));
        return DataTables::of($sol)
            ->make(true);
    }

    public static function getCatalogoProyectos()
    {
        $sol = DB::select(DB::raw("call rh.sp_todos_proyectos();"));
        return DataTables::of($sol)
            ->make(true);
    }

    public static function getCatalogoCoordinador()
    {
        $sol = Coordinador::select(DB::raw('id,nombre,apellido,correo'));
        return DataTables::of($sol)
            ->make(true);
    }

    public static function getCatalogoPlanes()
    {
        $sol = PlanesLineas::select(DB::raw(
            'plan_id, plan_codigo, plan_nombre, plan_tipo,plan_descripion, plan_costo, 
            plan_precio, plan_empresa, plan_proveedor'));
        return DataTables::of($sol)
            ->make(true);
    }

    public static function getEmpleadosCriterio($criterio)
    {
        $sol = DB::select(DB::raw("call rh.sp_busca_empleado_criteria('$criterio');"));
        return DataTables::of($sol)
            ->make(true);
    }

    public static function getCatalogoWBS()
    {
        $sol = WBS::all();
        return DataTables::of($sol)
            ->make(true);
    }

    public function getDataBajas()
    {
        $sol = DB::table('solicitud_baja')->select('id', 'wbs', 'apaterno', 'amaterno', 'fecha_inicio', 'puesto');
        return DataTables::of($sol)
            ->addColumn('action', function ($sol) {
                $btn = "";
                return $btn;
            })
            ->make(true);
    }

    public function getDataHerramientas()
    {
        $sol = DB::table('solicitud_alta')->select('id', 'nombre', 'apaterno', 'amaterno');
        return DataTables::of($sol)
            ->addColumn('action', function ($sol) {
                $btn = "";
                $btn .= '<a href="#edit-' . $sol->id . '" class="btn btn-xs btn-primary" style="margin-rigth: 5px;margin-left: 5px"><i class="fa fa-pencil-square-o"></i> Editar</a>';
                $btn .= '<button id="darBajaCliente" onClick="darBajaCliente(' . $sol->id . "," . $auth->user->id . ')" data-toggle="modal" data-target="#myModal" class="btn btn-xs btn-danger" style="margin-rigth: 5px;margin-left: 5px"><i class="fa fa-trash-o"></i>Baja</button>';
                return $btn;
            })
            ->make(true);
    }

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
}