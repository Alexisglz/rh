<?php

namespace App\Http\Controllers;

use App\BajaComentarios;
use App\Classes\Poliza;
use App\Classes\RentaFijaETL;
use App\Classes\TaskBased;
use App\Empleados;
use App\Events\BajasEvents;
use App\GlobalModel;
use App\Models\EmpleadoCodigoMovimiento;
use App\Models\MovimientoRecurso;
use App\Models\MovimientosCoordinador;
use App\Models\MovimientosProyecto;
use App\Models\MovimientosPuesto;
use App\Models\SolicitudesBitacoraBajas;
use App\SolBajaNomina;
use App\solicitudbaja;
use App\User;
use DB;
use Exception;
use Illuminate\Http\Request;


class BajasController extends Controller
{

    protected $rules = [
        'grupo' => ['required']
    ];


    public function index(Request $request)
    {
        $id = isset($request->id) ? $request->id : 0;
        $this->authorize('access', [User::class, 'listado_bajas']);
        return view('bajas.index', [
            'id' => $id
        ]);
    }

    public function EliminarSolicitud(Request $request)
    {
        try{
            DB::beginTransaction();
            $baja       = SolBajaNomina::find($request->id);
            $solicitante = User::find($baja->solicitante);
            $correos = [];
            if ($solicitante){
                $correos[] = $solicitante->correo;
            }
            $rh = User::where('id_area',1)->where('estatus','ACTIVO')->get();
            if ($rh){
                foreach ($rh as $item){
                    $correos[] = $item->correo;
                }
            }
            BajaComentarios::where('id_baja', '=', $baja->id)->delete();
            event(new BajasEvents($baja, 'cancel_baja',$correos));
            $baja->delete();
            DB::commit();
            return response()->json([
                'ok' => true,
                'data' => 'success'
            ]);
        }catch (Exception $e){
            DB::rollBack();
            return response()->json([
                'ok' => false,
                'data' => $e->getMessage()
            ]);
        }
    }


    public function bajaDefNom(Request $request)
    {
        $conn = DB::connection('incore');
        $conn->beginTransaction();
        try {
            $id = $request->input('id');
            $empleado_fecha_baja = $request->input('fecha_baja_definitiva');
            $obs_baja_def = $request->input('observaciones');

            $baja                  = SolBajaNomina::find($id);
            $baja->baja_definitiva = $empleado_fecha_baja;
            $baja->obs_baja_def    = $obs_baja_def;
            $baja->save();

            $empleado                      = Empleados::find($baja->id_empleado);
            $empleado->empleado_fecha_baja = $baja->fecha_baja_nom;
            $empleado->baja_rh             = $baja->fecha_cita;
            $empleado->empleado_estatus    = 'INACTIVO';
            $empleado->save();

            $mov_recurso = MovimientoRecurso::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_recurso) > 0){
                foreach ($mov_recurso as $item){
                    if ($item->fecha_baja == null || $item->fecha_baja_rh == null){
                        $item->fecha_baja    = $baja->fecha_baja_nom;
                        $item->fecha_baja_rh = $baja->fecha_cita;
                        $item->save();
                    }
                }
            }
            $mov_proyect = MovimientosProyecto::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_proyect) > 0){
                foreach ($mov_proyect as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = $baja->fecha_baja_nom;
                        $item->save();
                        switch ($item->servicio){
                            case 'TKBS':
                                TaskBased::close($empleado->empleado_id);
                                break;
                            case 'SERV':
                                RentaFijaETL::close($empleado->empleado_id);
                                break;
                            case 'POLZ':
                                Poliza::close($empleado->empleado_id);
                                break;
                        }
                    }
                }
            }
            $mov_coordin = MovimientosCoordinador::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_coordin) > 0){
                foreach ($mov_coordin as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = $baja->fecha_baja_nom;
                        $item->save();
                    }
                }
            }
            $mov_sueldo  = MovimientosSueldo::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_sueldo) > 0){
                foreach ($mov_sueldo  as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = $baja->fecha_baja_nom;
                        $item->save();
                    }
                }
            }
            $mov_puesto  = MovimientosPuesto::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_puesto) > 0){
                foreach ($mov_puesto  as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = $baja->fecha_baja_nom;
                        $item->save();
                    }
                }
            }
            $mov_cod_mov = EmpleadoCodigoMovimiento::where('empleado_id', $empleado->empleado_id)->get();
            if (count($mov_cod_mov) > 0){
                foreach ($mov_cod_mov as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = $baja->fecha_baja_nom;
                        $item->save();
                    }
                }
            }

            $codigos = EmpleadoCodigoMovimiento::where('empleado_id', $empleado->empleado_id)->get();
            if (count($codigos) > 0){
                foreach ($codigos as $item){
                    if ($item->fecha_fin == null ){
                        $item->fecha_fin = $baja->fecha_baja_nom;
                        $item->save();
                    }
                }
            }
            $conn->commit();
            return response()->json([
                'ok' => true,
                'data' => 'Datos guardados'
            ]);
        } catch (\Exception $e) {
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
        try {
            DB::beginTransaction();
            //$sol                    = new solicitudbaja;
            $sol = solicitudbaja::find($request->id_empleado);
            $area = auth()->user()->getRol->Descripcion;
            switch ($area) {
                case 'Recursos Humanos':
                    $sol->fecha_emision = $request->fecha_emision == "" ? null : $request->fecha_emision;
                    $sol->fecha_baja_sol = $request->fecha_baja_sol == "" ? null : $request->fecha_baja_sol;
                    $sol->fecha_baja_nom = $request->fecha_baja_nom == "" ? null : $request->fecha_baja_nom;
                    $sol->fecha_cita = $request->fecha_cita == "" ? null : $request->fecha_cita;
                    $sol->baja_credencial = $request->credencial;
                    $sol->pago_finiquito = $request->pago_finiquito;
                    $sol->adeudos = $request->adeudos;
                    $sol->tiempo_herra = $request->retraso;
                    $sol->obs_herramientas = $request->obs_herramientas;
                    break;
                case 'Proveedor':
                    $sol->pago_finiquito = $request->pago_finiquito;
                    break;
                case 'Soporte IT':
                    $sol->baja_computo = $request->computadora;
                    break;
                case 'Soporte Celular':
                    $sol->baja_celular = $request->celular;
                    break;
                case 'Soporte Auto':
                    $sol->baja_auto = $request->auto;
                    break;
                case 'Soporte Almacen':
                    $sol->baja_almacen = $request->almacen;
                    break;
            }
            // $sol->id_empleado= $id_empleado;
            $sol->save();
            if ($request->adeudos != "" || $request->retraso != "" || $request->obs_herramientas) {
                if ($area != 'Recursos Humanos') {
                    if (intval($request->id_comment) != 0)
                        $comentario = BajaComentarios::find($request->id_comment);
                    else
                        $comentario = new BajaComentarios();
                    $comentario->id_baja = $sol->id;
                    $comentario->area = $area;
                    $comentario->adeudo = $request->adeudos;
                    $comentario->retraso = $request->retraso;
                    $comentario->observaciones = $request->obs_herramientas;
                    $comentario->save();
                }
            }
            //dd($comentario);
            //exit;
            DB::commit();
            return ["ok" => true];
        } catch (\Exception $e) {
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

    public function getEstatusBaja(Request $request)
    {
        try {
            //$bajas = SolBajaNomina::where('id_empleado','=',$request->id)->whereNull('baja_definitiva')->first();
            $bajas = DB::table('solicitudes_baja_nomina')
                ->where('id_empleado', '=', $request->id)
                ->whereNull('deleted_at')
                ->whereNull('baja_definitiva')->get();
            return response()->json([
                'ok' => true,
                'data' => $bajas
            ]);
        } catch (\Exception $e) {
            return $e;
        }
    }

    public function getBaja(Request $request)
    {
        $baja = solicitudbaja::find($request->id);
        $comments = BajaComentarios::where('id_baja', $baja->id)->where('area', auth()->user()->getRol->Descripcion)->first();
        $data = array(
            'id' => $baja->id,
            'id_empleado' => $baja->id_empleado,
            'fecha_baja_sol' => $baja->fecha_baja_sol,
            'fecha_baja_nom' => $baja->fecha_baja_nom,
            'fecha_cita' => $baja->fecha_cita,
            'baja_computo' => $baja->baja_computo,
            'baja_auto' => $baja->baja_auto,
            'baja_almacen' => $baja->baja_almacen,
            'baja_credencial' => $baja->baja_credencial,
            'baja_celular' => $baja->baja_celular,
            'pago_finiquito' => $baja->pago_finiquito,
            'fecha_pago_fin' => $baja->fecha_pago_fin,
            'baja_definitiva' => $baja->baja_definitiva,
            'adeudos' => $baja->adeudos,
            'tiempo_herra' => $baja->tiempo_herra,
            'status' => $baja->status,
            'incidencias' => $baja->incidencias,
            'observaciones' => $baja->observaciones,
            'motivo' => $baja->motivo,
            'conocimiento_baja' => $baja->conocimiento_baja,
            'vobo_jefe' => $baja->vobo_jefe,
            'solicitante' => $baja->solicitante,
            'fecha_emision' => $baja->fecha_emision,
            'obs_baja_def' => $baja->obs_baja_def,
            'obs_herramientas' => $baja->obs_herramientas,
            'comments' => $comments != null ? $comments : 0,
            'area' => auth()->user()->getRol->Descripcion,
        );
        return response()->json($data);
    }

    public function saveFechaCita(Request $request)
    {
        $this->authorize('access', [User::class, 'cita_baja']);
        try {
            DB::beginTransaction();
            $sol_baja = SolBajaNomina::find($request->id);
            $sol_baja->fecha_cita = $request->cita;
            $sol_baja->fecha_baja_nom = $request->fecha_baja_nom;
            $sol_baja->obs_cita = $request->obs;
            $sol_baja->save();
            $empleado          = Empleados::find($sol_baja->id_empleado);
            $empleado->baja_rh = $sol_baja->fecha_cita;
            $empleado->save();
            $mov_rec = MovimientoRecurso::where('empleado_id', $empleado->empleado_id)->whereNull('fecha_baja_rh')->first();
            if ($mov_rec){
                $mov_rec->fecha_baja_rh = $sol_baja->fecha_cita;
                $mov_rec->save();
            }
            DB::commit();
            event(new BajasEvents($sol_baja, 'confirmar_herra'));
            return response()->json([
                "ok" => true,
                "data" => $sol_baja->id
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return $e;
        }
    }

    public function bajaComputo(Request $request)
    {
        $this->authorize('access', [User::class, 'baja_computo']);
        try {
            DB::beginTransaction();
            $sol_baja = solicitudbaja::find($request->id);
            $bit = new SolicitudesBitacoraBajas();

            $sol_baja->baja_computo = "true";
            $sol_baja->obs_compu = $request->obs;
            $sol_baja->adeudo_compu = $request->cantidad;

            $bit->solicitud_id = $request->id;
            $bit->comentario = $request->obs;
            $bit->log       = date('Y-m-d H:i:s');
            $bit->user_log  = auth()->user()->id_usuario;

            $sol_baja->save();
            $bit->save();

            DB::commit();
            return response()->json([
                "ok" => true,
                "data" => $sol_baja->id
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return $e;
        }
    }

    public function bajaCel(Request $request)
    {
        $this->authorize('access', [User::class, 'baja_celular']);
        try {
            DB::beginTransaction();
            $sol_baja = solicitudbaja::find($request->id);
            $bit = new SolicitudesBitacoraBajas();

            $sol_baja->baja_celular = "true";
            $sol_baja->obs_cel = $request->obs;
            $sol_baja->adeudo_cel = $request->cantidad;

            $bit->solicitud_id = $request->id;
            $bit->comentario = $request->obs;
            $bit->log = date('Y-m-d H:i:s');
            $bit->user_log  = auth()->user()->id_usuario;

            $sol_baja->save();
            $bit->save();
            DB::commit();
            return response()->json([
                "ok" => true,
                "data" => $sol_baja->id
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return $e;
        }
    }

    public function bajaAuto(Request $request)
    {
        $this->authorize('access', [User::class, 'baja_coche']);
        try {
            DB::beginTransaction();
            $sol_baja = solicitudbaja::find($request->id);
            $bit = new SolicitudesBitacoraBajas();

            $sol_baja->baja_auto = "true";
            $sol_baja->obs_auto = $request->obs;
            $sol_baja->adeudo_auto = $request->cantidad;

            $bit->solicitud_id = $request->id;
            $bit->comentario = $request->obs;
            $bit->log = date('Y-m-d H:i:s');
            $bit->user_log  = auth()->user()->id_usuario;

            $sol_baja->save();
            $bit->save();
            DB::commit();
            return response()->json([
                "ok" => true,
                "data" => $sol_baja->id
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return $e;
        }
    }

    public function bajaHerra(Request $request)
    {
        $this->authorize('access', [User::class, 'baja_herramientas']);
        try {
            DB::beginTransaction();
            $sol_baja = solicitudbaja::find($request->id);
            $bit = new SolicitudesBitacoraBajas();

            $sol_baja->baja_almacen = "true";
            $sol_baja->obs_alma = $request->obs;
            $sol_baja->adeudo_alma = $request->cantidad;

            $bit->solicitud_id = $request->id;
            $bit->comentario = $request->obs;
            $bit->log = date('Y-m-d H:i:s');
            $bit->user_log  = auth()->user()->id_usuario;

            $sol_baja->save();
            $bit->save();
            DB::commit();
            return response()->json([
                "ok" => true,
                "data" => $sol_baja->id
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return $e;
        }
    }

    public function bajaCred(Request $request)
    {
        $this->authorize('access', [User::class, 'baja_credencial']);
        try {
            DB::beginTransaction();
            $sol_baja = solicitudbaja::find($request->id);
            $bit = new SolicitudesBitacoraBajas();

            $sol_baja->baja_credencial = "true";
            $sol_baja->obs_cred = $request->obs;
            $sol_baja->adeudo_cred = $request->cantidad;

            $bit->solicitud_id = $request->id;
            $bit->comentario = $request->obs;
            $bit->log = date('Y-m-d H:i:s');
            $bit->user_log  = auth()->user()->id_usuario;


            $sol_baja->save();
            $bit->save();
            DB::commit();
            return response()->json([
                "ok" => true,
                "data" => $sol_baja->id
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return $e;
        }
    }

    public function pagoFin(Request $request)
    {
        $this->authorize('access', [User::class, 'baja_rh']);
        try {
            DB::beginTransaction();
            $sol_baja = solicitudbaja::find($request->id);
            $sol_baja->pago_finiquito = "true";
            $sol_baja->save();
            DB::commit();
            return response()->json([
                "ok" => true,
                "data" => $sol_baja->id
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return $e;
        }
    }

    public function cambioNom(Request $request)
    {
        try {
            DB::beginTransaction();
            $sol_baja = SolBajaNomina::find($request->id);
            $sol_baja->fecha_baja_nom = $request->date;
            $sol_baja->save();
            DB::commit();
            return response()->json([
                "ok" => true,
                "data" => $sol_baja
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                "ok" => true,
                "data" => $e->getMessage()
            ]);
        }
        dd($request);
    }

    public function verBitacora(Request $request)
    {
        $bit = SolicitudesBitacoraBajas::where('solicitud_id', $request->solicitud_id)->get();
        $count = strlen($bit);
        if ($count > 2) {
            return response()->json(['bit' => $bit]);
        } else {
            return response()->json(['bit' => $request->solicitud_id]);
        }

    }

    public function addBitacora(Request $request)
    {
        DB::connection();
        try {
            DB::beginTransaction();
            $bit               = new SolicitudesBitacoraBajas();
            $bit->solicitud_id = $request->solicitud_id;
            $bit->comentario   = $request->entrada_bitacora;
            $bit->user_log     = auth()->user()->id_usuario;
            $bit->log          = date('Y-m-d H:i:s');
            $bit->save();
            DB::commit();
            $bit_complete = SolicitudesBitacoraBajas::where('solicitud_id', $bit->solicitud_id)->get();
            return response()->json(['ok' => 1, 'bit' => $bit, 'bit_complete' => $bit_complete]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['ok' => 0, 'data' => $e->getMessage()]);

        }

    }


    public function cambioComment(Request $request)
    {
        try {
            DB::beginTransaction();
            $type = $request->type;

            $baja = SolBajaNomina::find($request->id);
            $bit = new SolicitudesBitacoraBajas();


            switch ($type) {
                case 'Cita':
                    $baja->obs_cita = $request->comment;

                    $bit->solicitud_id = $request->id;
                    $bit->comentario = $request->comment;
                    $bit->log = date('Y-m-d G:i:s');
                    break;
                case 'Computo':
                    $baja->obs_compu = $request->comment;
                    $baja->adeudo_compu = $request->deuda;

                    $bit->solicitud_id = $request->id;
                    $bit->comentario = $request->comment;
                    $bit->log = date('Y-m-d G:i:s');
                    break;
                case 'Celular':
                    $baja->obs_cel = $request->comment;
                    $baja->adeudo_cel = $request->deuda;

                    $bit->solicitud_id = $request->id;
                    $bit->comentario = $request->comment;
                    $bit->log = date('Y-m-d G:i:s');
                    break;
                case 'Auto':
                    $baja->obs_auto = $request->comment;
                    $baja->adeudo_auto = $request->deuda;

                    $bit->solicitud_id = $request->id;
                    $bit->comentario = $request->comment;
                    $bit->log = date('Y-m-d G:i:s');
                    break;
                case 'Almacen':
                    $baja->obs_alma = $request->comment;
                    $baja->adeudo_alma = $request->deuda;

                    $bit->solicitud_id = $request->id;
                    $bit->comentario = $request->comment;
                    $bit->log = date('Y-m-d G:i:s');
                    break;
                case 'Credencial':
                    $baja->obs_cred = $request->comment;
                    $baja->adeudo_cred = $request->deuda;

                    $bit->solicitud_id = $request->id;
                    $bit->comentario = $request->comment;
                    $bit->log = date('Y-m-d G:i:s');
                    break;
            }
            $baja->save();
            $bit->save();
            DB::commit();
            return response()->json([
                "ok" => true,
                "data" => $baja
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                "ok" => true,
                "data" => $e->getMessage()
            ]);
        }
    }

}
