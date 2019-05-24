<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class VistaIncidenciasPrincipal extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("
          CREATE VIEW vista_incidencias_sin_lote AS
          (
            SELECT
                i.id AS id,
                concat_ws(
                    ' ',
                    e_asign.empleado_nombre,
                    e_asign.empleado_apaterno,
                    e_asign.empleado_amaterno
                ) AS empleado,
                cat.nombre AS tipo_incidencia,
                i.fecha_solicitud AS fecha_solicitud,
                i.fecha_inicio AS fecha_inicio,
                i.fecha_fin AS fecha_fin,
                i.dias AS duracion,
                i.monto AS monto,
                i.motivo AS motivo,
                concat_ws(
                    ' ',
                    u1.nombre,
                    u1.apellido
                ) AS solicitante
            FROM        
                incidencias i
                JOIN incidencias_catalogo cat ON 
                    cat.id = i.id_incidencia_tipo
                LEFT JOIN empleados e_asign ON 
                    e_asign.empleado_id = i.id_empleado
                LEFT JOIN usuarios u1 ON 
                    u1.id_usuario = i.id_solicitante
            WHERE
                i.id_lote is null
          )
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement("DROP VIEW vista_incidencias_sin_lote");
    }
}
