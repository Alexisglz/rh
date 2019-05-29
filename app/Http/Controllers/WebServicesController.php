<?php

namespace App\Http\Controllers;

use App\Empleados;
use App\Models\CatalogoRazonCapital;
use App\Models\CatalogoRazonRH;
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
        $response = $this->getRango(1853);
        $response = $this->getEspecifico(1179);
        dd($response);
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
        dd($response, $no_actualizados);
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

    public function getEspecifico($id){
        /* Buscar al empleado para obtener su fecha de ingreso y su esquema de cotratacion */
        $empleado    = DB::table('vista_empleados_nomina')
            ->where('empleado_id', '=', $id)->first();//2148

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
        $numEmp      = $empleado->num_empleado;
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
        else return "no existe";
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
}
