<?php

namespace App\Http\Controllers;

use App\BajaComentarios;
use App\Empleados;
use App\Events\BajasEvents;
use App\GlobalModel;
use App\Models\EmpleadoCodigoMovimiento;
use App\Models\MovimientoRecurso;
use App\Models\MovimientosCoordinador;
use App\Models\MovimientosProyecto;
use App\Models\MovimientosPuesto;
use App\Models\MovimientosSueldo;
use App\SolBajaNomina;
use App\solicitudbaja;
use App\User;
use DB;
use Illuminate\Http\Request;
use Storage;


class BajasController extends Controller
{

    protected $rules = [
        'grupo' => ['required']
    ];


    public function index()
    {
        $this->authorize('access',[User::class, 'listado_bajas']);
        return view('bajas.index');
    }



    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function getDataBajas()
    {
        $sol = DB::select(DB::raw("call rh.sp_Solicitud_Baja();"));
        //$sol = DB::table('solicitud_alta')->select('id','nombre','apaterno','amaterno','fecha_inicio','puesto');
        return DataTables::of($sol)
            /*->addColumn('action', function ($sol) {
                $btn = "";
                $btn .= '<button onClick="editarCliente('.$sol->id.')" class="btn btn-xs btn-primary" style="margin-rigth: 5px;margin-left: 5px"><i class="fa fa-pencil-square-o"></i></button>';
                $btn .= '<button onClick="darBajaCliente('.$sol->id.')" class="btn btn-xs btn-danger" style="margin-rigth: 5px;margin-left: 5px"><i class="fa fa-trash-o"></i></button>';
                $btn .= '<button onClick="autorizaCliente('.$sol->id.')" class="auth btn btn-xs btn-success" style="margin-rigth: 5px;margin-left: 5px"> <i class="fa fa-thumbs-up nav-icon"></i></button>';
                // $btn .= '<input type="checkbox" checked data-toggle="toggle" data-onstyle="success">';
                return $btn;
            })*/
            ->make(true);
    }

    public function EliminarSolicitud($id)
    {
        $bajas = new SolBajaNomina;;
        $bajas_temp = $bajas::find($id);
        $comentarios = BajaComentarios::where('id_baja','=',$bajas_temp->id)->delete();
        $bajas_temp->delete();
        $data = array(
            'success' => 'success'
        );
        //Devolvemos el array pasado a JSON como objeto
        return json_encode($data, JSON_FORCE_OBJECT);
    }

    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // 
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function bajaDefNom(Request $request)
    {
        $conn = DB::connection('incore');
        $conn->beginTransaction();
        try{
            $id                           = $request->input('id');
            $empleado_fecha_baja          = $request->input('fecha_baja_definitiva');
            $obs_baja_def                 = $request->input('observaciones');

            $ObjSolBajaNom                = new SolBajaNomina;
            $DataBajaNom                  = $ObjSolBajaNom::find($id);
            $DataBajaNom->baja_definitiva = $empleado_fecha_baja;
            $DataBajaNom->obs_baja_def    = $obs_baja_def;
            $DataBajaNom->save();

            $empleado                      = Empleados::find($DataBajaNom->id_empleado);
            $empleado->empleado_fecha_baja = $empleado_fecha_baja;
            $empleado->baja_rh             = $empleado_fecha_baja;
            $empleado->empleado_estatus    = 'INACTIVO';
            $empleado->save();

            $mov_recurso = MovimientoRecurso::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_recurso) > 0){
                foreach ($mov_recurso as $item){
                    if ($item->fecha_baja == null || $item->fecha_baja_rh == null){
                        $item->fecha_baja    = date('Y-m-d H:i:s');
                        $item->fecha_baja_rh = date('Y-m-d H:i:s');
                        $item->save();
                    }
                }
            }
            $mov_proyect = MovimientosProyecto::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_proyect) > 0){
                foreach ($mov_proyect as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = date('Y-m-d H:i:s');
                        $item->save();
                    }
                }
            }
            $mov_coordin = MovimientosCoordinador::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_coordin) > 0){
                foreach ($mov_coordin as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = date('Y-m-d H:i:s');
                        $item->save();
                    }
                }
            }
            $mov_sueldo  = MovimientosSueldo::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_sueldo) > 0){
                foreach ($mov_sueldo  as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = date('Y-m-d H:i:s');
                        $item->save();
                    }
                }
            }
            $mov_puesto  = MovimientosPuesto::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_puesto) > 0){
                foreach ($mov_puesto  as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = date('Y-m-d H:i:s');
                        $item->save();
                    }
                }
            }
            $mov_cod_mov = EmpleadoCodigoMovimiento::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_cod_mov) > 0){
                foreach ($mov_cod_mov as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = date('Y-m-d H:i:s');
                        $item->save();
                    }
                }
            }

            $codigos = EmpleadoCodigoMovimiento::where('empleado_id', $empleado->empleado_id)->get();
            if (count($codigos) > 0){
                foreach ($codigos as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = date('Y-m-d H:i:s');
                        $item->save();
                    }
                }
            }
            $conn->commit();
            return response()->json([
                'ok' => true,
                'data'=>'Datos guardados'
            ]);
        }catch (\Exception $e){
            $conn->rollBack();
            return [
                'ok' => false,
                'data' => [$e]
            ];
        }
    }


    public function getBitacoraBaja($id)
    {
        $tal = explode("-", $id);
        $idregistro = $tal[0];
        $tiporegistro = $tal[1];
        $bitacoras = DB::select(DB::raw("call rh.sp_bitacoras_sistema($idregistro,$tiporegistro)"));
        return DataTables::of($bitacoras)
            ->whitelist(['CLAVE', 'TIPO', 'REGISTRO', 'USUARIO', 'EMPLEADO', 'DETALLES', 'FECHA', 'HORA', 'ESTADO'])
            ->make(true);
    }

    public function AutorizarSolicitud(Request $request)
    {
        $id_solicitante = $request->id_solicitante;
        $id_solicitud = $request->id_solicitud;
        $id_checkauth = $request->id_checkauth;
        $valorCheck = $request->valorCheck;

        // Guardar en bitacora
        $mensaje = 'Autorizar Solicitud';
        $Tipo_bita = 'solicitud_alta';
        $opcional = 'Autorizar solicitud';
        if (isset($id_checkauth) && $id_checkauth != 'x' && $id_checkauth != 'X') {
            $opcional = 'Autorizar ' . $id_checkauth;
        } else {
        }
        GlobalModel::SetBitacoras("$Tipo_bita", $id_solicitud, auth()->user()->id_usuario, 0, "'$mensaje'", "'$opcional'");
        $data = array(
            'id_solicitante' => $id_solicitante,
            'id_solicitud' => $id_solicitud,
            'id_checkauth' => $id_checkauth,
            'valorCheck' => $valorCheck
        );


        // Autorizar y actualizar solicitud
        $solicitud = DB::select(DB::raw("Call solicitudes_baja_nomina('$id_solicitante','$id_solicitud', '$id_checkauth', '$valorCheck');"));
        return DataTables::of($solicitud)
            ->whitelist(['MENSAJE'])
            ->make(true);
    }


    public function solicitudBaja(Request $request)
    {
        try{
            DB::beginTransaction();
            //$sol                    = new solicitudbaja;
            $sol                    = solicitudbaja::find($request->id_empleado);
            $area                   = auth()->user()->getRol->Descripcion;
            switch ($area){
                case 'Recursos Humanos':
                    $sol->fecha_emision     = $request->fecha_emision == "" ? null:$request->fecha_emision;
                    $sol->fecha_baja_sol    = $request->fecha_baja_sol == "" ? null:$request->fecha_baja_sol;
                    $sol->fecha_baja_nom    = $request->fecha_baja_nom == "" ? null:$request->fecha_baja_nom;
                    $sol->fecha_cita        = $request->fecha_cita == "" ? null:$request->fecha_cita;
                    $sol->baja_credencial   = $request->credencial;
                    $sol->pago_finiquito    = $request->pago_finiquito;
                    $sol->adeudos           = $request->adeudos;
                    $sol->tiempo_herra      = $request->retraso;
                    $sol->obs_herramientas  = $request->obs_herramientas;
                    break;
                case 'Proveedor':
                    $sol->pago_finiquito  = $request->pago_finiquito;
                    break;
                case 'Soporte IT':
                    $sol->baja_computo    = $request->computadora;
                    break;
                case 'Soporte Celular':
                    $sol->baja_celular     = $request->celular;
                    break;
                case 'Soporte Auto':
                    $sol->baja_auto       = $request->auto;
                    break;
                case 'Soporte Almacen':
                    $sol->baja_almacen    = $request->almacen;
                    break;
            }
            // $sol->id_empleado= $id_empleado;
            $sol->save();
            if ($request->adeudos != "" || $request->retraso != "" || $request->obs_herramientas){
                if ($area != 'Recursos Humanos'){
                    if (intval($request->id_comment) != 0)
                        $comentario                 = BajaComentarios::find($request->id_comment);
                    else
                        $comentario                 = new BajaComentarios();
                    $comentario->id_baja        = $sol->id;
                    $comentario->area           = $area;
                    $comentario->adeudo         = $request->adeudos;
                    $comentario->retraso        = $request->retraso;
                    $comentario->observaciones  = $request->obs_herramientas;
                    $comentario->save();
                }
            }
            //dd($comentario);
            //exit;
            DB::commit();
            return ["ok" => true];
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }


    public function getSolBaja($id)
    {
        //$id = $request->input('id');
        $sol = new solicitudbaja;
        $sol_temp = $sol::find($id);


        $data = array(
            'fecha_emision' => $sol_temp->fecha_emision,
            'fecha_baja_sol' => $sol_temp->fecha_baja_sol,
            'fecha_baja_nom' => $sol_temp->fecha_baja_nom,
            'fecha_cita' => $sol_temp->fecha_cita,
            'baja_computo' => $sol_temp->baja_auto,
            'baja_auto' => $sol_temp->baja_auto,
            'baja_almacen' => $sol_temp->baja_almacen,
            'baja_credencial' => $sol_temp->baja_credencial,
            'pago_finiquito' => $sol_temp->pago_finiquito,
            'adeudos' => $sol_temp->adeudos,
            'tiempo_herra' => $sol_temp->tiempo_herra,
            'obs_herramientas' => $sol_temp->obs_herramientas
        );
        //Devolvemos el array pasado a JSON como objeto
        return json_encode($data, JSON_FORCE_OBJECT);
    }

    public function getEstatusBaja(Request $request){
        try{
            //$bajas = SolBajaNomina::where('id_empleado','=',$request->id)->whereNull('baja_definitiva')->first();
            $bajas = DB::table('solicitudes_baja_nomina')
                ->where('id_empleado','=',$request->id)
                ->whereNull('deleted_at')
                ->whereNull('baja_definitiva')->get();
            return response()->json([
                'ok' => true,
                'data' => $bajas
            ]);
        }catch (\Exception $e){
            return $e;
        }
    }

    public function getBaja(Request $request){
        $baja = solicitudbaja::find($request->id);
        $comments = BajaComentarios::where('id_baja',$baja->id)->where('area',auth()->user()->getRol->Descripcion)->first();
        $data = array(
            'id'                => $baja->id,
            'id_empleado'       => $baja->id_empleado,
            'fecha_baja_sol'    => $baja->fecha_baja_sol,
            'fecha_baja_nom'    => $baja->fecha_baja_nom,
            'fecha_cita'        => $baja->fecha_cita,
            'baja_computo'      => $baja->baja_computo,
            'baja_auto'         => $baja->baja_auto,
            'baja_almacen'      => $baja->baja_almacen,
            'baja_credencial'   => $baja->baja_credencial,
            'baja_celular'      => $baja->baja_celular,
            'pago_finiquito'    => $baja->pago_finiquito,
            'fecha_pago_fin'    => $baja->fecha_pago_fin,
            'baja_definitiva'   => $baja->baja_definitiva,
            'adeudos'           => $baja->adeudos,
            'tiempo_herra'      => $baja->tiempo_herra,
            'status'            => $baja->status,
            'incidencias'       => $baja->incidencias,
            'observaciones'     => $baja->observaciones,
            'motivo'            => $baja->motivo,
            'conocimiento_baja' => $baja->conocimiento_baja,
            'vobo_jefe'         => $baja->vobo_jefe,
            'solicitante'       => $baja->solicitante,
            'fecha_emision'     => $baja->fecha_emision,
            'obs_baja_def'      => $baja->obs_baja_def,
            'obs_herramientas'  => $baja->obs_herramientas,
            'comments'          => $comments!=null ? $comments:0,
            'area'              => auth()->user()->getRol->Descripcion,
        );
        return response()->json($data);
    }

    public function saveFechaCita(Request $request){
        $this->authorize('access',[User::class, 'cita_baja']);
        try{
            DB::beginTransaction();
            $sol_baja             = SolBajaNomina::find($request->id);
            $sol_baja->fecha_cita = $request->cita;
            $sol_baja->save();
            DB::commit();
            event(new BajasEvents($sol_baja, 'confirmar_herra'));
            return response()->json([
                "ok"    => true,
                "data"  => $sol_baja->id
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

    public function bajaComputo(Request $request){
        $this->authorize('access',[User::class, 'baja_computo']);
        try{
            DB::beginTransaction();
            $sol_baja               = solicitudbaja::find($request->id);
            $sol_baja->baja_computo = "true";
            $sol_baja->save();
            DB::commit();
            return response()->json([
                "ok"    => true,
                "data"  => $sol_baja->id
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

    public function bajaCel(Request $request){
        $this->authorize('access',[User::class, 'baja_celular']);
        try{
            DB::beginTransaction();
            $sol_baja               = solicitudbaja::find($request->id);
            $sol_baja->baja_celular = "true";
            $sol_baja->save();
            DB::commit();
            return response()->json([
                "ok"    => true,
                "data"  => $sol_baja->id
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

    public function bajaAuto(Request $request){
        $this->authorize('access',[User::class, 'baja_coche']);
        try{
            DB::beginTransaction();
            $sol_baja            = solicitudbaja::find($request->id);
            $sol_baja->baja_auto = "true";
            $sol_baja->save();
            DB::commit();
            return response()->json([
                "ok"    => true,
                "data"  => $sol_baja->id
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

    public function bajaHerra(Request $request){
        $this->authorize('access',[User::class, 'baja_herramientas']);
        try{
            DB::beginTransaction();
            $sol_baja               = solicitudbaja::find($request->id);
            $sol_baja->baja_almacen = "true";
            $sol_baja->save();
            DB::commit();
            return response()->json([
                "ok"    => true,
                "data"  => $sol_baja->id
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

    public function bajaCred(Request $request){
        $this->authorize('access',[User::class, 'baja_credencial']);
        try{
            DB::beginTransaction();
            $sol_baja                  = solicitudbaja::find($request->id);
            $sol_baja->baja_credencial = "true";
            $sol_baja->save();
            DB::commit();
            return response()->json([
                "ok"    => true,
                "data"  => $sol_baja->id
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

    public function pagoFin(Request $request){
        $this->authorize('access',[User::class, 'baja_rh']);
        try{
            DB::beginTransaction();
            $sol_baja                  = solicitudbaja::find($request->id);
            $sol_baja->pago_finiquito  = "true";
            $sol_baja->save();
            DB::commit();
            return response()->json([
                "ok"    => true,
                "data"  => $sol_baja->id
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

}