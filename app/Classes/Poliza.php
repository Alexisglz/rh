<?php


namespace App\Classes;


use App\Models\ProyectosIndeplo;
use App\Models\ProyectosIndeploRecurso;
use DB;
use Exception;

class Poliza
{
    public static function create($empleado_id, $fecha = ''){

        /*$ro = RentaFijaETL::buscarRO($empleado_id);
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
        }*/
        $conn = DB::connection('incore');
        $conn->beginTransaction();
        try{
            $fecha = (!empty($fecha))?$fecha:date('Y-m-d');
            $datos = Poliza::data($empleado_id, $fecha);
            $proyecto = null;
            if (!empty($datos))
                $proyecto = $datos[0];
            $proyecto_ind = new ProyectosIndeplo();
            $proyecto_ind->pedido           = $proyecto->pedido;
            $proyecto_ind->tipo_doc         = $proyecto->tipo_doc;
            $proyecto_ind->proyecto_nombre  = $proyecto->proyecto_nombre;
            $proyecto_ind->responsable_id   = $proyecto->id_usuario;
            $proyecto_ind->cliente          = $proyecto->cliente;
            $proyecto_ind->servicio         = $proyecto->servicio;
            $proyecto_ind->region           = $proyecto->region;
            $proyecto_ind->tecnologia       = $proyecto->tecnologia;
            $proyecto_ind->grupo            = $proyecto->grupo;
            $proyecto_ind->sitio            = $proyecto->sitio;
            $proyecto_ind->fecha_requerida  = $proyecto->fecha_inicio;
            $proyecto_ind->fecha_fin        = $proyecto->fecha_fin;
            $proyecto_ind->id_solicitante   = $proyecto->solic;
            $proyecto_ind->viaticos         = $proyecto->viaticos;
            $proyecto_ind->nombre_servicio  = $proyecto->nombre_servicio;
            $proyecto_ind->duracion         = $proyecto->duracion;
            $proyecto_ind->recursos         = $proyecto->recursos;
            $proyecto_ind->tipo_proyecto    = $proyecto->tp;
            $proyecto_ind->save();
            if ($proyecto){
                $pi_recurso = new ProyectosIndeploRecurso();
                $pi_recurso->empleado_id = $empleado_id;
                $pi_recurso->proyecto_id = $proyecto_ind->id;
                $pi_recurso->save();
            }
            $conn->commit();
            VentaRO::calcularVenta($proyecto_ind->id);
            return [$proyecto_ind, $pi_recurso];
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
                ->first();
            return $ro;
        }catch (Exception $e){
            return $e;
        }
    }

    public static function data($empleado_id, $fecha){
        try{
            $data = DB::raw("
            SELECT
	        (
	        SELECT
	        	CONCAT( LEFT ( pedido, 3 ), MAX( CAST( SUBSTRING( pedido, 4, 10 ) AS DECIMAL ) ) + 1 ) pedido 
	        FROM
	        	incore.proyectos_indeplo 
	        WHERE ( pedido LIKE 'RO-%' OR pedido LIKE 'OV-%' ) 
	        ) pedido,
	        'RISK ORDER' AS tipo_doc,
	        CONCAT_WS( '-', mp.cliente, mp.servicio, mp.region, mp.tecnologia, mp.grupo ) proyecto_nombre,
	        cr.id_usuario,
	        mp.cliente,
	        mp.servicio,
	        mp.`region`,
	        mp.`tecnologia`,
	        mp.`grupo`,
	        'MENSUAL' AS sitio,
            CASE
            	WHEN mp.fecha_inicio > '$fecha' 
            	    THEN mp.fecha_inicio ELSE '$fecha' 
            	END AS fecha_inicio,
            	LAST_DAY( CONCAT_WS( '-', YEAR ( '$fecha' ), MONTH ( '$fecha' ), '01' ) ) fecha_fin,
            	cr.id_usuario AS solic,
            	IFNULL(
            		(
            		SELECT diario_viaticos 
            		FROM incore.proyectos_diario_viaticos 
            		WHERE CONCAT ( cliente, servicio, tecnologia ) = CONCAT ( mp.cliente, mp.servicio, mp.`tecnologia` ) 
            			OR CONCAT ( cliente, servicio, tecnologia ) = CONCAT ( mp.cliente, mp.servicio ) 
            		ORDER BY tecnologia DESC  LIMIT 1 
            		),
            		0 
            	) viaticos,
            	( SELECT nombre FROM incore.proyectos_servicios WHERE id = mp.servicio ) nombre_servicio,
            	DATEDIFF( LAST_DAY( CONCAT_WS( '-', YEAR ( '$fecha' ), MONTH ( '$fecha' ), '01' ) ), '$fecha' ) + 1 duracion,
            	1 AS recursos,
            	6 AS tp
            FROM incore.empleados emp
            	JOIN incore.movimientos_proyectos mp ON mp.empleado_id = emp.empleado_id 
            	AND ( mp.fecha_fin IS NULL OR mp.`fecha_fin` > '$fecha' )
            	JOIN incore.proyectos_entregables_coordinador_recurso cr ON cr.id_recurso = emp.empleado_id
            	JOIN incore.movimientos_recurso mr ON mr.empleado_id = emp.empleado_id 
            	AND ( mr.fecha_baja_rh IS NULL OR mr.`fecha_baja_rh` > '$fecha' ) 
            WHERE emp.empleado_id = $empleado_id            
            ");
            $model = DB::select($data);
            return $model;
        }catch (Exception $e){
            return $e;
        }
    }

    public static function close($empleado_id){
        $conn = DB::connection('incore');
        try{
            $conn->beginTransaction();
            $date = date('Y-m-d');
            $models = DB::table('incore.proyectos_indeplo AS pi')
                ->select(DB::raw('pi.id'))
                ->join(DB::raw('incore.proyectos_indeplo_recursos AS pir'),DB::raw('pir.proyecto_id'), '=', DB::raw('pi.id'))
                ->where(DB::raw('pir.empleado_id'), '=', $empleado_id)
                ->where(DB::raw('pi.fecha_requerida') ,'>', $date)
                ->get();
            if ($models){
                foreach ($models AS $model){
                    $ro = ProyectosIndeplo::find($model->id);
                    $ro->delete();
                }
            }
            $conn->commit();
            return [
                'ok' => true,
                'data' => $models
            ];
        }catch (\Exception $e){
            $conn->rollBack();
            return [
                'ok' => false,
                'data' => $e->getMessage()
            ];
        }
    }
}