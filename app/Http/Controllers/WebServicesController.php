<?php

namespace App\Http\Controllers;

use App\Empleados;
use App\Models\CatalogoRazonCapital;
use App\Models\CatalogoRazonRH;
use App\Models\MovimientosSueldo;
use App\Models\VistaEmpleadosActivos;
use DateTime;
use DB;
use Exception;
use Illuminate\Http\Request;

class WebServicesController extends Controller
{
    public function __construct()
    {
        $this->user     = config('app.soap_user');
        $this->password = config('app.soap_password');
        $this->language = config('app.soap_language');
    }

    public function actualizarEmpleados(Request $request){
        // dd($this->firstUpdate()); // Ejecutar esta funcion solo la primer vez que se suba a produccion
        $conn = DB::connection('incore');
        /*$response = $this->getRango(1853);
        $response = $this->getEspecifico(1179);
        dd($response);*/
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
            ->orderBy('empleado_id')
            ->get();
        //dd($no_actualizados);
        $actualizados = [];
        foreach ($no_actualizados as $empleado){
            try{
                $response = $this->getRango($empleado->empleado_id);
                if (!empty($response)){
                    $conn->beginTransaction();
                    $empleado->empleado_num = $response[0]->num_emp;
                    $empleado->curp         = $response[0]->s_mex->curp;
                    $empleado->nss          = $response[0]->s_mex->afil_imss;
                    $empleado->cp           = $response[0]->s_mex->cod_pos;
                    $empleado->mail         = $response[0]->s_mex->email_1 != null && $response[0]->s_mex->email_1 != "" ? strtoupper($response[0]->s_mex->email_1):$empleado->mail;
                    $empleado->actualizado  = 1;
                    $empleado->save();
                    $actualizados[] = [$response[0]->num_emp,$empleado->empleado_id];
                    $conn->commit();
                }
            }catch (\Exception $e){
                $conn->rollBack();
            }
        }
        dd($actualizados, $no_actualizados);
    }

    public function getEmpleados($comp, $fecha_1, $fecha_2){
        $total       = [];
        $url         = 'http://ws.humaneland.net/wsConsulta/empleados?wsdl';
        $client      = new \SoapClient($url);
        $cia         = $comp;
        $user        = $this->user;
        $pass        = $this->password;
        $numEmp      = 0 ;
        $for1        = new DateTime($fecha_1);
        $for2        = new DateTime($fecha_2);
        $fechainicio = $for1->format('d/m/Y');
        $fechafin    = $for2->format('d/m/Y');
        $params = [
            "cia"         => $cia,
            "usuario"     => $user,
            "password"    => $pass,
            "numEmp"      => $numEmp,
            "fechainicio" => $fechainicio,
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
                if ($item->s_mex->curp){
                    $total[] = $item;
                }
            }
        }
        return $total;
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
                "fechainicio" => '01/01/2016',
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
                    elseif ($item->s_mex->afil_imss == $empleado->nss){
                        return [$item];
                    }
                }
            }
            return [];
        }catch (Exception $e){
        }
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

    public function firstUpdate(){
        $conn = DB::connection('incore');
        $conn->beginTransaction();
        try{
            $vista_empleados    = DB::table('vista_empleados_nomina')->get();
            foreach ($vista_empleados as $item){
                $empleado = Empleados::find($item->empleado_id);
                $empleado->empleado_num = $item->num_empleado;
                $empleado->actualizado  = 1;
                $empleado->save();
            }
            $conn->commit();
            return true;
        }catch (Exception $e){
            $conn->rollBack();
            dd($e);
        }
    }

    public function getLote(){
        try{
            $info = array();
            $options = array(
                'cache_wsdl' => 0,
                'trace' => 1,
                'stream_context' => stream_context_create(array(
                    'ssl' => array(
                        'verify_peer' => false,
                        'verify_peer_name' => false,
                        'allow_self_signed' => true
                    )
                )));
            $data = [
                'numeroLote' => 56,
                'proceso'    => 65,
                'usuario'    => 'rhindeplo1',
                'password'   => $this->password,
                'cia'        => 677
            ];
            $client = new \SoapClient("https://ws.humaneland.net/wsIncidencias/Lotecreado?wsdl", $options);
            $response = $client->__soapCall("Lotecreado", array($data));
            foreach ($response as $clave => $valor) {
                foreach ($valor as $instancia01 => $val) {
                    array_push($info, $val);
                }
            }
            dd($info);
        }catch (\Exception $e){
            dd($e);
        }
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

    public function actualizarSueldos(){
        $empleados = VistaEmpleadosActivos::where('empleado_estatus','ACTIVO')->orderBy('id')->limit(10)->get();
        //dd($empleados);
        $array = [];
        foreach ($empleados as $empleado){
            //dd($empleado);
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
                        $conn->commit($array);
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
                        dd($e);
                    }
                }
            }
        }
        echo json_encode([
            'actualizados'=>count($array),
            'datos'=>$array
        ]);
    }
}
