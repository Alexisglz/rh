<?php


namespace App\Classes;


use App\Models\ProyectosIndeplo;
use App\Models\ProyectosIndeploCodigos;
use DB;
use Exception;

class VentaRO
{
    public static function calcularVenta($proyecto_id){
        try{
            DB::beginTransaction();
            $data_proyecto = VentaRO::datosProyecto($proyecto_id);
            $proyecto      = null;
            foreach ($data_proyecto as $item){
                $proyecto = $item;
            }
            $venta_viaticos = VentaRO::ventaViaticos($proyecto_id);
            $proyecto_ind   = ProyectosIndeplo::find($proyecto->id);
            $proyecto_ind->valor_viaticos = floatval($venta_viaticos);
            if($proyecto->tipo_proyecto != 6 and !empty($proyecto->tipo_proyecto)){
                if ($proyecto->tipo_proyecto == 2){ // Calcular la venta del tipo TKBS
                    $codigos = VentaRO::getCodigosTask($proyecto->id);
                    $valor   = 0;
                    foreach ($codigos as $codigo){
                        if ($codigo->codigo_id != null){
                            $month = date("m",strtotime($proyecto->fecha));
                            $year  = date("Y",strtotime($proyecto->fecha));
                            $pi_codigo = ProyectosIndeploCodigos::updateOrCreate(
                                [
                                    'proyecto_id' => $proyecto->id,
                                    'codigo_id'   => $codigo->codigo_id
                                ],
                                [
                                    'cantidad'   => $codigo->cantidad_codigo,
                                    'usuario_id' => 1,
                                    'mes'        => $month,
                                    'anio'       => $year
                                ]
                            );
                            $valor += $codigo->total_codigo;
                        }
                    }
                    $proyecto_ind->monto_venta = $valor;
                }
                if ($proyecto->tipo_proyecto == 3 || $proyecto->tipo_proyecto == 4){ // Calcular la venta tipo renta fija y etl
                    $codigos = VentaRO::getCodigosRentaETL($proyecto->id);
                    $valor   = 0;
                    foreach ($codigos as $codigo){
                        if ($codigo->id != null){
                            $month      = date("m",strtotime($proyecto->fecha));
                            $year       = date("Y",strtotime($proyecto->fecha));
                            $duracion   = intval($codigo->duracion);
                            $pi_codigo2 = ProyectosIndeploCodigos::updateOrCreate(
                                [
                                    'proyecto_id' => $proyecto_ind->id,
                                    'codigo_id'   => intval($codigo->codigo_id)
                                ],
                                [
                                    'cantidad'   => $duracion,
                                    'usuario_id' => 1,
                                    'mes'        => $month,
                                    'anio'       => $year
                                ]
                            );
                            if($duracion != 30) {
                                if($duracion == 31 || (($duracion == 28 || $duracion == 29) && $codigo->mes == '2') ){
                                    $valor += ($codigo->precio_dia * 30);
                                }
                                if($duracion < $codigo->lon_mes){
                                    if($codigo->dia_i==1 ){
                                        $valor += ($codigo->precio_dia * $duracion);
                                    }
                                    if($codigo->dia_f < $codigo->lon_mes && $codigo->dia_i>1){
                                        $valor += $valor += ($codigo->precio_dia*$duracion);
                                    }
                                    if($codigo->dia_f == $codigo->lon_mes){
                                        $valor += ($codigo->precio_dia*(30-$codigo->dia_i+1));
                                    }
                                }
                            }
                            else{
                                $valor += ($codigo->precio_dia * 30);
                            }
                        }
                    }
                    $proyecto_ind->monto_venta = $valor;
                }
            }
            if ($proyecto->tipo_proyecto == 6){
                $codigos = VentaRO::getCodigosPoliza($proyecto_ind->id);
                $total   = 0;
                if (!empty($codigos))
                    $total = $codigos[0]->total!= null ? $codigos[0]->total:0;
                $proyecto_ind->monto_venta = $total;
            }
            $proyecto_ind->save();
            DB::commit();
            return [
                'proyecto'       => $proyecto_ind->pedido,
                'id'             => $proyecto_ind->id,
                'wbs'            => $proyecto_ind->proyecto_nombre,
                'valor_codigos'  => $proyecto_ind->monto_venta,
                'valor_viaticos' => $proyecto_ind->valor_viaticos
            ];
            //return [$proyecto, $venta_viaticos, $proyecto_ind];
        }catch (Exception $e){
            DB::rollBack();
            return $e;
        }
    }

    /* ----------------------------------------------------------------------------------------
     *       Funcion para obtener los datos del proyecto
     * ----------------------------------------------------------------------------------------
     * @param   int $proyecto_id    Id del proyecto
     */
    public static function datosProyecto($proyecto_id){
        try{
            $data = DB::raw("
            SELECT
		    vpi.id,
		    vpi.numero_pedido AS pedido,
		    vpi.tipo_proyecto_id AS tipo_proyecto,
		    vpi.wbs,
		    vpi.tecnologia,
		    DATEDIFF(vpi.fecha_fin_estimada,vpi.fecha_inicio_estimada)+1 AS duracion,
		    vpi.fecha_inicio_estimada as fecha
		    FROM
		    incore.vista_proyectos_indeplo AS vpi
		    LEFT JOIN incore.catalogo_tipo_proyecto ctp ON vpi.tipo_proyecto = ctp.tipo
		    WHERE vpi.id=$proyecto_id
            ");
            $model = DB::select($data);
            return $model;
        }catch (Exception $e){
            return $e;
        }
    }

    /* ----------------------------------------------------------------------------------------
     *       Funcion para calcular la cantidad de los viaticos
     * ----------------------------------------------------------------------------------------
     * @param   int $proyecto_id    Id del proyecto
     */
    public static function ventaViaticos($proyecto_id){
        $data = DB::raw("
        SELECT
	        CASE WHEN v.tecnologia IN ( 'TAC0', 'TAC2', 'NOC0' ) AND v.fecha_deposito_real >= '2018-05-01'
			    THEN sum( ROUND( ( ( v.diario_viaticos *1.15) * v.viaticos_dias ) ) ) + sum( v.transporte_total *1.15) + sum( v.telefonia_total * (1.15 )) 
			    WHEN v.tecnologia IN ( 'NOC2' ) 
			    THEN 0 
			    ELSE sum( ( ( v.diario_viaticos *1.08) * v.viaticos_dias ) ) + sum( v.transporte_total *1.15) + sum( v.telefonia_total * (1.15 )) 
			END AS venta,
			v.pedido_id AS pedido 
			FROM incore.viaticos v 
			WHERE v.pedido_id = $proyecto_id 
			AND v.estatus NOT IN ( 1, 2, 9, 8 ) 
			GROUP BY v.pedido_id 
        UNION
			SELECT
			CASE
				WHEN pi.tecnologia IN ( 'TAC0', 'TAC2', 'NOC0' ) AND sah.fecha_solicitud >= '2018-04-01'
				THEN sum( sah.costo_real * (1.15 ) ) ELSE sum( sah.costo_real * (1.15 )) 
				END AS venta,
				risk_order AS pedido 
			FROM incore.solicitud_avion_hospedaje sah
			JOIN incore.proyectos_indeplo pi ON sah.risk_order = pi.id 
			WHERE sah.risk_order = $proyecto_id 
			GROUP BY sah.risk_order
        ");
        $model = DB::select($data);
        $venta = 0;
        if (!empty($model)){
            foreach ( $model as $item){
                $venta = $item->venta;
            }
        }
        return $venta;
    }

    /* ----------------------------------------------------------------------------------------
     *       Funcion para obtener los codigos del proyecto
     * ----------------------------------------------------------------------------------------
     * @param   int $proyecto_id    Id del proyecto
     */
    public static function getCodigosTask($proyecto_id){
        try{
            $data = DB::raw("
                SELECT
	                pec.codigo_id,
	                SUM( pec.cantidad_codigo ) AS cantidad_codigo,
	                cnc.precio * SUM( pec.cantidad_codigo ) AS total_codigo
                FROM incore.proyectos_entregables pe
	            LEFT JOIN incore.proyectos_entregables_codigos pec ON pec.proyecto_id = pe.id
	            LEFT JOIN incore.catalogo_nokia_codigos cnc ON cnc.id = pec.codigo_id 
                WHERE
	            pe.pedido_id = $proyecto_id 
                GROUP BY
	            codigo_id
                ");
            $models = DB::select($data);
            return $models;
        }catch (Exception $e){
            return $e;
        }
    }

    public static function getCodigosRentaETL($proyecto){
        try{
            $data = DB::raw("
            SELECT
            	vpi.id,
            	vpi.tipo_proyecto,
            	pir.empleado_id,
            	vpi.wbs,
            	vpi.tecnologia,
            	ecm.codigo_id,
            	( cnc.precio / 30 ) AS precio_dia,
            CASE
            		WHEN ( ecm.fecha_inicio <= vpi.fecha_inicio_estimada AND ecm.fecha_fin IS NULL ) THEN
            		DATEDIFF( vpi.fecha_fin_estimada, vpi.fecha_inicio_estimada ) + 1 
            		WHEN ( ecm.fecha_inicio >= vpi.fecha_inicio_estimada AND ecm.fecha_fin IS NULL ) THEN
            		DATEDIFF( vpi.fecha_fin_estimada, ecm.fecha_inicio ) + 1 
            		WHEN ( ecm.fecha_inicio <= vpi.fecha_inicio_estimada AND ecm.fecha_fin < vpi.fecha_fin_estimada ) THEN
            		DATEDIFF( ecm.fecha_fin, vpi.fecha_inicio_estimada ) + 1 
            		WHEN ( ecm.fecha_inicio >= vpi.fecha_inicio_estimada AND ecm.fecha_fin < vpi.fecha_fin_estimada ) THEN
            		DATEDIFF( ecm.fecha_fin, ecm.fecha_inicio ) + 1 
            		WHEN ( ecm.fecha_inicio <= vpi.fecha_inicio_estimada AND ecm.fecha_fin >= vpi.fecha_fin_estimada ) THEN
            		DATEDIFF( vpi.fecha_fin_estimada, vpi.fecha_inicio_estimada ) + 1 
            	END AS duracion,
            	DAY ( LAST_DAY( vpi.fecha_fin_estimada ) ) AS lon_mes,
            	MONTH ( vpi.fecha_fin_estimada ) AS mes,
            CASE
            		WHEN ( vpi.fecha_fin_estimada <= ecm.fecha_fin OR ecm.fecha_fin IS NULL ) THEN
            		DAY ( vpi.fecha_fin_estimada ) 
            		WHEN vpi.fecha_fin_estimada > ecm.fecha_fin THEN
            		DAY ( ecm.fecha_fin ) 
            	END AS dia_f,
            CASE
            		WHEN vpi.fecha_inicio_estimada >= ecm.fecha_inicio THEN
            		DAY ( vpi.fecha_inicio_estimada ) 
            		WHEN vpi.fecha_inicio_estimada < ecm.fecha_inicio THEN
            		DAY ( ecm.fecha_inicio ) 
            	END AS dia_i 
            FROM
            	incore.vista_proyectos_indeplo AS vpi
            	JOIN incore.proyectos_indeplo_recursos pir ON vpi.id = pir.proyecto_id
            	JOIN incore.empleados_codigos_movimientos ecm ON pir.empleado_id = ecm.empleado_id
            	LEFT JOIN incore.catalogo_nokia_codigos cnc ON cnc.id = ecm.codigo_id 
            WHERE
            	pir.proyecto_id = $proyecto 
            HAVING
            	duracion > 0
            ");
            $models = DB::select($data);
            return $models;
        }catch (Exception $e){
            return $e;
        }
    }

    public static function getCodigosPoliza($proyecto){
        try{
            $data = DB::raw("
            SELECT sum( cnc.precio ) AS total
            FROM incore.proyectos_indeplo_codigos pic
            	JOIN incore.catalogo_nokia_codigos cnc ON cnc.id = pic.codigo_id 
            WHERE proyecto_id = $proyecto
            ");
            $model = DB::select($data);
            return $model;
        }catch (Exception $e){
            return $e;
        }
    }
}