<?php

namespace App\Console\Commands;

use App\Models\MovimientosSueldo;
use App\Models\VistaEmpleadosActivos;
use DateTime;
use DB;
use Illuminate\Console\Command;

class SueldosCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sueldos:actualizar';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Actualizar los sueldos de los empleados con la API';
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
        $empleados = VistaEmpleadosActivos::where('empleado_estatus','ACTIVO')->get();
        $array = [];
        foreach ($empleados as $empleado){
            $sueldo = $this->calcularSueldo($empleado->id);
            if (count($sueldo) > 0){
                $sueldo_total_actual     = floatval($empleado->sueldo_imss) + floatval($empleado->sueldo_asimilado);
                $sueldo_imss_actual      = floatval($empleado->sueldo_imss);
                $sueldo_asimilado_actual = floatval($empleado->sueldo_asimilado);
                $sueldo_total_api        = floatval($sueldo['total']);
                $sueldo_imss_api         = floatval($sueldo['tradicional']);
                $sueldo_asimilado_api    = floatval($sueldo['asimilado']);
                if ($sueldo_total_actual != $sueldo_total_api){
                    $conn = DB::connection('incore');
                    try{
                        $conn->beginTransaction();

                        $mov_antiguo            = MovimientosSueldo::find($empleado->movimiento_sueldo_id);
                        $mov_antiguo->fecha_fin = date('Y-m-d');
                        $mov_antiguo->save();

                        $mov_nuevo                   = new MovimientosSueldo();
                        $mov_nuevo->empleado_id      = $empleado->id;
                        $mov_nuevo->sueldo_mensual   = $sueldo_total_api;
                        $mov_nuevo->sueldo_imss      = $sueldo_imss_api;
                        $mov_nuevo->sueldo_asimilado = $sueldo_asimilado_api;
                        $mov_nuevo->fecha_inicio     = date('Y-m-d');
                        $mov_nuevo->user_log         = 'incore';
                        $mov_nuevo->fecha_inicio     = date('Y-m-d H:i:s');
                        $mov_nuevo->save();
                        $conn->commit();
                        $array[] = [
                            'id'                      => $empleado->id,
                            'nombre'                  => $empleado->nombre_completo,
                            'sueldo_actual'           => $sueldo_total_actual,
                            'sueldo_imss_actual'      => $sueldo_imss_actual,
                            'sueldo_asimilado_actual' => $sueldo_asimilado_actual,
                            'sueldo_total_api'        => $sueldo_total_api,
                            'sueldo_imss_api'         => $sueldo_imss_api,
                            'sueldo_asimilado_api'    => $sueldo_asimilado_api,
                        ];
                    }catch (\Exception $e){
                        $conn->rollBack();
                    }
                }
            }
        }
        echo json_encode([
            'actualizados'=>count($array),
            'datos'=>$array
        ]);
    }

    public function getSueldoEspecifico($id = 2150){
        /* Buscar al empleado para obtener su fecha de ingreso y su esquema de cotratacion */
        $empleado    = DB::table('vista_empleados_nomina')
            ->where('empleado_id', '=', $id)->first();//2148

        if ($empleado == null){
            return [
                'ok'   => false,
                'data' => []
            ];
        }
        $cia         = $empleado->id;

        $fechainicio  = (new DateTime($empleado->empleado_fecha_alta))->modify('first day of this month')
            ->format('d/m/Y');
        $fechafin     = (new DateTime(date('Y-m-d')))->modify('last day of this month')
            ->format('d/m/Y');

        /* Iniciar peticion al Web Service */
        $url         = 'http://ws.humaneland.net/wsConsulta/Importes?wsdl';
        $client      = new \SoapClient($url);
        $user        = $this->user;
        $pass        = $this->password;
        $numEmp      = $empleado->empleado_num;
        $params = [
            "cia"         => $cia,
            "usuario"     => $user,
            "password"    => $pass,
            "numEmp"      => $numEmp,
            "fechainicio" => $fechainicio,
            "fechafin"    => $fechafin,
        ];
        $response = $client->__soapCall("consultaImporte", array($params));
        foreach ($response as $clave => $valor) {
            $aux = [];
            foreach ($valor as $instancia01 => $val) {
                $aux[] = $val;
            }
            $array[] = $aux;
        }
        if (!empty($array[0][1])){
            $item = $array[0][1];
            if (isset($item->numEmp)){
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

    public function calcularSueldo($id = 2150){
        $response = [];
        $empleado = $this->getEspecifico($id);
        $sueldo   = $this->getSueldoEspecifico($id);
        if ($empleado['ok'] == true && $sueldo['ok']== true){
            $emp = $empleado['data'];
            $sue = $sueldo['data'];
            $total = floatval($sue->importe);
            $trad = round(($emp->sueldo * 30),0);
            $asim = $total - $trad;
            $response = [
                'total' => $total,
                'tradicional' => $trad,
                'asimilado' => $asim
            ];
        }
        return $response;
    }

    public function getEspecifico($id){
        /* Buscar al empleado para obtener su fecha de ingreso y su esquema de cotratacion */
        $empleado    = DB::table('vista_empleados_nomina')
            ->where('empleado_id', '=', $id)->first();//2148

        if ($empleado == null){
            return [
                'ok'   => false,
                'data' => []
            ];
        }

        $cia         = $empleado->id;

        $fechainicio  = (new DateTime($empleado->empleado_fecha_alta))->modify('first day of this month')
            ->format('d/m/Y');
        $fechafin     = (new DateTime(date('Y-m-d')))->modify('last day of this month')
            ->format('d/m/Y');

        /* Iniciar peticion al Web Service */
        $url         = 'http://ws.humaneland.net/wsConsulta/empleados?wsdl';
        $client      = new \SoapClient($url);
        $user        = $this->user;
        $pass        = $this->password;
        $numEmp      = $empleado->empleado_num;
        $params = [
            "cia"         => $cia,
            "usuario"     => $user,
            "password"    => $pass,
            "numEmp"      => $numEmp,
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
            if ($item->s_mex->curp){
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
