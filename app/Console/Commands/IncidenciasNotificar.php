<?php

namespace App\Console\Commands;

use App\Models\IncidenciaPeriodo;
use App\VistaIncidencias;
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
            ->where('fecha_envio','>=', $this->date)->first();
        $coordina  = date('Y-m-d', strtotime($periodo->fecha_fin));
        $director  = date('Y-m-d', strtotime($periodo->limite_direccion));
        $directivo = date('Y-m-d', strtotime($periodo->limite_directivo));
        if ($director == $this->date){
            $deduc = VistaIncidencias::where('id_periodo',$periodo->id)
                ->where('tipo_incidencia','DEDUCCION')->where('estatus','POR VALIDAR DIRECCION')->count();
            $s_venta = VistaIncidencias::where('id_periodo',$periodo->id)
                ->where('venta','<=',0)->where('tipo_incidencia', '!=','DEDUCCION')->where('estatus','POR VALIDAR DIRECCION')->count();
            $c_venta = VistaIncidencias::where('id_periodo',$periodo->id)
                ->where('venta','>',0)->where('tipo_incidencia', '!=','DEDUCCION')->where('estatus','POR VALIDAR DIRECCION')->count();
            $data = [];
            if ($deduc > 0)
                $data[] = 'aut_cancel_inci_dec';
            if ($s_venta > 0)
                $data[] = 'aut_cancel_inci_s_v';
            if ($c_venta > 0)
                $data[] = 'aut_cancel_inci_c_v';
            event(new \App\Events\IncidenciasNotificar('auth',$data,'/auth'));
            echo "Se envio a director";
        }
        if ($directivo == $this->date){
            event(new \App\Events\IncidenciasNotificar('dir',[],'/autorizar'));
            echo "Se envio a directivo";
        }
        if ($coordina == $this->date){
            event(new \App\Events\IncidenciasNotificar('coord',[],'/incidencias'));
            echo "Se envio a coordinador";
        }
        else echo "No es el dia";
    }
}
