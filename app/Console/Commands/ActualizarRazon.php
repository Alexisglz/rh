<?php

namespace App\Console\Commands;

use App\Models\MovimientoRecurso;
use App\Models\VistaEmpleadosActivos;
use DateTime;
use DB;
use Illuminate\Console\Command;

class ActualizarRazon extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'service:razon';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Comando para actualizar la razon social del empleado';
    /**
     * @var \Illuminate\Config\Repository
     */
    private $user;
    /**
     * @var \Illuminate\Config\Repository
     */
    private $password;
    /**
     * @var \Illuminate\Config\Repository
     */
    private $language;

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->user     = config('app.soap_user');
        $this->password = config('app.soap_password');
        $this->language = config('app.soap_language');
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
        try{
            $empleados = VistaEmpleadosActivos::all();
            $actualizados = 0;
            foreach ($empleados as $empleado){
                $data = $this->especifico($empleado->empleado_num, $empleado->id_razon_capital);
                if ($data['ok'] == true){
                    $conn->beginTransaction();
                    $response = $data['data'];
                    $mr = MovimientoRecurso::where('empleado_id', '=', $empleado->id)->whereNull('fecha_baja')->first();
                    if ($mr){
                        $razon = DB::table('incore.catalogo_razonrh')->where('razon_id', '=',$mr->razon_rh)->first();
                        if ($razon){
                            $incore_razon = intval($razon->id_razon_capital);
                            $service_razon = intval($response->num_cia);
                            if ($incore_razon != $service_razon){
                                $mr->razon_rh = $service_razon;
                                $actualizados++;
                            }
                        }
                    }
                    $conn->commit();
                }
            }
            echo $actualizados;
        }catch (\Exception $e){
            $conn->rollBack();
            echo $e->getMessage();
        }
    }

    public function especifico($num, $cia){
        $fechainicio  = date('Y-m-d');
        $fechafin     = date('Y-m-d');

        /* Iniciar peticion al Web Service */
        $url         = 'http://ws.humaneland.net/wsConsulta/empleados?wsdl';
        $client      = new \SoapClient($url);
        $user        = $this->user;
        $pass        = $this->password;
        $params = [
            "cia"         => $cia,
            "usuario"     => $user,
            "password"    => $pass,
            "numEmp"      => $num,
            "fechainicio" => $fechainicio,
            "fechafin"    => $fechafin,
        ];
        $response = $client->__soapCall("getEspecifico", array($params));
        foreach ($response as $clave => $valor) {
            $aux = [];
            foreach ($valor as $instancia01 => $val) {
                $aux[] = $val;
            }
            $array[] = $aux;
        }
        if (!empty($array[0][2])){
            $item = $array[0][2];
            if (isset($item->s_mex) && $item->s_mex->curp){
                return [
                    'ok'   => true,
                    'data' => $item
                ];
            }
            else
                return [
                    'ok'   => false,
                    'data' => []
                ];
        }
        else return [
            'ok' => false,
            'data' => $array
        ];
    }
}
