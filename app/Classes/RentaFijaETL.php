<?php


namespace App\Classes;


use App\Models\ProyectosIndeplo;
use App\Models\ProyectosIndeploCodigos;
use App\Models\ProyectosIndeploRecurso;
use DB;
use Exception;

class RentaFijaETL
{
    public static function create($empleado_id, $fecha = ''){
        $ro = RentaFijaETL::buscarRO($empleado_id);
        if($ro){
            $proyecto = ProyectosIndeplo::find($ro->id);
            $codigos = RentaFijaETL::getCodigos($proyecto->id, $empleado_id);
            $pi_recurso = ProyectosIndeploRecurso::where('empleado_id', $empleado_id)
                ->where('proyecto_id', $proyecto->id)
                ->first();
            return [
                "proyecto" => $proyecto,
                "recurso"  => $pi_recurso,
                "codigos"  => $codigos,
                "existe"   => true
            ];
        }
        $conn = DB::connection('incore');
        $conn->beginTransaction();
        try{
            $fecha   = (!empty($fecha))?$fecha:date('Y-m-d');
            $data = RentaFijaETL::data($empleado_id, $fecha, 3);
            $datos = null;
            if (!empty($data))
                $datos = $data[0];
            $proyecto = new ProyectosIndeplo();
            $proyecto->pedido           = $datos->pedido;
            $proyecto->tipo_doc         = $datos->risk;
            $proyecto->proyecto_nombre  = $datos->proyecto_nombre;
            $proyecto->responsable_id   = $datos->coordinador_indeplo_id != null ? $datos->coordinador_indeplo_id:110;
            $proyecto->cliente          = $datos->cliente;
            $proyecto->servicio         = $datos->servicio;
            $proyecto->region           = $datos->region;
            $proyecto->tecnologia       = $datos->tecnologia;
            $proyecto->grupo            = $datos->grupo;
            $proyecto->fecha_requerida  = $datos->fecha_inicio;
            $proyecto->fecha_fin        = $datos->fecha_fin;
            $proyecto->id_solicitante   = $datos->coordinador_indeplo_id;
            $proyecto->viaticos         = $datos->viaticos;
            $proyecto->nombre_servicio  = $datos->nombre_servicio;
            $proyecto->duracion         = $datos->duracion;
            $proyecto->recursos         = $datos->recursos;
            $proyecto->tipo_proyecto    = $datos->tp;
            $proyecto->sitio            = $datos->MENSUAL;
            $proyecto->save();
            $conn->commit();
            if ($proyecto->id) {
                $pi_recurso = new ProyectosIndeploRecurso();
                $pi_recurso->empleado_id = $empleado_id;
                $pi_recurso->proyecto_id = $proyecto->id;
                $pi_recurso->save();

                $codigos = RentaFijaETL::getCodigos($proyecto->id, $empleado_id);
                if (!empty($codigos)){
                    foreach ($codigos as $codigo){
                        if ($codigo->codigo_id != null){
                            $pi_codigo = ProyectosIndeploCodigos::updateOrCreate(
                                [
                                    'proyecto_id' => $proyecto->id,
                                    'codigo_id'   => $codigo->codigo_id
                                ],
                                [
                                    'cantidad'   => $codigo->dias,
                                ]
                            );
                        }
                    }
                }
            }
            VentaRO::calcularVenta($proyecto->id);
            return [
                "proyecto" => $proyecto,
                "recurso"  => $pi_recurso,
                "codigos"  => $codigos
            ];
        }catch (Exception $e){
            $conn->rollBack();
            return $e;
        }
    }

    /* -----------------------------------------------------------------------------------------
     *       Funcion principal validar que no tenga risk order el empleado
     * -----------------------------------------------------------------------------------------
     * @param   int     $empleado_id    Id del empleado
     */
    public static function buscarRO($empleado_id){
        try{
            $ro = ProyectosIndeploRecurso::select()
                ->join('incore.proyectos_indeplo', 'proyectos_indeplo.id', '=', 'proyectos_indeplo_recursos.proyecto_id')
                ->where('empleado_id', $empleado_id)
                ->where('proyectos_indeplo.sitio', '=', 'MENSUAL')
                ->where('proyectos_indeplo.fecha_requerida', 'LIKE', '%'.date('Y-m-').'%')
                ->whereNull('proyectos_indeplo.fecha_termino')
                ->first();
            return $ro;
        }catch (Exception $e){
            return $e;
        }
    }

    public static function data($empleado_id,$fecha, $tp){
        try{
            $data = DB::raw("
            SELECT (
	            SELECT CONCAT( LEFT ( pedido, 3 ), MAX( CAST( SUBSTRING( pedido, 4, 10 ) AS DECIMAL ) ) + 1 ) pedido 
	            FROM incore.proyectos_indeplo WHERE( pedido LIKE 'RO-%' OR pedido LIKE 'OV-%' ) 
                ) pedido,
	        'RISK ORDER' AS risk,
	        CONCAT_WS( '-', mp.cliente, mp.servicio, mp.region, mp.tecnologia, mp.grupo ) proyecto_nombre,
	        ccni.coordinador_indeplo_id,
	        mp.cliente,
	        mp.servicio,
	        mp.`region`,
	        mp.`tecnologia`,
	        mp.`grupo`,
            CASE
		        WHEN mp.fecha_inicio > '$fecha' THEN
		        mp.fecha_inicio ELSE '$fecha' 
	        END AS fecha_inicio,
	        LAST_DAY( CONCAT_WS( '-', YEAR ( '$fecha' ), MONTH ( '$fecha' ), '01' ) ) fecha_fin,
	        ccni.coordinador_indeplo_id,
	        IFNULL(
	        	(
	        	SELECT diario_viaticos FROM incore.proyectos_diario_viaticos 
	        	WHERE CONCAT ( cliente, servicio, tecnologia ) = CONCAT ( mp.cliente, mp.servicio, mp.`tecnologia` ) 
	        	OR CONCAT ( cliente, servicio, tecnologia ) = CONCAT ( mp.cliente, mp.servicio ) 
	        	ORDER BY tecnologia DESC LIMIT 1 
	        	),0 
	        ) viaticos,
	        ( SELECT nombre FROM incore.proyectos_servicios WHERE id = mp.servicio ) nombre_servicio,
	        DATEDIFF( LAST_DAY( CONCAT_WS( '-', YEAR ( '$fecha' ), MONTH ( '$fecha' ), '01' ) ), '$fecha' ) + 1 duracion,
	        1 AS recursos,
	        $tp AS tp,
	        'MENSUAL' 
            FROM incore.empleados emp
	        JOIN incore.movimientos_proyectos mp ON mp.empleado_id = emp.empleado_id 
	        AND ( mp.fecha_fin IS NULL OR mp.`fecha_fin` > '$fecha' )
	        JOIN incore.movimientos_coordinador mc ON mc.empleado_id = emp.empleado_id 
	        AND ( mc.fecha_fin IS NULL OR mc.fecha_fin > '$fecha' )
	        LEFT JOIN incore.catalogo_coordinadores_nokia_indeplo ccni ON ccni.coordinador_nokia_id = mc.coordinador_id
	        JOIN incore.movimientos_recurso mr ON mr.empleado_id = emp.empleado_id 
	        AND ( mr.fecha_baja_rh IS NULL OR mr.`fecha_baja_rh` > '$fecha' )
	        LEFT JOIN (
	        SELECT
	        	pin.id,
	        	pir.empleado_id,
	        	pir.proyecto_id,
	        	pin.fecha_requerida 
	        FROM incore.proyectos_indeplo_recursos pir
	        	LEFT JOIN incore.movimientos_proyectos mpr ON mpr.empleado_id = pir.empleado_id 
	        	AND fecha_fin
	        	IS NULL JOIN incore.proyectos_indeplo pin ON pin.id = pir.`proyecto_id` 
	        	AND ( pin.`fecha_requerida` >= mpr.fecha_inicio ) 
	        	AND pin.fecha_requerida >= '$fecha' 
	        	AND ( pin.`fecha_requerida` <= LAST_DAY( '$fecha' ) ) 
	        ) pedidos ON pedidos.empleado_id = emp.`empleado_id` 
            WHERE emp.empleado_id = $empleado_id 
	        AND pedidos.id IS NULL
            ");
            $model = DB::select($data);
            return $model;
        }catch (Exception $e){
            return $e;
        }
    }

    public static function getCodigos($last_id,$empleado_id){
        try{
            $data = DB::raw("
            SELECT
	        $last_id AS pedido,
	        ecm.codigo_id,
	        DATEDIFF(
	        	( CASE WHEN ecm.fecha_fin IS NULL THEN pi.fecha_fin WHEN ecm.fecha_fin < pi.fecha_fin THEN ecm.fecha_fin END ),
	        	( CASE WHEN ecm.fecha_inicio <= pi.fecha_requerida THEN pi.fecha_requerida ELSE ecm.fecha_inicio END ) 
	        ) + 1 AS dias 
            FROM incore.empleados_codigos_movimientos ecm
	        JOIN incore.proyectos_indeplo pi ON pi.id = $last_id 
            WHERE empleado_id = $empleado_id 
	        AND ecm.fecha_fin IS NULL
            ");
            $models = DB::select($data);
            return $models;
        }catch (Exception $e){
            return $e;
        }
    }
}