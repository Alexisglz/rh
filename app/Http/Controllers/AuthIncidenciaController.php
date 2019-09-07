<?php

namespace App\Http\Controllers;

use App\Events\IncidenciasEvents;
use App\GlobalModel;
use App\Incidencias;
use App\Models\IncidenciaPeriodo;
use App\User;
use App\VistaIncidencias;
use DB;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class AuthIncidenciaController extends Controller
{

    /**
     * @var false|string
     */
    private $date;

    public function __construct()
    {
        $this->date = date('Y-m-d H:i:s');
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

    public function index(){
        $this->authorize('access',[User::class, 'listado_autorizar']);
        $periodo = IncidenciaPeriodo::where('fecha_inicio','<=', date('Y-m-d'))
            ->where('fecha_envio','>=', $this->date)->first();
        return view('incidencias.validaciones.directivo',['periodo'=>$periodo]);
    }

    public function getIncidencias(){
        $user    = auth()->user();
        $area    = $user->getRol->Rol;
        $inc_c_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_c_v'])? 1:0;
        $inc_s_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_s_v'])? 1:0;
        $inc_ded = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_dec'])? 1:0;
        $todas   = auth()->user()->can('access',[\App\User::class,'todas_incidencias'])? 1:0;
        $periodo = IncidenciaPeriodo::where('fecha_inicio','<=', $this->date)
            ->where('fecha_envio','>=', $this->date)->first();
        $incidencias = VistaIncidencias::query();
        if($area != 'ADMIN' && $area != 'ESP'){
            if ($todas == 1){
                $incidencias->where('estatus','POR VALIDAR DIRECCION');
            }
            else{
                if ($inc_s_v == 1)
                    $incidencias->orWhere('venta','=',0)->where('tipo_incidencia', '!=','DEDUCCION')->where('estatus','POR VALIDAR DIRECCION');
                if ($inc_c_v == 1)
                    $incidencias->orWhere('venta','>',0)->where('tipo_incidencia', '!=','DEDUCCION')->where('estatus','POR VALIDAR DIRECCION');
                if ($inc_ded == 1)
                    $incidencias->orWhere('tipo_incidencia','=','DEDUCCION')->where('estatus','POR VALIDAR DIRECCION');
            }
        }
        else{
            $incidencias->where('estatus','POR VALIDAR DIRECCION');
        }
        if($periodo)
            $incidencias->whereBetween('fecha_solicitud',[$periodo->fecha_inicio, $periodo->fecha_fin])->get();
        else
            $incidencias = [];
        $sql = $this->getRealQuery($incidencias);
        return DataTables::of($incidencias)
            ->addColumn('margen', function (VistaIncidencias $incidencias){
                $costo_actual   = $incidencias->costo_viaticos+$incidencias->costo_nomina+$incidencias->costo_herramienta;
                $valor_proyecto = $incidencias->venta;
                $delta          = $valor_proyecto-$costo_actual;
                $margen         = ($valor_proyecto!=0)?($delta/$valor_proyecto)*100:0;
                $formatted      = number_format($margen, 2, '.', ',');
                return $formatted;
            })
            ->with(['sql' => $sql])->make(true);
    }

    public function validarMasivo(Request $request){
        try{
            DB::beginTransaction();
            $incidencias = $request->incidencias;
            $role        = auth()->user()->getRol->Rol;
            foreach ($incidencias as $incidencia){
                $model = Incidencias::find($incidencia[0]);
                $view = VistaIncidencias::find($incidencia[0]);
                $accion = '';
                if ($incidencia[1] == "true"){
                    $accion = 'autorizar';
                    if ($view->tipo_incidencia == 'DEDUCCION'){
                        $model->auth_rh           = $this->date;
                        $model->id_rh_auth        = auth()->user()->id_usuario;
                    }
                    elseif($view->venta > 0 && $view->tipo_incidencia != 'DEDUCCION'){
                        $model->id_auth_venta     = auth()->user()->id_usuario;
                        $model->auth_venta        = $this->date;
                    }
                    elseif($view->venta <= 0 && $view->tipo_incidencia != 'DEDUCCION'){
                        $model->auth_direccion    = $this->date;
                        $model->id_direccion_auth = auth()->user()->id_usuario;
                    }
                }
                else{
                    $accion = 'cancelar';
                    if ($view->tipo_incidencia == 'DEDUCCION'){
                        $model->auth_rh       = $this->date;
                        $model->id_rh_auth    = auth()->user()->id_usuario;
                        $model->status_auth   = 'CANCELAR';
                        $model->area_cancelar = $role;
                    }
                    elseif($view->venta > 0 && $view->tipo_incidencia != 'DEDUCCION'){
                        $model->id_auth_venta     = auth()->user()->id_usuario;
                        $model->auth_venta        = $this->date;
                        $model->status_auth       = 'CANCELAR';
                        $model->area_cancelar     = $role;
                    }
                    elseif($view->venta <= 0 && $view->tipo_incidencia != 'DEDUCCION'){
                        $model->auth_direccion    = $this->date;
                        $model->id_direccion_auth = auth()->user()->id_usuario;
                        $model->status_auth       = 'CANCELAR';
                        $model->area_cancelar     = $role;
                    }
                }
                if($model->status_auth != 'CANCELAR')
                    $model->status_auth = 'POR ENVIAR';
                $model->save();
                event(new IncidenciasEvents($model, $accion));
                GlobalModel::SetBitacoras("incidencia", $model->id, auth()->user()->id_usuario, $model->id_empleado, "La incidencia paso a ser: $accion", "$accion");
            }
            DB::commit();
            return response()->json([
                'ok' => true,
                'data' => []
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
