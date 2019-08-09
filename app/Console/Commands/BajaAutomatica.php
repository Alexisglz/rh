<?php

namespace App\Console\Commands;

use App\Classes\Poliza;
use App\Classes\RentaFijaETL;
use App\Classes\TaskBased;
use App\Empleados;
use App\Models\EmpleadoCodigoMovimiento;
use App\Models\MovimientoRecurso;
use App\Models\MovimientosCoordinador;
use App\Models\MovimientosProyecto;
use App\Models\MovimientosPuesto;
use App\Models\MovimientosSueldo;
use App\Models\VistaSolBajas;
use App\SolBajaNomina;
use DB;
use Illuminate\Console\Command;

class BajaAutomatica extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'bajas:automatica';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Comando para dar de baja automaticamente a los empleados que no deben herramienta';
    /**
     * @var false|string
     */
    private $date;

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->date = date('Y-m-d');
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $bajas = VistaSolBajas::where('baja_definitiva', '=', 'PENDIENTE')
            ->whereNotNull('fecha_baja_nom')
            ->where('baja_computo', '=', 'OK')
            ->where('baja_auto', '=', 'OK')
            ->where('baja_celular', '=', 'OK')
            ->where('baja_almacen', '=', 'OK')
            ->where('baja_credencial', '=', 'OK')
            ->where('fecha_baja_nom','<',$this->date)
            ->get();
        $conn = DB::connection('incore');
        foreach ($bajas as $baja_v) {
            try {
                $conn->beginTransaction();

                $baja                  = SolBajaNomina::find($baja_v->id);
                $baja->baja_definitiva = $this->date;
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
            } catch (\Exception $e) {
                $conn->rollBack();
                echo json_encode([
                    'ok' => false,
                    'error' => $e->getMessage()
                ]);
            }
        }
        echo json_encode([
            'bajas_totales' => count($bajas),
            'bajas' => $bajas
        ]);
    }
}
