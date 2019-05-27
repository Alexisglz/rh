<?php

namespace App\Http\Controllers;

use App\GlobalModel;
use App\Helpers\Upload;
use App\Incidencias;
use App\Models\CatalogoCoordinadores;
use App\Models\IncidenciaPeriodo;
use App\Models\IncidenciasCatalogo;
use App\Models\VistaIncidenciasPeriodo;
use App\User;
use App\VistaIncidenciasSinLote;
use DB;
use Illuminate\Http\Request;
use Storage;
use Yajra\Datatables\Datatables;

class AutorizarController extends Controller
{

    public $coords = [];

    protected $rules = [
        'grupo' => ['required']
    ];

    public function __construct()
    {
        $this->date = date('Y-m-d H:i:s');
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
                    if (!isset($item->getEmpleado->empleado_id) || $item->getEmpleado->empleado_id == null)
                        continue;
                    $user = User::where('empleado_id', '=', $item->empleado_id)->first();
                    if ($user == null){
                        return true;
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

    public function index()
    {
        $this->authorize('access',[User::class, 'listado_autorizar']);
        $vistaName = 'incidencias.autorizar';
        return view($vistaName);
    }

    public function finalizadas()
    {
        $this->authorize('access',[User::class, 'listado_finalizadas']);
        return view('incidencias.finalizadas');
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getIncidencias(Request $request)
    {
        $id      = $request->tipo;
        $usuario = auth()->user();
        $area    = $usuario->getRol->Rol;
        $incidencias = VistaIncidenciasSinLote::query();
        $periodo = IncidenciaPeriodo::where('fecha_inicio','<=', $this->date)
            ->where('fecha_fin','>=', $this->date)->first();
        $inc_c_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_c_v'])? 1:0;
        $inc_s_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_s_v'])? 1:0;
        $inc_ded = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_dec'])? 1:0;
        /*if ($usuario->listarTodo == null) {
            if ($usuario->getCoordinador) {
                $this->recursivoCoordinadores($usuario->id_usuario);
                $this->coords[] = $usuario->getCoordinador->id;
                $coords         = array_values(array_unique($this->coords));
                $incidencias->whereIn('coordinador_id', $coords);
            }
        }*/
        if ($usuario->listarTodo == null) {
            if ($area != 'ADMIN') {
                if ($inc_s_v == 1)
                    $incidencias->where('venta', '=', 0);
                if ($inc_c_v == 1)
                    $incidencias->where('venta', '>', 0);
                if ($inc_ded == 1)
                    $incidencias->where('tipo_incidencia', '=', 'DEDUCCION');
            }
        }
        switch ($area){
            case 'ESP':
                if ($id == 'envio')
                    $incidencias
                        ->orWhere('estatus','=','ENVIADO')->select();
                else
                    $incidencias->select();
                break;
            case 'RH':
                if ($id == 'envio')
                    $incidencias
                        ->where('area_solicitante','<>','Especial')
                        ->orWhere('estatus','=','ENVIADO')->select();
                else
                    $incidencias
                        ->where('area_solicitante','<>','Especial')
                        ->select();
                break;
            case 'DIR':
                if ($id == 'envio')
                    $incidencias
                        ->where('area_solicitante','<>','Especial')
                        ->orWhere('estatus','=','ENVIADO')->select();
                else
                    $incidencias
                        ->where('area_solicitante','<>','Especial')
                        ->select();
                break;
            case 'ADMIN':
                if ($id == 'envio')
                    $incidencias
                        ->orWhere('estatus','=','ENVIADO')
                        ->select();
                else
                    $incidencias->select();
                break;
            case 'ENTR':
                if ($id == 'envio')
                    $incidencias
                        ->where('area_solicitante','<>','Especial')
                        ->orWhere('estatus','=','ENVIADO')->select();
                else
                    $incidencias
                        ->where('area_solicitante','<>','Especial')
                        ->select();
                break;
            default:
                if ($id == 'envio')
                    $incidencias
                        ->where('id_solicitante','=',auth()->user()->id_usuario)
                        ->orWhere('estatus','=','ENVIADO')->select();
                else
                    $incidencias
                        ->where('id_solicitante','=',auth()->user()->id_usuario)
                        ->select();
                break;
        }
        $incidencias->whereBetween('fecha_solicitud',[$periodo->fecha_inicio, $periodo->fecha_fin]);
        return DataTables::of($incidencias)
            ->whitelist(['empleado', 'solicitante', 'tipo_incidencia', 'id',
             'fecha_solicitud', 'fecha_inicio', 'fecha_fin', 'id_lote','descargado','emp_id'])
            ->make(true);
    }

    public function getIncidenciasFinalizadas(Request $request)
    {
        $usuario = auth()->user();
        $area    = $usuario->getRol->Rol;
        $incidencias = VistaIncidenciasSinLote::query();
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
                break;
            case 'RH':
                    $incidencias
                        ->where('area_solicitante','<>','Especial');
                break;
            case 'DIR':
                    $incidencias
                        ->where('area_solicitante','<>','Especial');
                break;
            case 'ADMIN':
                break;
            case 'ENTR':
                    $incidencias
                        ->where('area_solicitante','<>','Especial');
                break;
            default:
                    $incidencias
                        ->where('id_solicitante','=',auth()->user()->id_usuario);
                break;
        }
        $incidencias
            ->orWhere('estatus','=','ENVIADO')->select()
            ->orWhere('estatus','=','CANCELAR')->select();
        return DataTables::of($incidencias)
            ->whitelist(['empleado', 'solicitante', 'tipo_incidencia', 'id',
                'fecha_solicitud', 'fecha_inicio', 'fecha_fin', 'id_lote','descargado','emp_id'])
            ->make(true);
    }

    public function getIncidenciasPeriodo(Request $request){
        $usuario = auth()->user();
        $area    = $usuario->getRol->Rol;
        $incidencias = VistaIncidenciasPeriodo::query();
        $inc_c_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_c_v'])? 1:0;
        $inc_s_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_s_v'])? 1:0;
        $inc_ded = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_dec'])? 1:0;
        if ($usuario->listarTodo == null) {
            if ($usuario->getCoordinador) {
                $this->recursivoCoordinadores($usuario->id_usuario);
                $this->coords[] = $usuario->getCoordinador->id;
                $coords         = array_values(array_unique($this->coords));
                $incidencias->whereIn('coordinador_id', $coords);
            }
        }
        if($area != 'ADMIN'){
            if ($inc_s_v == 1)
                $incidencias->where('venta','=',0);
            if ($inc_c_v == 1)
                $incidencias->where('venta','>',0);
            if ($inc_ded == 1)
                $incidencias->where('tipo_incidencia','=','DEDUCCION');
        }
        switch ($area){
            case 'ESP':
                    $incidencias->where('estatus','=','POR ENVIAR')->select();
                break;
            case 'RH':
                $incidencias->where('area_solicitante','<>','Especial')
                    ->where('estatus','=','POR ENVIAR')->select();
                break;
            case 'DIR':
                $incidencias->where('area_solicitante','<>','Especial')
                    ->where('estatus','=','POR ENVIAR')->select();
                break;
            case 'ADMIN':
                $incidencias->where('estatus','=','POR ENVIAR')
                    ->select();
                break;
            case 'ENTR':
                $incidencias->where('area_solicitante','<>','Especial')
                    ->where('estatus','=','POR ENVIAR')->select();
                break;
            default:
                $incidencias->where('id_solicitante','=',auth()->user()->id_usuario)
                    ->where('estatus','=','POR ENVIAR')->select();
                break;
        }
        return DataTables::of($incidencias)
            ->whitelist(['empleado', 'solicitante', 'tipo_incidencia', 'id',
                'fecha_solicitud', 'fecha_inicio', 'fecha_fin', 'id_lote','descargado','emp_id'])
            ->make(true);
    }

    public function getIncidenciasLote()
    {
        $incidencias = DB::table('vista_incidencias_sin_lote')->select()->where('estatus','=','POR ENVIAR')->orWhere('estatus','=','ENVIADO');
        return DataTables::of($incidencias)
            ->whitelist(['id', 'empleado', 'tipo_incidencia', 'fecha_solicitud', 'fecha_inicio', 'fecha_fin', 'duracion, monto', 'motivo', 'solicitante', 'Autorizado_RH', 'Autorizado_DIR', 'Autorizado_Capital'])
            ->make(true);
    }


    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getBitacoraIncidentes(Request $request)
    {
        $id = $request->id;
        $tipo = $request->tipo;
        $bitacoras = DB::table('bitacoras as bi')
            ->select(DB::raw(
                "bi.id 'CLAVE',
                 bi.tipo 'TIPO',
                 bi.id_tabla 'REGISTRO' ,
                 us.nombre 'USUARIO',
                 CONCAT_WS(' ',em.empleado_nombre,em.empleado_apaterno,em.empleado_amaterno) 'EMPLEADO',
                 bi.mensaje 'DETALLES',
                 bi.fecha 'FECHA',
                 bi.hora 'HORA',
                 bi.status_auth 'ESTADO'"))
            ->leftJoin('incore.usuarios as us','us.id_usuario','=','bi.id_usuario_login')
            ->leftJoin('incore.empleados as em','em.empleado_id','=','bi.id_empleado')
            ->where('bi.id_tabla','=',$id)
            ->where('bi.tipo','=',$tipo)
            ->get();
        return DataTables::of($bitacoras)
            ->whitelist(['CLAVE', 'TIPO', 'REGISTRO', 'USUARIO', 'EMPLEADO', 'DETALLES', 'FECHA', 'HORA', 'ESTADO'])
            ->make(true);
    }


    /**
     * @param Request $request
     * @return array
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function AuthIncidencia(Request $request)
    {
        $this->authorize('access',[User::class, 'aut_cancel_incidencia']);
        try{
            DB::begintransaction();
            $mensaje    = "";
            $Tipo_bita  = "incidencia";
            $rol        = auth()->user()->getRol->Rol;
            $incidencia = Incidencias::find($request->id);
            $tipo       = IncidenciasCatalogo::find($incidencia->id_incidencia_tipo);
            $type       = $request->tipo;
            $accion     = $request->accion;
            GlobalModel::SetBitacoras("$Tipo_bita", $incidencia->id, auth()->user()->id_usuario, $incidencia->id_empleado, "$mensaje", "$accion");
            if ($accion == 'autorizar') {
                switch ($type){
                    case 'deduc':
                        $incidencia->auth_rh           = $this->date;
                        $incidencia->id_rh_auth        = auth()->user()->id_usuario;
                        break;
                    case 's_venta':
                        $incidencia->auth_direccion    = $this->date;
                        $incidencia->id_direccion_auth = auth()->user()->id_usuario;
                        break;
                    case 'c_venta':
                        $incidencia->id_auth_venta     = auth()->user()->id_usuario;
                        $incidencia->auth_venta        = $this->date;
                        break;
                    case 'ADMIN':
                        $incidencia->id_direccion_auth = auth()->user()->id_usuario;
                        $incidencia->id_rh_auth        = auth()->user()->id_usuario;
                        $incidencia->auth_capital      = $this->date;
                        $incidencia->auth_direccion    = $this->date;
                        $incidencia->auth_rh           = $this->date;
                        break;
                }
            } else {
                switch ($type){
                    case 'deduc':
                        $incidencia->auth_rh       = $this->date;
                        $incidencia->id_rh_auth    = auth()->user()->id_usuario;
                        $incidencia->status_auth   = 'CANCELAR';
                        $incidencia->area_cancelar = $rol;
                        break;
                    case 's_venta':
                        $incidencia->auth_direccion    = $this->date;
                        $incidencia->id_direccion_auth = auth()->user()->id_usuario;
                        $incidencia->status_auth       = 'CANCELAR';
                        $incidencia->area_cancelar     = $rol;
                        break;
                    case 'c_venta':
                        $incidencia->id_auth_venta     = auth()->user()->id_usuario;
                        $incidencia->auth_venta        = $this->date;
                        $incidencia->status_auth       = 'CANCELAR';
                        $incidencia->area_cancelar     = $rol;
                        break;
                    case 'ADMIN':
                        $incidencia->auth_capital      = $this->date;
                        $incidencia->auth_rh           = $this->date;
                        $incidencia->auth_direccion    = $this->date;
                        $incidencia->id_direccion_auth = auth()->user()->id_usuario;
                        $incidencia->id_rh_auth        = auth()->user()->id_usuario;
                        $incidencia->status_auth       = 'CANCELAR';
                        $incidencia->area_cancelar     = $rol;
                        break;
                }
            }
            if($incidencia->status_auth != 'CANCELAR')
                $incidencia->status_auth = 'POR ENVIAR';
            $incidencia->save();
            DB::commit();
            $response = [
                'ok'   => true,
                'data' => $incidencia
            ];
            return $response;
        }catch (\Exception $e){
            DB::rollBack();
            return [
                'ok'=>false,
                "data"=>$e
            ];
        }
    }

    /**
     * @param Request $request
     * @return \Exception|\Illuminate\Http\JsonResponse
     * @throws \Exception
     */
    public function voboFinal(Request $request){
        try{
            DB::beginTransaction();
            $incidencia             = Incidencias::find($request->id);
            $nombre                 = "vobo_final_" . $incidencia->id;
            $incidencia->vobo_final = Upload::uploadFile('incidencias/'.$nombre,'vobo_final', $incidencia, $nombre);
            $incidencia->save();
            DB::commit();
            return response()->json([
                'ok' => true,
                'data' => $incidencia
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

}
