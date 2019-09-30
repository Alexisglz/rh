<?php
/*
    MOD: JLGALINDO,
    CREAR CONTROL PARA MOSTRAR LA VISTA DEL FORMULARIO PARA DAR DE ALTA USUARIOS CON SU RESPECTIVO ROL
    SIN FUNCIONAMIENTO POR EL MOMENTO
*/

namespace App\Http\Controllers;

use App\Area;
use App\CatalogoRoles;
use App\GlobalModel;
use App\Models\UserMaster;
use App\Models\UsuarioNotificacion;
use App\Models\UsuariosTickets;
use App\Notificacion;
use App\Permiso;
use App\User;
use App\UsuarioPermiso;
use App\UsuarioRol;
use DB;
use Illuminate\Auth\Reminders\RemindableInterface;
use Illuminate\Auth\UserInterface;
use Illuminate\Http\Request;
use Storage;


class UsuariosController extends Controller
{

    protected $rules = [
        'grupo' => ['required']
    ];

    public function __construct()
    {
        $this->date = date('Y-m-d H:i:s');
    }

    public function index()
    {
        $this->authorize('access',[User::class, 'listado_usuarios']);
        $iareas = DB::table('incore.catalogo_areas')
            ->select()
            ->get();
        $areas = [];
        foreach ($iareas as $item) {
            if ($item->estatus == 'ACTIVO')
                $areas[$item->area] = $item->area;
        }
        return view('usuarios.index', [
            'areas' => $areas
        ]);
    }

    public function create()
    {
        $this->authorize('access',[User::class, 'crear_usuarios']);
        $master = UserMaster::where('id_user',auth()->user()->id_usuario)->first();
        $areas = UsuarioRol::query();
        if (!$master)
            $areas->where('Rol','<>','ESP');
        $areas = $areas->get();
        return view('usuarios.create', [
            'areas' => $areas
        ]);
    }

    public function store(Request $request)
    {
        $this->authorize('access',[User::class, 'crear_usuarios']);
        $conn = DB::connection('incore');
        try{
            $conn->beginTransaction();

            $user = new User();
            $user->nombre         = $request->name;
            $user->apellido       = $request->last_name;
            $user->usuario        = $request->usuario;
            $user->password       = md5($request->password);
            $user->perfil         = $request->perfil;
            $user->area           = $request->area;
            $user->correo         = $request->correo;
            $user->pwdcgd         = 0;
            $user->estatus        = 'ACTIVO';
            $user->empleado_id    = $request->id_empleado;
            $user->id_area        = $request->Rol;
            $user->password2      = bcrypt($request->password);
            $user->save();
            $conn->commit();
            $this::permisosDefault($user->id_usuario);
            return redirect()->route('usuarios.index');
        }catch (\Exception $e){
            $conn->rollBack();
            return redirect()->route('usuarios.index')->with($e);
        }
    }

    public function darBaja(Request $request)
    {
        $this->authorize('access',[User::class, 'baja_usuarios']);
        try{
            DB::beginTransaction();
            $user       = new User;
            $user_temp  = $user::find($request->id);
            $user_temp->delete();
            $data       = array(
                'success' => 'success'
            );
            DB::commit();
            return json_encode($data, JSON_FORCE_OBJECT);
        }catch (\Exception $e){
            DB::rollBack();
            return ["ok" => false];
        }
    }

    public function getUsuario(Request $request)
    {
        try{
            $areas      = CatalogoRoles::getRoles();
            $user       = User::find($request->id);
            return response()->json([
                'ok' => true,
                'user' => $user,
                'areas' => $areas
            ]);
        }catch (\Exception $e){
            return $e;
        }
    }

    public function updateUsuario(Request $request)
    {
        $this->authorize('access',[User::class, 'editar_usuarios']);
        try{
            DB::beginTransaction();
            $cambiar           = false;
            $user              = User::find($request->id_user);
            $user->nombre      = $request->name;
            $user->apellido    = $request->apellidos;
            $user->usuario     = $request->usuario;
            $user->correo      = $request->email;
            $user->empleado_id = $request->id_empleado;
            $user->perfil      = $request->perfil;
            $user->area        = $request->area;
            if ($user->id_area != intval($request->rol)){
                $user->id_area  = $request->rol;
                $cambiar             = true;
            }
            if ($request->password != "" ){
                $user->password  = md5($request->password);
                $user->password2 = bcrypt($request->password);
            }
            if ($request->reset_pass == 1){
                $user->pwdcgd = 0;
            }

            $user->save();
            if ($cambiar == true){
                UsuarioPermiso::where('id_usuario','=',$user->id_usuario)->delete();
                $this::permisosDefault($user->id_usuario);
            }
            if ($request->password != "" ) {
                $tickets = UsuariosTickets::where('usuario', '=', $user->usuario)->first();
                if ($tickets){
                    $tickets->password = md5($request->password);
                    $tickets->save();
                }
            }
            DB::commit();
            return response()->json([
                'ok' => true,
                'data' => $user
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

    public function getNotificaciones(Request $request){
        try{
            $notificactions = Notificacion::where('estatus','=','Activo')->get();
            return response()->json([
                "ok" => true,
                "data" => $notificactions
            ]);
        }catch (\Exception $e){
            return response()->json([
                "ok" => false,
                "data" => $e
            ]);
        }
    }

    public function getNotifiUsuario(Request $request){
        try{
            $notificactions = UsuarioNotificacion::where('id_usuario','=', $request->id)->get();
            return response()->json([
                "ok" => true,
                "data" => $notificactions
            ]);
        }catch (\Exception $e){
            return response()->json([
                "ok" => false,
                "data" => $e
            ]);
        }
    }

    public function updatenotificaciones(Request $request)
    {
        $this->authorize('access',[User::class, 'notificaciones_usuarios']);
        try{
            DB::begintransaction();
            if($request->id_noti != 0)
                $user_noti = notificacion::find($request->id_noti);
            else{
                $user_noti          = new notificacion();
                $user_noti->user_id = $request->user;
            }
            $user_noti->uscrear             = $request->uscrear;
            $user_noti->useliminar          = $request->useliminar;
            $user_noti->usedit              = $request->usedit;
            $user_noti->SolAlta             = $request->SolAlta;
            $user_noti->SolCrear            = $request->SolCrear;
            $user_noti->SolBaja             = $request->SolBaja;
            $user_noti->EmpleadoActualizar  = $request->EmpleadoActualizar;
            $user_noti->EmpleadoBaja        = $request->EmpleadoBaja;
            $user_noti->InciCrear           = $request->InciCrear;
            $user_noti->inciAuth            = $request->inciAuth;
            $user_noti->inciLote            = $request->inciLote;
            $user_noti->save();
            DB::commit();
            return response()->json([
                "ok" => true,
                "data" => $user_noti
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return response()->json([
                "ok" => false,
                "data" => $e
            ]);
        }
    }

    public function getPermisos(){
        try{
            $permisos = Permiso::where('status', '=', 1)->get();
            return response()->json([
                "ok"   => true,
                "data" => $permisos
            ]);
        }catch (\Exception $e){
            return response()->json([
                "ok"   => false,
                "data" => $e
            ]);
        }
    }

    public function getPermisosUsuario(Request $request){
        try{
            $permisos = UsuarioPermiso::where('id_usuario', '=', $request->id)->get();
            return response()->json([
                "ok"   => true,
                "data" => $permisos
            ]);
        }catch (\Exception $e){
            return response()->json([
                "ok"   => false,
                "data" => $e
            ]);
        }
    }

    public function guardarPermisos(Request $request){
        try{
            DB::beginTransaction();
            $usuario = $request->usuario;
            $permisos = $request->permisos;
            $creados = [];
            if ($permisos == "false"){
                UsuarioPermiso::where('id_usuario',$usuario)->delete();
            }
            else{
                UsuarioPermiso::where('id_usuario',$usuario)->whereNotIn('id_permiso',$permisos)->delete();
                for ($i=0; $i<count($permisos);$i++){
                    $existe = UsuarioPermiso::where('id_usuario',$usuario)->where('id_permiso',$permisos[$i])->first();
                    if (!$existe){
                        $nuevo =  new UsuarioPermiso();
                        $nuevo->id_usuario = $usuario;
                        $nuevo->id_permiso = $permisos[$i];
                        $nuevo->save();
                        $creados[] = $nuevo;
                    }
                }
            }
            DB::commit();
            return response()->json([
                "ok"      => true,
                "data"    => $creados
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return response()->json([
                "ok" => false,
                "data" => $e
            ]);
        }
    }

    public function permisosDefault($id){
        try{
            DB::beginTransaction();
            $permisos = [];
            $user     = User::find($id);
            switch ($user->getRol->Rol){
                case 'RH':
                    $permisos = [
                        'listado_solicitudes','crear_solicitudes','editar_solicitudes','agendar_cita',
                        'autorizar_empleado','editar_empleado','baja_empleado','cancelar_bajas','baja_rh','baja_definitiva',
                        'listado_empleados','listado_bajas','listado_citas','listado_incidencias','crear_incidencias',
                        'listado_autorizar','aut_cancel_incidencia','exportar_solicitudes','exportar_empleados',
                        'exportar_incidencias','ver_sueldo','cita_baja','baja_credencial','listar_todos','ver_asimilados_inci',
                        'ver_tradicional_inci','cambio_viable','cancel_sol_alta'
                    ];
                    break;
                case 'DIR':
                    $permisos = [
                        'listado_solicitudes','crear_solicitudes','editar_solicitudes','autorizar_solicitudes','editar_empleado',
                        'baja_empleado','cancelar_bajas','baja_definitiva','listado_empleados','listado_bajas','listado_citas',
                        'listado_incidencias','crear_incidencias','listado_autorizar','exportar_solicitudes','exportar_empleados',
                        'exportar_incidencias','cita_baja','ver_asimilados_inci','ver_tradicional_inci'
                    ];
                    break;
                case 'COOR':
                    $permisos = [
                        'listado_solicitudes','listado_empleados','listado_incidencias','crear_incidencias','crear_solicitudes',
                        'ver_asimilados_inci','ver_tradicional_inci','listado_bajas','baja_empleado'
                    ];
                    break;
                case 'ENTR':
                    $permisos = [
                        'listado_solicitudes', 'autorizar_empleado','editar_empleado',
                        'listado_empleados','listado_bajas','listado_citas','listado_incidencias','crear_incidencias',
                        'listado_lote','exportar_solicitudes', 'exportar_empleados','exportar_incidencias','export_lote_incidencias',
                        'enviar_lote','baja_rh','listar_todos','ver_asimilados_inci','ver_tradicional_inci','listado_finalizadas'
                    ];
                    break;
                case 'ADMIN':
                    $permisos = [];
                    break;
                case 'PM':
                    $permisos = [
                        'listado_solicitudes','listado_empleados','listado_incidencias','crear_incidencias'
                    ];
                    break;
                case 'STI':
                    $permisos = [
                        'listado_solicitudes','listado_empleados','autorizar_computadora',
                        'baja_computo','exportar_solicitudes','exportar_empleados','listado_bajas'
                    ];
                    break;
                case 'SAUTO':
                    $permisos = [
                        'listado_solicitudes','listado_empleados','autorizar_coche',
                        'baja_coche','exportar_solicitudes','exportar_empleados','listado_bajas'
                    ];
                    break;
                case 'SCEL':
                    $permisos = [
                        'listado_solicitudes','listado_empleados','autorizar_celular',
                        'baja_celular','exportar_solicitudes','exportar_empleados','listado_bajas'
                    ];
                    break;
                case 'SALMA':
                    $permisos = [
                        'listado_solicitudes','listado_empleados','autorizar_herramientas',
                        'baja_herramientas','exportar_solicitudes','exportar_empleados','listado_bajas'
                    ];
                    break;
                case 'ESP':
                    $permisos = [
                        'listado_solicitudes','crear_solicitudes','editar_solicitudes','autorizar_solicitudes','agendar_cita',
                        'autorizar_empleado','editar_empleado','baja_empleado','cancelar_bajas','baja_definitiva',
                        'listado_empleados','listado_bajas','listado_citas','listado_incidencias','crear_incidencias',
                        'listado_autorizar','listado_lote','aut_cancel_incidencia','exportar_solicitudes',
                        'exportar_empleados','exportar_incidencias','export_lote_incidencias','enviar_lote','cita_baja',
                        'baja_credencial','ver_sueldo'
                    ];
                    break;
            }
            if ($user->getRol->Rol == 'ADMIN'){
                $permisos = Permiso::where('status',1)->get();
                foreach ($permisos as $permiso){
                    $user_permiso = new UsuarioPermiso();
                    $user_permiso->id_usuario = $user->id_usuario;
                    $user_permiso->id_permiso = $permiso->id;
                    $user_permiso->save();
                }
            }
            else{
                foreach ($permisos as $permiso){
                    $model = Permiso::where('codigo',$permiso)->first();
                    $user_permiso = new UsuarioPermiso();
                    $user_permiso->id_usuario = $user->id_usuario;
                    $user_permiso->id_permiso = $model->id;
                    $user_permiso->save();
                }
            }
            DB::commit();
            return true;
        }catch (\Exception $e){
            DB::rollBack();
            return false;
        }
    }

    public function existUser(Request $request){
        try{
            $user = User::where('usuario', '=', $request->user)
                ->where('id_usuario','!=', 716) //Hardcodeo para ocultar un usuario que causa errores
                ->first();
            return response()->json([
                'ok'   => true,
                'data' => $user
            ]);
        }catch (\Exception $e){
            return $e;
        }
    }
}