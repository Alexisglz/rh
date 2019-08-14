<?php


namespace App\Classes;


use App\Coordinadores;
use App\Empleados;
use App\Models\CatalogoNokiaCodigo;
use App\Models\CatCoordNokiaInd;
use App\Models\EmpleadoCodigoMovimiento;
use App\Models\MovimientoRecurso;
use App\Models\MovimientosCoordinador;
use App\Models\MovimientosProyecto;
use App\Models\MovimientosPuesto;
use App\Models\MovimientosSueldo;
use App\Models\ProyectosEntCoordRecurso;
use App\Solicitudes;
use App\SolicitudesAltasAuth;
use DB;
use Exception;

class NuevoEmpleado
{
    public static function create($request){
        $conn = DB::connection('incore');
        $conn->beginTransaction();
        try{
            $solicitud = Solicitudes::find($request->id_solicitud);
            if ($request->enviar == 0)
                $empleado = new Empleados;
            else{
                $empleado = Empleados::find($request->enviar);
                $empleado->empleado_estatus    = "ACTIVO";
                $empleado->empleado_fecha_baja = null;
                $empleado->baja_rh = null;
            }
            /* Guardar los datos del empleado */
            $empleado->empleado_num           = $request->num_empleado;
            $empleado->empleado_alcatel_id    = $request->ind_alcatel == "" ? 0:$request->ind_alcatel;
            $empleado->empleado_nombre        = $request->name;
            $empleado->empleado_apaterno      = $request->apaterno;
            $empleado->empleado_amaterno      = $request->amaterno;
            $empleado->calle                  = $request->calle;
            $empleado->num_exterior           = $request->num_ext;
            $empleado->num_interior           = $request->num_int;
            $empleado->colonia                = $request->colonia;
            $empleado->municipio              = $request->municipio;
            $empleado->cp                     = $request->cp;
            $empleado->estado                 = $request->estado;
            $empleado->nss                    = $request->nss;
            $empleado->curp                   = $request->curp;
            $empleado->rfc                    = $request->rfc;
            $empleado->mail                   = $request->email;
            $empleado->telefono2              = $request->telefono2;
            $empleado->telefono               = $request->telefono1;
            $empleado->empresa                = $request->empresa;
            $empleado->segmento               = $request->segmento;
            $empleado->empleado_fecha_alta    = date("Y-m-d H:i:s");
            $empleado->empleado_observaciones = $request->observaciones;
            $empleado->id_solicitud           = $request->id_solicitud;
            $empleado->area                   = $request->area;
            $empleado->save();

            // Guardar Movimiento recurso
            $mov_recurso                      = new MovimientoRecurso();
            $mov_recurso->empleado_id         = $empleado->empleado_id;
            $mov_recurso->fecha_alta          = $request->fecha_ingreso;
            $mov_recurso->numero_empleado     = $empleado->empleado_num;
            $mov_recurso->viaticos            = isset($request->viaticos) ? $request->viaticos:0;
            $mov_recurso->razon_rh            = is_numeric($request->razon_social) ? $request->razon_social:1;
            $mov_recurso->nomina              = isset($request->viaticos) ? $request->viaticos:0;
            $mov_recurso->esquema             = isset($request->esquema) ? $request->esquema:0;
            $mov_recurso->monex               = $request->num_monex;
            $mov_recurso->num_cuenta          = $request->num_cuenta;
            $mov_recurso->clabe               = $request->clabe;
            $mov_recurso->banco               = $request->banco;
            $mov_recurso->localidad           = $request->localidad;
            //$mov_recurso->segmento            = isset($request->segmento) ? $request->segmento:0;
            //$mov_recurso->proveedor           = isset($request->proveedor) ? $request->proveedor:0;
            $mov_recurso->observaciones       = $request->observaciones;
            $mov_recurso->esquema_viaticos    = $request->esquema_viaticos;
            $mov_recurso->user_log            = auth()->user()->id_usuario;
            $mov_recurso->save();

            // Validaciones para los servicios es la parte mas inestable por que hay inconsistencias en la base de incore
            if($solicitud->servicio == "POLZ" || $solicitud->servicio == "TKBS" || $solicitud->servicio == "SERV" || $solicitud->servicio == "RREC") {
                $coordinador = Coordinadores::where('id', $request->coordinador)->first();
                if($coordinador->user_log != 0){
                    /* Agregar al catalogo de coordinadores nokia indeplo*/
                    $coord_nok_ind                         = new CatCoordNokiaInd();
                    $coord_nok_ind->coordinador_nokia_id   = $coordinador->id;
                    $coord_nok_ind->coordinador_indeplo_id = 5;
                    $coord_nok_ind->save();
                }
                else{
                    $coord_nok_ind = CatCoordNokiaInd::where('coordinador_nokia_id', $request->coordinador)->first();
                    if ($coord_nok_ind){
                        /* Agregar al catalogo de coordinadores nokia indeplo*/
                        $coord_nok_ind                         = new CatCoordNokiaInd();
                        $coord_nok_ind->coordinador_nokia_id   = $request->coordinador;
                        $coord_nok_ind->coordinador_indeplo_id = 5;
                        $coord_nok_ind->save();
                    }
                }
                $pro_ent_coord_rec = ProyectosEntCoordRecurso::updateOrCreate(
                    ['id_recurso' => $empleado->empleado_id],
                    [
                        'id_usuario'           => $coordinador->user_id == 0 ? 129:$coordinador->user_id,
                        'id_coordinador_nokia' => $coord_nok_ind->coordinador_nokia_id
                    ]
                );
            }

            // Guardar el movimiento proyecto
            // Validacion por si se da de alta el recurso sin tener una solicitud de alta
            if ($request->id_solicitud != 0){
                $cliente                 = $solicitud->cliente;
                $tecnologia              = $solicitud->tecnologia;
                $region                  = $solicitud->region;
                $servicio                = $solicitud->servicio;
                $grupo                   = $solicitud->grupo;
                $tipo                    = $solicitud->tipo_proyecto;
            }
            else{
                $cliente                 = $request->cliente;
                $tecnologia              = $request->tecnologia;
                $region                  = $request->region;
                $servicio                = $request->servicio;
                $grupo                   = $request->grupo;
                $tipo                    = 1;
            }
            $mov_proyecto                = new MovimientosProyecto();
            $mov_proyecto->empleado_id   = $empleado->empleado_id;
            $mov_proyecto->cliente       = $cliente;
            $mov_proyecto->tecnologia    = $tecnologia;
            $mov_proyecto->region        = $region;
            $mov_proyecto->servicio      = $servicio;
            $mov_proyecto->grupo         = $grupo;
            $mov_proyecto->fecha_inicio  = $request->fecha_ingreso;
            $mov_proyecto->user_log      = auth()->user()->id_usuario;
            $mov_proyecto->tipo_proyecto = $tipo;
            $mov_proyecto->save();

            // Validacion por si se da de alta el recurso sin tener una solicitud de alta
            if ($request->coordinador != 0){
                // Guardar el movimiento proyecto
                $mov_coordinador                 = new MovimientosCoordinador();
                $mov_coordinador->coordinador_id = $request->coordinador;
                $mov_coordinador->empleado_id    = $empleado->empleado_id;
                $mov_coordinador->fecha_inicio   = $request->fecha_ingreso;
                $mov_coordinador->user_log       = auth()->user()->id_usuario;
                $mov_coordinador->save();
            }

            // Guardar el movimiento sueldo
            $mov_sueldo                     = new MovimientosSueldo();
            $mov_sueldo->empleado_id        = $empleado->empleado_id;
            $mov_sueldo->sueldo_imss        = $request->sueldo_imss;
            $mov_sueldo->sueldo_alternativo = isset($request->sueldo_alternativo)?$request->sueldo_alternativo:0;
            $mov_sueldo->sueldo_mensual     = isset($request->sueldo_mensual)?$request->sueldo_mensual:0;
            $mov_sueldo->sueldo_asimilado   = isset($request->sueldo_variable)?$request->sueldo_variable:0;
            $mov_sueldo->fecha_inicio       = $request->fecha_ingreso;
            $mov_sueldo->user_log           = auth()->user()->id_usuario;
            $mov_sueldo->save();

            // Guardar el movimiento puesto
            $mov_puesto               = new MovimientosPuesto();
            $mov_puesto->empleado_id  = $empleado->empleado_id;
            $mov_puesto->puesto       = $request->puesto;
            $mov_puesto->fecha_inicio = $request->fecha_ingreso;
            $mov_puesto->user_log     = auth()->user()->id_usuario;
            $mov_puesto->save();

            if (strval($solicitud->codigo_sueldo) != "0"){
                $codigo_nokia                   = CatalogoNokiaCodigo::where('codigo', '=', $solicitud->codigo_sueldo)->first();
                if ($codigo_nokia){
                    $cod_movimientos                = new EmpleadoCodigoMovimiento();
                    $cod_movimientos->empleado_id   = $empleado->empleado_id;
                    $cod_movimientos->codigo_id     = $codigo_nokia->id;
                    $cod_movimientos->fecha_inicio  = $request->fecha_ingreso;
                    $cod_movimientos->save();
                }
            }

            if (strval($solicitud->codigo_celular) != "0"){
                $codigo_nokia                   = CatalogoNokiaCodigo::where('codigo', '=', $solicitud->codigo_celular)->first();
                if ($codigo_nokia){
                    $cod_movimientos                = new EmpleadoCodigoMovimiento();
                    $cod_movimientos->empleado_id   = $empleado->empleado_id;
                    $cod_movimientos->codigo_id     = $codigo_nokia->id;
                    $cod_movimientos->fecha_inicio  = $request->fecha_ingreso;
                    $cod_movimientos->save();
                }
            }

            if (strval($solicitud->codigo_computadora) != "0"){
                $codigo_nokia                   = CatalogoNokiaCodigo::where('codigo', '=', $solicitud->codigo_computadora)->first();
                if ($codigo_nokia){
                    $cod_movimientos                = new EmpleadoCodigoMovimiento();
                    $cod_movimientos->empleado_id   = $empleado->empleado_id;
                    $cod_movimientos->codigo_id     = $codigo_nokia->id;
                    $cod_movimientos->fecha_inicio  = $request->fecha_ingreso;
                    $cod_movimientos->save();
                }
            }

            if (strval($solicitud->codigo_auto) != "0"){
                $codigo_nokia                   = CatalogoNokiaCodigo::where('codigo', '=', $solicitud->codigo_auto)->first();
                if ($codigo_nokia){
                    $cod_movimientos                = new EmpleadoCodigoMovimiento();
                    $cod_movimientos->empleado_id   = $empleado->empleado_id;
                    $cod_movimientos->codigo_id     = $codigo_nokia->id;
                    $cod_movimientos->fecha_inicio  = $request->fecha_ingreso;
                    $cod_movimientos->save();
                }
            }

            if (strval($solicitud->codigo_bam) != "0"){
                $codigo_nokia                   = CatalogoNokiaCodigo::where('codigo', '=', $solicitud->codigo_bam)->first();
                if ($codigo_nokia){
                    $cod_movimientos                = new EmpleadoCodigoMovimiento();
                    $cod_movimientos->empleado_id   = $empleado->empleado_id;
                    $cod_movimientos->codigo_id     = $codigo_nokia->id;
                    $cod_movimientos->fecha_inicio  = $request->fecha_ingreso;
                    $cod_movimientos->save();
                }
            }

            if (strval($solicitud->codigo_software) != "0"){
                $codigo_nokia                   = CatalogoNokiaCodigo::where('codigo', '=', $solicitud->codigo_software)->first();
                if ($codigo_nokia){
                    $cod_movimientos                = new EmpleadoCodigoMovimiento();
                    $cod_movimientos->empleado_id   = $empleado->empleado_id;
                    $cod_movimientos->codigo_id     = $codigo_nokia->id;
                    $cod_movimientos->fecha_inicio  = $request->fecha_ingreso;
                    $cod_movimientos->save();
                }
            }

            /* Actualizar el estatus de la solicitud del recurso */
            $solicitud->status_cita = "EMPLEADO CREADO";
            $solicitud->id_empleado = $empleado->empleado_id;
            $solicitud->fecha_alta  = date('Y-m-d');
            $solicitud->save();
            $alta_auth                   = SolicitudesAltasAuth::where('id_solicitud', $solicitud->id)->first();
            $alta_auth->alta             = 'OK';
            $alta_auth->save();
            $conn->commit();
            if($solicitud->tipo_proyecto == 2)
                TaskBased::taskBased($empleado->empleado_id);

            if($solicitud->tipo_proyecto == 3 || $solicitud->tipo_proyecto == 4)
                RentaFijaETL::create($empleado->empleado_id);

            if($solicitud->tipo_proyecto == 6)
                Poliza::create($empleado->empleado_id);
            return $empleado;
        }catch (Exception $e){
            $conn->rollBack();
            throw $e;
        }
    }
}