<?php

namespace App\Http\Controllers;

use App\CatalogoWbs;
use App\Classes\Poliza;
use App\Classes\RentaFijaETL;
use App\Classes\TaskBased;
use App\Classes\VentaRO;
use App\Events\AltaEvents;
use App\Events\BajasEvents;
use App\SolBajaNomina;
use App\Solicitudes;
use Illuminate\Http\Request;

class WbsController extends Controller
{
    public function getWbs(Request $request){
    	$campo     = $request->valor;
    	$siguiente = $request->campo;
    	$tabla     = $request->tabla;

    	$cliente    = $request->cliente;
        $servicio   = $request->servicio;
        $region     = $request->region;
        $tecnologia = $request->tecnologia;
        $grupo      = $request->grupo;

        $servicios = CatalogoWbs::getSiguiente($campo,$siguiente,$tabla,$cliente,$servicio,$region,$tecnologia,$grupo);
        return $servicios;
    }

    public function taskBased(){
        $codigos = TaskBased::taskBased(2271);
        return $codigos;
    }

    public function rentaEtl(){
        $codigos = RentaFijaETL::create(2287);
        return $codigos;
    }

    public function poliza(){
        $codigos = Poliza::create(2271);
        return $codigos;
    }

    public function calcularVentaRo(){
        $venta = VentaRO::calcularVenta(48369);
        return $venta;
    }

    public function enviarAlta(){
        $sol = Solicitudes::find(1);
        $sol_baja             = SolBajaNomina::find(27);
        event(new BajasEvents($sol_baja, 'confirmar_herra'));
        //event(new AltaEvents($sol, 'notificar_dir'));
        dd($sol_baja);
    }

    public function fresh(){
        $api_key = "DqFy7zsCOtSpTP4SzxN";
        $password = "x";
        $yourdomain = "indeploinc";
        $url = "https://$yourdomain.freshdesk.com/api/v2/search/tickets?query=\"status:2%20AND%20created_at:'2019-07-10'\"";
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_HEADER, true);
        curl_setopt($ch, CURLOPT_USERPWD, "$api_key:$password");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $server_output = curl_exec($ch);
        $info = curl_getinfo($ch);
        $header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
        $headers = substr($server_output, 0, $header_size);
        $response = substr($server_output, $header_size);
        if($info['http_code'] == 200) {
            $array = json_decode($response,true);
            $array2 = [];
            foreach ($array['results'] as $item){
                $array2 []=$this->specific($item['id']);
            }
            //copy($array['attachments'][0]['attachment_url'], '/var/www/html/pdf.pdf',777);
            //$file = file_get_contents($array['attachments'][0]['attachment_url']);
            //file_put_contents('file.pdf', $file);
            dd($array, $array2);
        } else {
            if($info['http_code'] == 404) {
                echo "Error, Please check the end point \n";
            } else {
                echo "Error, HTTP Status Code : " . $info['http_code'] . "\n";
                echo "Headers are ".$headers;
                echo "Response are ".$response;
            }
        }
        curl_close($ch);
    }

    public function specific($id){
        $api_key = "DqFy7zsCOtSpTP4SzxN";
        $password = "x";
        $yourdomain = "indeploinc";
        $url = "https://$yourdomain.freshdesk.com/api/v2/tickets/$id";
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_HEADER, true);
        curl_setopt($ch, CURLOPT_USERPWD, "$api_key:$password");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $server_output = curl_exec($ch);
        $info = curl_getinfo($ch);
        $header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
        $headers = substr($server_output, 0, $header_size);
        $response = substr($server_output, $header_size);
        if($info['http_code'] == 200) {
            echo "Tickets fetched successfully, the response is given below \n";
            echo "Response Headers are \n";
            echo $headers."\n";
            echo "Response Body \n";
            echo "$response \n";
            $array = json_decode($response,true);
            //copy($array['attachments'][0]['attachment_url'], '/var/www/html/pdf.pdf',777);
            //$file = file_get_contents($array['attachments'][0]['attachment_url']);
            //file_put_contents('file.pdf', $file);
        } else {
            if($info['http_code'] == 404) {
                echo "Error, Please check the end point \n";
            } else {
                echo "Error, HTTP Status Code : " . $info['http_code'] . "\n";
                echo "Headers are ".$headers;
                echo "Response are ".$response;
            }
            $array = [];
        }
        curl_close($ch);
        return $array;
    }

    public function cerrarServ(){
        $serv = RentaFijaETL::close(2074);
        return $serv;
    }

    public function cerrarPolz(){
        $serv = Poliza::close(1105);
        return $serv;
    }

    public function cerrarTkbs(){
        $serv = TaskBased::close(34);
        return $serv;
    }
}