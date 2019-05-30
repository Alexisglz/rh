<?php


namespace App\Classes;


use App\Models\MovimientosProyecto;
use App\Models\ProyectosEntregables;
use App\Models\ProyectosEntregablesCodigos;
use App\Models\ProyectosIndeplo;
use App\Models\ProyectosIndeploRecurso;
use DB;
use Exception;

class TaskBased
{

    /* -----------------------------------------------------------------------------------------
     *       Funcion principal para crear RISK ORDERS tipo TASK BASED
     * -----------------------------------------------------------------------------------------
     * @param   int     $empleado_id    Id del empleado
     * @param   string  $fecha          Fecha de creacion (opcional toma por defecto la del dia)
     */
    public static function taskBased($empleado_id, $fecha = ''){
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
            $fecha   = (!empty($fecha))?$fecha:date('Y-m-d');
            $codigos = TaskBased::getCodigos($empleado_id,$fecha);
            $datos   = TaskBased::data($empleado_id, $fecha, 2);

            $object = null;
            foreach ($datos as $model){
                $object = $model;
            }
            if ($object == null){
                DB::rollBack();
                return response()->json([
                    "ok" => false,
                    "data" => "Error al obtener los datos para crear el proyecto"
                ]);
            }

            $proyecto                   = new ProyectosIndeplo();
            $proyecto->pedido           = $object->pedido;
            $proyecto->tipo_doc         = $object->tipo_doc;
            $proyecto->proyecto_nombre  = $object->proyecto_nombre;
            $proyecto->responsable_id   = intval($object->responsable_id);
            $proyecto->cliente          = $object->cliente;
            $proyecto->servicio         = $object->servicio;
            $proyecto->region           = $object->region;
            $proyecto->tecnologia       = $object->tecnologia;
            $proyecto->grupo            = $object->grupo;
            $proyecto->fecha_requerida  = $object->fecha_inicio;
            $proyecto->fecha_fin        = $object->fecha_fin;
            $proyecto->id_solicitante   = intval($object->id_solicitante);
            $proyecto->viaticos         = floatval($object->viaticos);
            $proyecto->nombre_servicio  = $object->nombre_servicio;
            $proyecto->duracion         = intval($object->duracion);
            $proyecto->recursos         = intval($object->recursos);
            $proyecto->tipo_proyecto    = intval($object->tipo_proyecto);
            $proyecto->sitio            = 'MENSUAL';
            $proyecto->save();
            $conn->commit();
            if ($proyecto->id){
                $pi_recurso = new ProyectosIndeploRecurso();
                $pi_recurso->empleado_id = $empleado_id;
                $pi_recurso->proyecto_id = $proyecto->id;
                $pi_recurso->save();

                $data_entregables      = TaskBased::dataEntregables($empleado_id, $proyecto->id);
                $entregables = null;
                foreach ($data_entregables as $item){
                    $entregables = $item;
                }
                if ($entregables == null){
                    $conn->rollBack();
                    return response()->json([
                        "ok" => false,
                        "data" => "Error al obtener los entregables"
                    ]);
                }
                $proyectos_entregables = new ProyectosEntregables();
                $proyectos_entregables->id_empleado = $entregables->empleado_id;
                $proyectos_entregables->estatus     = $entregables->estatus;
                $proyectos_entregables->periodo_ini = $entregables->fecha_inicio;
                $proyectos_entregables->periodo_fin = $entregables->fecha_fin;
                $proyectos_entregables->pedido_id   = $entregables->pedido_id;
                $proyectos_entregables->save();

                if (!empty($codigos)){
                    foreach ($codigos as $codigo){
                        $pe_codigos = new ProyectosEntregablesCodigos();
                        $pe_codigos->proyecto_id     = $proyectos_entregables->id;
                        $pe_codigos->codigo_id       = $codigo->id;
                        $pe_codigos->cantidad_codigo = $codigo->cantidad_codigo;
                        $pe_codigos->save();
                    }
                }
                VentaRO::calcularVenta($proyecto->id);
            }
            return [
                "ok"   => true,
                "data" => $proyecto
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
                ->first();
            return $ro;
        }catch (Exception $e){
            return $e;
        }
    }

    /* -----------------------------------------------------------------------------------------
     *                      Funcion para obtener los codigos
     * -----------------------------------------------------------------------------------------
     * @param   int     $empleado_id    Id del empleado
     * @param   string  $fecha          Fecha de creacion
     */
    public static function getCodigos($empleado_id,$fecha){
        try{
            $codigos = DB::raw("
            SELECT * FROM incore.proyectos_entregables_codigos WHERE proyecto_id IN (
			SELECT pe.id FROM incore.proyectos_entregables pe 
			JOIN incore.proyectos_indeplo pi ON pi.id=pe.pedido_id
			JOIN incore.proyectos_indeplo_recursos pir ON pir.proyecto_id=pi.id 
				AND pir.empleado_id=$empleado_id
				AND month(pe.periodo_ini)= month('$fecha')-1
			)");
            $models = DB::select($codigos);
            return $models;
        }catch (Exception $e){
            return $e;
        }
    }

    /* -----------------------------------------------------------------------------------------
     *       Funcion para obtener los datos para crear la RISK ORDER
     * -----------------------------------------------------------------------------------------
     * @param   int     $empleado_id    Id del empleado
     * @param   string  $fecha          Fecha de creacion
     * @param   int     $tp             Tipo de proyecto
     *
     * Nota: El query de esta funcion debe ser optimizado y preferente pasarse a laravel
     */
    public static function data($empleado_id,$fecha, $tp){
        try{
            $datos = DB::raw("
            SELECT(
    			    SELECT
    			        CONCAT(LEFT(pedido,3),MAX(CAST(SUBSTRING(pedido,4,10) AS DECIMAL))+1 ) pedido
    			    FROM
    			        incore.proyectos_indeplo
    			    WHERE
    			        (pedido LIKE 'RO-%' OR pedido LIKE 'OV-%')
    			) pedido,
    			'RISK ORDER' as tipo_doc,
    			CONCAT_WS('-',mp.cliente,mp.servicio,mp.region,mp.tecnologia,mp.grupo) proyecto_nombre,
    			IFNULL(ccni.coordinador_indeplo_id, 1) responsable_id,
    			mp.cliente,
    			mp.servicio,
    			mp.region,
    			mp.tecnologia,
    			mp.grupo,
    			CASE WHEN mp.fecha_inicio > '$fecha'
    			THEN mp.fecha_inicio
    			ELSE '$fecha'
    			END	AS fecha_inicio,
    			CASE
    				WHEN mp.fecha_fin < LAST_DAY('$fecha') THEN mp.fecha_fin
    				ELSE LAST_DAY('$fecha')
    			END AS fecha_fin,
    			IFNULL(ccni.coordinador_indeplo_id, 1) id_solicitante,
    			IFNULL(
    			    (
    			    SELECT
    			        diario_viaticos
    			    FROM incore.proyectos_diario_viaticos
    			    WHERE
    			        CONCAT (cliente,servicio,tecnologia) = CONCAT (mp.cliente,mp.servicio,mp.tecnologia)
    			        OR
    			        CONCAT (cliente,servicio,tecnologia) = CONCAT (mp.cliente,mp.servicio)
    			    ORDER BY tecnologia DESC LIMIT 1
    			),0) viaticos,
    			(SELECT nombre FROM incore.proyectos_servicios WHERE id=mp.servicio) nombre_servicio ,
    			DATEDIFF(
    				LAST_DAY('$fecha')
    				,
    				mp.fecha_inicio
    			)+1 duracion,
    			1 as recursos, $tp as tipo_proyecto
    			FROM incore.empleados emp
    			JOIN incore.movimientos_proyectos mp ON mp.empleado_id = emp.empleado_id AND (mp.fecha_fin IS NULL OR mp.fecha_fin > '$fecha')
				JOIN incore.movimientos_coordinador mc on mc.empleado_id=emp.empleado_id and (mc.fecha_fin is null OR mc.fecha_fin > '$fecha')
    			LEFT JOIN incore.catalogo_coordinadores_nokia_indeplo ccni on ccni.coordinador_nokia_id=mc.coordinador_id
    			JOIN incore.movimientos_recurso mr ON mr.empleado_id = emp.empleado_id AND  (mr.fecha_baja_rh IS NULL OR mr.fecha_baja_rh > '$fecha')
    			LEFT JOIN (
	    			      SELECT
				    pin.id,
				    pir.empleado_id,
				    pir.proyecto_id,
				    pin.fecha_requerida
				    FROM
				     incore.proyectos_indeplo_recursos pir
						LEFT JOIN incore.movimientos_proyectos mpr on mpr.empleado_id=pir.empleado_id and fecha_fin is null
				    JOIN incore.proyectos_indeplo pin ON pin.id = pir.proyecto_id
				            AND (
				                	pin.fecha_requerida >= mpr.fecha_inicio
				                )
				            AND pin.fecha_requerida >= '$fecha'
				            AND pin.fecha_fin <= CONCAT_WS('-',YEAR('$fecha'),MONTH('$fecha'),LAST_DAY('$fecha'))
				            AND (
				                	pin.fecha_requerida <= LAST_DAY(CONCAT_WS('-',YEAR('$fecha'),MONTH('$fecha'),'01'))
				                )
    			)pedidos  ON pedidos.empleado_id = emp.empleado_id
    			WHERE emp.empleado_id = $empleado_id  AND pedidos.id IS NULL
    			LIMIT 1
            ");
            $model = DB::select($datos);
            return $model;
        }catch (Exception $e){
            return $e;
        }
    }

    /* ----------------------------------------------------------------------------------------
     *                  Funcion para obtener los entregables
     * ----------------------------------------------------------------------------------------
     * @param   int     $empleado_id    Id del empleado
     * @param   int     $last_id        Id del proyecto que se acaba de crear
     */
    public static function dataEntregables($empleado_id,$last_id){
        try{
            $data = DB::raw("
            SELECT 
                $empleado_id AS empleado_id,
                1 AS estatus,
			    pi.fecha_requerida AS fecha_inicio,
			    pi.fecha_fin AS fecha_fin,
			    $last_id AS pedido_id
			FROM incore.movimientos_proyectos mp 
			JOIN incore.proyectos_indeplo pi ON pi.id=$last_id
			WHERE mp.empleado_id=$empleado_id ORDER BY mp.id DESC LIMIT 1
            ");
            $model = DB::select($data);
            return $model;
        }catch (Exception $e){
            return $e;
        }
    }
}