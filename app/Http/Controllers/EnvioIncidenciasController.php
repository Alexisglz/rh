<?php

namespace App\Http\Controllers;

use App\GlobalModel;
use App\Incidencias;
use App\incidencias_lote;
use App\User;
use Artisaninweb\SoapWrapper\SoapWrapper;
use DB;
use Illuminate\Http\Request;

class EnvioIncidenciasController extends Controller
{

    protected $rules = [
        'grupo' => ['required']
    ];

    protected $soapWrapper;

    public function __construct(SoapWrapper $soapWrapper)
    {
        $this->soapWrapper = $soapWrapper;
    }

    public function index()
    {
        $this->authorize('access',[User::class, 'listado_lote']);
        return view('envio_incidencias.envio_incidencias');
    }

    public function InsertLote(Request $request)
    {
        $this->authorize('access',[User::class, 'enviar_lote']);    
        $info = array();
        try {
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
            $data = $request->toArray();
            $client = new \SoapClient("https://ws.humaneland.net/wsIncidencias/ProcesarIncidencias?wsdl", $options);
            $response = $client->__soapCall("Procesaincidencias", array($data));
            foreach ($response as $clave => $valor) {
                foreach ($valor as $instancia01 => $val) {
                    array_push($info, $val);
                }
            }

            $array = [];

            if ($info[2] == 0) {
                $array = [
                    'ok' => false,
                    'data' => $info[0]
                ];
                return response()->json($array);
            } else {
                $time = strtotime($info[1]);
                $newformat = date('Y-m-d', $time);
                $nameLote = $data['incidencia'][0]['lote'];
                $idLote = $this::insertalote($nameLote, $newformat, 'Enviado', $info[2],$info[3]);
                foreach ($data['incidencia'] as $t) {
                    $id_tagg = $t['id'];
                    $this::UpdateIncidenciaLote($idLote, $id_tagg);
                }
                $array = [
                    'ok' => true,
                    'data' => $info[0]
                ];
                return response()->json($array);
            }
        } catch (\Exception $e) {
            return $e;
        }

    }

    public function insertalote($nombre_lote, $fecha_envio, $estatus, $idlote, $proceso)
    {
        $sol = new incidencias_lote();
        $sol->nombre_lote = $nombre_lote;
        $sol->fecha_envio = $fecha_envio;
        $sol->id_lote = $idlote;
        $sol->proceso = $proceso;
        $sol->estatus = $estatus;
        $sol->save();
        return $sol->id;
    }

    public function UpdateIncidenciaLote($idlote, $idreg)
    {
        try{
            DB::begintransaction();
            $incidencia              = Incidencias::find($idreg);
            $incidencia->id_lote     = $idlote;
            $incidencia->status_auth = 'ENVIADO';
            $incidencia->save();
            DB::commit();
            return true;
        }catch (\Exception $e){
            DB::rollBack();
            return false;
        }
    }

}
