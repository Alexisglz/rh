<?php

namespace App\Console\Commands;

use App\Incidencias;
use App\Models\IncidenciaPeriodo;
use DB;
use Illuminate\Console\Command;

class IncidenciasCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'incidencias:cancelar';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Comando para cancelar incidencias fuera de periodo';
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
        try{
            DB::beginTransaction();
            $periodo = IncidenciaPeriodo::where('fecha_inicio','<=', $this->date)
                ->where('fecha_fin','>=', $this->date)->first();
            if ($periodo){
                $incidencias = Incidencias::where('fecha_solicitud','<', $periodo->fecha_inicio)
                    ->whereNull('status_auth')
                    //->where('id','=',13)
                    ->get();
                if ($incidencias){
                    foreach ($incidencias as $incidencia) {
                        $incidencia->status_auth = 'CANCELAR';
                        $incidencia->area_cancelar = 'ADMIN-CRON';
                        $incidencia->save();
                    }
                    $msg = strval("Correcto: ".count($incidencias)." incidencias canceladas");
                }
                else
                    $msg = "No hay incidencias vencidas";
            }
            else
                $msg = "Fuera de periodo";
            echo $msg;
            DB::commit();
        }catch (\Exception $e){
            DB::rollBack();
            echo $e;
        }
    }
}
