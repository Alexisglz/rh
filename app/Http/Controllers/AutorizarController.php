<?php

namespace App\Http\Controllers;

use App\Events\IncidenciasEvents;
use App\GlobalModel;
use App\Helpers\Upload;
use App\Incidencias;
use App\Models\CatalogoCoordinadores;
use App\Models\IncidenciasCatalogo;
use App\User;
use DB;
use Illuminate\Http\Request;
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
                    if ($item->getEmpleado == null)
                        continue;
                    if ($item->getEmpleado->empleado_id == null)
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

    public function index(Request $request)
    {
        $id = isset($request->id) ? $request->id:0;
        $this->authorize('access',[User::class, 'listado_validar_inci']);
        return view('incidencias.autorizar',[
            'id' => $id
        ]);
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
            $rol        = auth()->user()->getRol->Rol;
            $incidencia = Incidencias::find($request->id);
            $accion     = $request->accion;
            $estatus    = 'POR VALIDAR DIRECCION';
            if ($accion == 'autorizar') {
                $incidencia->auth_gerente    = $this->date;
                $incidencia->id_gerente_auth = auth()->user()->id_usuario;
                $incidencia->status_auth     = $estatus;
            } else {
                $estatus                     = 'CANCELAR';
                $incidencia->auth_rh         = $this->date;
                $incidencia->id_gerente_auth = auth()->user()->id_usuario;
                $incidencia->status_auth     = $estatus;
                $incidencia->area_cancelar   = $rol;
            }
            $incidencia->save();
            $usuario_validar = auth()->user()->nombre.' '.auth()->user()->apellido;
            GlobalModel::SetBitacoras("incidencia", $incidencia->id, auth()->user()->id_usuario, $incidencia->id_empleado, "$usuario_validar VALIDO", "$estatus");
            DB::commit();
            if($accion == 'autorizar')
                event(new IncidenciasEvents($incidencia, 'autorizar'));
            else
                event(new IncidenciasEvents($incidencia, 'cancelar'));
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
