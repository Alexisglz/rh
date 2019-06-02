<?php

namespace App\Console\Commands;

use App\Empleados;
use DateTime;
use DB;
use Exception;
use Illuminate\Console\Command;

class ServicesCommands extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'service:numemp';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Comando para actualizar los numeros de empleados de Web Service';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $conn = DB::connection('incore');
        $no_actualizados = Empleados::with('getMovimientoRecurso')
            ->whereHas('getMovimientoRecurso', function ($q){
                $q->with('getRazonRH');
                $q->whereHas('getRazonRH', function ($q2){
                    $q2->with('getRazonCapital');
                    $q2->whereHas('getRazonCapital', function ($q3){
                        $q3->whereNotNull('id');
                    });
                });
            })
            ->where('actualizado','=',0)
            ->whereNull('empleado_fecha_baja')
            ->whereNull('baja_rh')
            ->orderByDesc('empleado_id')
            ->get();
        $actualizados = [];
        foreach ($no_actualizados as $empleado){
            try{
                $conn->beginTransaction();
                $response = $this->getRango($empleado->empleado_id);
                if (!empty($response)){
                    $empleado->empleado_num = $response[0]->num_emp;
                    $empleado->actualizado  = 1;
                    $empleado->save();
                    $actualizados[] = [$response[0]->num_emp,$empleado->empleado_id];
                }
                $conn->commit();
            }catch (\Exception $e){
                $conn->rollBack();
            }
        }
        echo json_encode($actualizados);
        echo json_encode($no_actualizados);
    }

    public function getRango($id){
        try{
            $cia         = 0;
            /* Buscar al empleado para obtener su fecha de ingreso y su esquema de cotratacion */
            $empleado    = Empleados::where('empleado_id','=',$id)
                ->with('getMovimientoRecurso')->first();//2148

            $cia = $empleado->getMovimientoRecurso->getRazonRH->getRazonCapital->id;

            $fechainicio  = (new DateTime($empleado->empleado_fecha_alta))->modify('first day of this month')
                ->format('d/m/Y');
            $fechafin     = (new DateTime(date('Y-m-d')))->modify('last day of this month')
                ->format('d/m/Y');

            /* Iniciar peticion al Web Service */
            $url         = 'http://ws.humaneland.net/wsConsulta/empleados?wsdl';
            $client      = new \SoapClient($url);
            $user        = $this->user;
            $pass        = $this->password;
            $numEmp      = 0;
            $params = [
                "cia"         => $cia,
                "usuario"     => $user,
                "password"    => $pass,
                "numEmp"      => $numEmp,
                "fechainicio" => '01/01/2019',
                "fechafin"    => $fechafin,
            ];
            $response = $client->__soapCall("getFechas", array($params));
            foreach ($response as $clave => $valor) {
                $aux = [];
                foreach ($valor as $instancia01 => $val) {
                    $aux[] = $val;
                }
                $array[] = $aux;
            }
            if (!empty($array[0][2])){
                foreach ($array[0][2] as $item){
                    if ($item->s_mex->curp == $empleado->curp){
                        return [$item];
                    }
                }
            }
            return [];
        }catch (Exception $e){
        }
    }
}
