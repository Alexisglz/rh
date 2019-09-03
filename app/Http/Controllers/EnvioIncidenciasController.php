<?php

namespace App\Http\Controllers;

use App\GlobalModel;
use App\Incidencias;
use App\incidencias_lote;
use App\Models\VistaIncidenciasPeriodo;
use App\User;
use Artisaninweb\SoapWrapper\SoapWrapper;
use DB;
use Illuminate\Http\Request;

class EnvioIncidenciasController extends Controller
{

    protected $rules = [
        'grupo' => ['required']
    ];

    protected $soapWrapper,$user,$password;

    public function __construct(SoapWrapper $soapWrapper)
    {
        $this->soapWrapper = $soapWrapper;
        $this->user     = config('app.soap_user');
        $this->password = config('app.soap_password');
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
        $params = [
            'usuario' => $this->user,
            'password' => $this->password,
        ];
        $ids = $request->ids;
        $nombre = $request->lote;
        if (empty($ids)){
            return response()->json([
                'ok' => false,
                'data' => 'No se seleccionaron incidencias'
            ]);
        }
        $i_format = [];
        foreach ($ids as $id){
            $vista_i = VistaIncidenciasPeriodo::find($id);
            $fecha = $vista_i->fecha_inicio==null?"":date("d/m/Y", strtotime($vista_i->fecha_inicio));
            $plantilla = [
                'id'        => $vista_i->id,
                'concepto'  => $vista_i->id_tipo,
                'empleado'  => $vista_i->emp_id,
                'importe'   => $vista_i->monto==null?"":$vista_i->monto,
                'turno'     => '',
                'fecha'     => $fecha,
                'vt1'       => $vista_i->duracion==null?"":$vista_i->duracion,
                'vt2'       => '',
                'vt3'       => '',
                'vt4'       => '',
                'zona'      => '29',
                'area'      => '',
                'centro'    => '',
                'linea'     => '',
                'factor'    => '',
                'puesto'    => '',
                'gral_cpto' => '',
                'cia'       => '677',
                'proceso'   => '065',
                'lote'      => $nombre,
            ];
            $i_format[] = $plantilla;
        }
        $params['incidencia'] = $i_format;
        //dd($params);
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
            $response = $client->__soapCall("Procesaincidencias", array($params));
            foreach ($response as $clave => $valor) {
                foreach ($valor as $instancia01 => $val) {
                    array_push($info, $val);
                }
            }

            $array = [];
            //dd($info);
            if (isset($info[2]) && $info[2] == 0) {
                $array = [
                    'ok' => false,
                    'data' => $info[0]
                ];
                return response()->json($array);
            } else {
                /*$time = strtotime($info[1]);
                $newformat = date('Y-m-d', $time);
                $nameLote = $data['incidencia'][0]['lote'];
                $idLote = $this::insertalote($nameLote, $newformat, 'Enviado', $info[2],$info[3]);
                foreach ($data['incidencia'] as $t) {
                    $id_tagg = $t['id'];
                    $this::UpdateIncidenciaLote($idLote, $id_tagg);
                }*/
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

    public function editar(Request $request){
        $this->authorize('access',[User::class, 'editar_inci_env']);
        DB::beginTransaction();
        try{
            $incidencia = Incidencias::find($request->id);
            switch ($request->tratamiento){
                case 'MONTO':
                    $incidencia->monto = $request->monto;
                    break;
                case 'LAPSO':
                    $incidencia->fecha_inicio = $request->fecha;
                    $incidencia->dias         = $request->dias;
                    break;
                case 'DIAS':
                    $incidencia->dias = $request->dias;
                    break;
            }
            if (isset($request->motivo))
                $incidencia->motivo = $request->motivo;
            $incidencia->save();
            DB::commit();
            return response()->json([
                'ok' => true,
                'data' => $incidencia
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return response()->json([
                'ok' => false,
                'data' => []
            ]);
        }
    }

}
