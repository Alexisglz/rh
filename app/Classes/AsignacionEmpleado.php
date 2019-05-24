<?php


namespace App\Classes;


use DB;
use Exception;

class AsignacionEmpleado
{
    public static function computoEmpleado($id_empleado){
        try{
            $computo = DB::select(DB::raw('SELECT
						equipo_serie,equipo_precio,asign_fecha,baja_fecha,equipo_modelo,equipo_id,empleado_id,equipo_estatus
					FROM
						incore.asignaciones_computo
					JOIN incore.computo ON
						computo.equipo_id = asignaciones_computo.asign_tool_id
					JOIN incore.empleados ON
						asignaciones_computo.asign_empleado_id = empleados.empleado_id
					LEFT JOIN incore.baja_computo ON
						baja_computo.baja_asign_id = asignaciones_computo.asign_id
					WHERE
						asign_empleado_id = '.$id_empleado.'
					AND 
						baja_fecha IS NULL
					ORDER BY
						baja_asign_id ASC'));
            $accesorios = DB::select(DB::raw('
                    SELECT
						accesorio_tipo,accesorio_serie,accesorio_desc,asign_fecha,baja_fecha
					FROM
						incore.asignaciones_accesorios
					JOIN incore.accesorios ON
						accesorios.accesorio_id = asignaciones_accesorios.asign_tool_id
					LEFT JOIN incore.baja_accesorios ON
						baja_accesorios.baja_asign_id = asignaciones_accesorios.asign_id
					WHERE
						asign_empleado_id ='.$id_empleado.'
					AND 
						baja_fecha IS NULL'));
            return [
                'computo'    => $computo,
                'accesorios' => $accesorios
            ];
        }catch (\Exception $e){
            return $e;
        }
    }

    public static function celularesLineasEmpleado($id_empleado){
        try{
            $celulares = DB::select(DB::raw('SELECT
					tel_modelo,tel_tipo,tel_imei,tel_marca,asign_fecha,baja_fecha,tel_id,empleado_id
					FROM
						incore.asignaciones_celulares
					JOIN incore.celulares ON
						celulares.tel_id = asignaciones_celulares.asign_tool_id
					JOIN incore.empleados ON
						asignaciones_celulares.asign_empleado_id = empleados.empleado_id
					LEFT JOIN incore.baja_celular ON
						baja_celular.baja_asign_id = asignaciones_celulares.asign_id
					LEFT JOIN incore.lineas_telefonicas ON
						lineas_telefonicas.lineaIMEIEquipo = celulares.tel_imei
					WHERE
						baja_fecha IS NULL
					AND
						asign_empleado_id = '.$id_empleado));
            $lineas = DB::select(DB::raw('SELECT
				lineaTel_numero,lineaTipo,plan_nombre,asign_fecha,baja_fecha,lineaIMEIEquipo,tel_marca,
                tel_modelo,empleado_id,IdLineaTelefonica
				FROM incore.asignaciones_lineas
				JOIN incore.lineas_telefonicas ON lineas_telefonicas.IdLineaTelefonica = asignaciones_lineas.asign_linea_id
				JOIN incore.empleados ON asignaciones_lineas.asign_empleado_id = empleados.empleado_id
				LEFT JOIN incore.baja_linea ON baja_linea.baja_asign_id = asignaciones_lineas.asign_id
				LEFT JOIN incore.celulares ON lineas_telefonicas.lineaIMEIEquipo = celulares.tel_imei
				JOIN incore.catalogo_planes_lineas ON lineas_telefonicas.lineaTel_plan = catalogo_planes_lineas.plan_id
				WHERE baja_fecha IS NULL
				AND asign_empleado_id ='.$id_empleado));
            return [
                "celulares" => $celulares,
                "lineas"    => $lineas
            ];
        }catch (Exception $e){
            return $e;
        }
    }
    public static function autosEmpleado($id_empleado){
        try{
            $autos = DB::select(DB::raw('
            SELECT IdAutomovil,auto_placa,auto_modelo,IdArrendadora,asign_fecha,baja_fecha,empleado_id
		    FROM incore.asignaciones_autos
		    JOIN incore.automoviles ON automoviles.IdAutomovil = asignaciones_autos.asign_tool_id
		    JOIN incore.empleados ON asignaciones_autos.asign_empleado_id = empleados.empleado_id
		    LEFT JOIN incore.baja_auto ON baja_auto.baja_asign_id = asignaciones_autos.asign_id
		    WHERE baja_fecha IS NULL
		    AND asign_empleado_id ='.$id_empleado.'
		    ORDER BY baja_asign_id ASC
        '));
            return $autos;
        }catch (Exception $e){
            return $e;
        }
    }
    public static function HerramientasEmpleado($id_empleado){
        try{
            $herramientas = DB::table('vista_herramienta_empleado')
                ->where('empleado_id', '=',$id_empleado)
                ->get();
            return $herramientas;
        }catch (Exception $e){
            return $e;
        }
    }
}