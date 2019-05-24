<?php

namespace App\Models;

use App\Solicitudes;
use DB;

class Movimientos
{

    /*
     *  Funcion para dar de alta el movimiento recurso en incore
     * @param object $model
     * @param \Illuminate\Http\Request $request
     */
    public static function movimientoRecurso($model, $request){
        try{
            $empleado = $model;
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
        }catch (\Exception $e){
            $error = $e;
            return [
                'ok'   => false,
                'data' => $error
            ];
        }
        return [
            'ok'   => true,
            'data' => $mov_recurso
        ];
    }

    /*
     *  Funcion para dar de alta el coordinador nokia indeplo en incore
     * @param \Illuminate\Http\Request $request
     */
    public static function movimientoCoordNokInd($request)
    {
        try {
            $coord_nok_ind                         = new CatCoordNokiaInd();
            $coord_nok_ind->coordinador_nokia_id   = $request->coordinador;
            $coord_nok_ind->coordinador_indeplo_id = 5;
            $coord_nok_ind->save();
        } catch (\Exception $e) {
            $error = $e;
            return [
                'ok'   => false,
                'data' => $error
            ];
        }
        return [
            'ok'   => true,
            'data' => $coord_nok_ind
        ];
    }

    /*
     *  Funcion para dar de alta el movimiento proyecto en incore
     * @param object $model
     * @param \Illuminate\Http\Request $request
     */
    public static function movimientoProyecto($model, $request)
    {
        try {
            $empleado                    = $model;
            if ($request->id_solicitud != 0){
                $sol_alta                = new Solicitudes();
                $sol_alta                = $sol_alta::find($request->id_solicitud);
                $cliente                 = $sol_alta->cliente;
                $tecnologia              = $sol_alta->tecnologia;
                $region                  = $sol_alta->region;
                $servicio                = $sol_alta->servicio;
                $grupo                   = $sol_alta->grupo;
                $tipo                    = $sol_alta->tipo_proyecto;
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
        } catch (\Exception $e) {
            $error = $e;
            return [
                'ok'   => false,
                'data' => $error
            ];
        }
        return [
            'ok'   => true,
            'data' => $mov_proyecto
        ];
    }

    /*
     *  Funcion para dar de alta el movimiento coordinador en incore
     * @param object $model
     * @param \Illuminate\Http\Request $request
     */
    public static function movimientoCoordinador($model, $request)
    {
        try {
            $empleado                        = $model;
            $mov_coordinador                 = new MovimientosCoordinador();
            $mov_coordinador->coordinador_id = $request->coordinador;
            $mov_coordinador->empleado_id    = $empleado->empleado_id;
            $mov_coordinador->fecha_inicio   = $request->fecha_ingreso;
            $mov_coordinador->user_log       = auth()->user()->id_usuario;
            $mov_coordinador->save();
        } catch (\Exception $e) {
            $error = $e;
            return [
                'ok'   => false,
                'data' => $error
            ];
        }
        return [
            'ok'   => true,
            'data' => $mov_coordinador
        ];
    }

    /*
     *  Funcion para dar de alta el movimiento sueldo en incore
     * @param object $model
     * @param \Illuminate\Http\Request $request
     */
    public static function movimientoSueldo($model, $request)
    {
        try {
            $empleado                       = $model;
            $mov_sueldo                     = new MovimientosSueldo();
            $mov_sueldo->empleado_id        = $empleado->empleado_id;
            $mov_sueldo->sueldo_imss        = $request->sueldo_imss;
            $mov_sueldo->sueldo_alternativo = isset($request->sueldo_alternativo)?$request->sueldo_alternativo:0;
            $mov_sueldo->sueldo_mensual     = isset($request->sueldo_mensual)?$request->sueldo_mensual:0;
            $mov_sueldo->sueldo_asimilado   = isset($request->sueldo_variable)?$request->sueldo_variable:0;
            $mov_sueldo->fecha_inicio       = $request->fecha_ingreso;
            $mov_sueldo->user_log           = auth()->user()->id_usuario;
            $mov_sueldo->save();
        } catch (\Exception $e) {
            $error = $e;
            return [
                'ok'   => false,
                'data' => $error
            ];
        }
        return [
            'ok'   => true,
            'data' => $mov_sueldo
        ];
    }

    /*
     *  Funcion para dar de alta el movimiento puesto en incore
     * @param object $model
     * @param \Illuminate\Http\Request $request
     */
    public static function movimientoPuesto($model, $request)
    {
        try {
            $empleado                 = $model;
            $mov_puesto               = new MovimientosPuesto();
            $mov_puesto->empleado_id  = $empleado->empleado_id;
            $mov_puesto->puesto       = $request->puesto;
            $mov_puesto->fecha_inicio = $request->fecha_ingreso;
            $mov_puesto->user_log     = auth()->user()->id_usuario;
            $mov_puesto->save();
        } catch (\Exception $e) {
            $error = $e;
            return [
                'ok'   => false,
                'data' => $error
            ];
        }
        return [
            'ok'   => true,
            'data' => $mov_puesto
        ];
    }

    /*
     *  Funcion para dar de alta el codigos movimientos en incore
     * @param object $model
     * @param \Illuminate\Http\Request $request
     * @param string $codigo
     */
    public static function codigosMovimientos($model, $request, $codigo)
    {
        try {
            $empleado                       = $model;
            $codigo_nokia                   = CatalogoNokiaCodigo::where('codigo', '=', $codigo)->first();
            if ($codigo_nokia){
                $cod_movimientos                = new EmpleadoCodigoMovimiento();
                $cod_movimientos->empleado_id   = $empleado->empleado_id;
                $cod_movimientos->codigo_id     = $codigo_nokia->id;
                $cod_movimientos->fecha_inicio  = $request->fecha_ingreso;
                $cod_movimientos->save();
            }
            else{
                return [
                    'ok' => true,
                    'data' => []
                ];
            }
        } catch (\Exception $e) {
            $error = $e;
            return [
                'ok'   => false,
                'data' => $error
            ];
        }
        return [
            'ok'   => true,
            'data' => $cod_movimientos
        ];
    }
}
