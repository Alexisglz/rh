<?php

namespace App\Console\Commands;

use App\Models\IncidenciaPeriodo;
use App\VistaIncidenciasSinLote;
use Illuminate\Console\Command;

class IncidenciasNotificar extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'incidencias:notificar';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Comando para enviar correo de autorizacion de incidencias';
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
        $periodo = IncidenciaPeriodo::where('fecha_inicio','<=', $this->date)
            ->where('fecha_fin','>=', $this->date)->first();
        $deduc = VistaIncidenciasSinLote::whereBetween('fecha_solicitud',[$periodo->fecha_inicio, $periodo->fecha_fin])
            ->where('tipo_incidencia','DEDUCCION')->whereNull('estatus')->count();
        $s_venta = VistaIncidenciasSinLote::whereBetween('fecha_solicitud',[$periodo->fecha_inicio, $periodo->fecha_fin])
            ->where('venta','<=',0)->where('tipo_incidencia', '!=','DEDUCCION')->whereNull('estatus')->count();
        $c_venta = VistaIncidenciasSinLote::whereBetween('fecha_solicitud',[$periodo->fecha_inicio, $periodo->fecha_fin])
            ->where('venta','>',0)->where('tipo_incidencia', '!=','DEDUCCION')->whereNull('estatus')->count();
        $fin_periodo = date('Y-m-d', strtotime($periodo->fecha_envio. ' - 1 days'));
        $data = [];
        if ($deduc > 0)
            $data[] = 'aut_cancel_inci_dec';
        if ($s_venta > 0)
            $data[] = 'aut_cancel_inci_s_v';
        if ($c_venta > 0)
            $data[] = 'aut_cancel_inci_c_v';
        if ($fin_periodo == $this->date){
            event(new \App\Events\IncidenciasNotificar('auth',$data));
            echo "Se envio";
        }
        else echo "No es el dia";
    }
}
