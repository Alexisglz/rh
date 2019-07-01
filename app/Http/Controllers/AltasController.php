<?php

namespace App\Http\Controllers;

use App\CatalogoPlanesLineas;
use App\CatalogoWbs;
use App\Coordinadores;
use App\CostosIncore;
use App\Estados;
use App\Events\AltaEvents;
use App\GlobalModel;
use App\Helpers\Upload;
use App\Mail\AuthDireccion;
use App\Mail\AuthRH;
use App\Mail\SolicitudAlta;
use App\Models\Area;
use App\Models\CatalogoCoordinadores;
use App\Models\Puesto;
use App\Models\VistaSolAltas;
use App\Solicitudes;
use App\SolicitudesAltasAuth;
use App\User;
use DB;
use Illuminate\Auth\Reminders\RemindableInterface;
use Illuminate\Auth\UserInterface;
use Illuminate\Http\Request;
use Mail;
use Redirect;
use Storage;
use Yajra\Datatables\Datatables;

class AltasController extends Controller
{

    protected $rules = [
        'grupo' => ['required']
    ];

    public function __construct()
    {
        $this->date = date('Y-m-d H:i:s');
    }

    public function index(Request $request)
    {
        //dd(auth()->user());
        $this->authorize('access',[User::class, 'listado_solicitudes']);
        $clientes       = CatalogoWbs::Clientes();
        $estados        = Estados::getEstados();
        $coordinadores  = Coordinadores::getCoordinadores();
        $planes         = CatalogoPlanesLineas::getPlanes();
        $costos         = CostosIncore::getCostos();
        $puestos        = [
            '0' => 'SELECCIONE',
            '1' => 'Obrero',
            '2' => 'Secretaria',
            '3' => 'Puesto 3'
        ];
        $id = isset($request->id) ? $request->id : 0;

        return view('altas.index', [
            'clientes'      => $clientes,
            'estados'       => $estados,
            'coordinadores' => $coordinadores,
            'planes'        => $planes,
            'costos'        => $costos,
            'puestos'       => $puestos,
            'id'            => $id
        ]);
    }

    public function create()
    {
        $this->authorize('access',[User::class, 'crear_solicitudes']);
        $user           = auth()->user();
        $estados        = Estados::getEstados();
        $clientes       = CatalogoWbs::from('incore.catalogo_wbs AS wbs')
                            ->select('pc.id','nombre')
                            ->distinct()
                            ->join('incore.proyectos_clientes AS pc', 'wbs.cliente','=','pc.id')
                            ->where('pc.status','!=',0)
                            ->where('wbs.estatus','!=',0);
        if ($user->listarTodo == null) {
            $pd = [];
            foreach ($user->getCoordPD as $item){
                $pd[] = $item->cliente;
            }
            $clientes->whereIn('wbs.cliente',$pd);
        }
        $clientes       = $clientes->pluck('nombre','id');
        $coordinadores  = Coordinadores::getCoordinadores();
        $planes         = CatalogoPlanesLineas::getPlanes();
        $costos         = CostosIncore::getCostos();

        $ipuestos       = Puesto::where('activo','!=', 0)->get();
        $puestos        = [];
        foreach ($ipuestos as $item) {
            $puestos[$item->id] = $item->nombre_puesto;
        }
        $iareas = Area::where('estatus', 'ACTIVO')->get();
        $areas  = [];
        foreach ($iareas as $item) {
            $areas[$item->area] = $item->area;
        }

        return view('altas.create', [
            'clientes'      => $clientes,
            'estados'       => $estados,
            'coordinadores' => $coordinadores,
            'planes'        => $planes,
            'costos'        => $costos,
            'puestos'       => $puestos,
            'areas'         => $areas
        ]);

    }

    public function darBaja(Request $request)
    {
        $solicitud      = new Solicitudes;
        $solicitud_temp = $solicitud::find($request->id);
        $solicitud_temp->delete();
        $data           = array(
            'success' => 'success'
        );
        return json_encode($data, JSON_FORCE_OBJECT);
    }

    public function getSolicitud(Request $request)
    {
        $solicitud      = Solicitudes::find($request->id);
        return response()->json([
            'ok' => true,
            'data' => $solicitud
        ]);
    }

    public function getIndIncore(){
        $ind = DB::select(DB::raw("
        SELECT LPAD(MAX(
		CASE WHEN incore.isnumeric ( empleado_alcatel_id ) 
		    THEN
		    CAST( empleado_alcatel_id AS DECIMAL ) ELSE CAST( SUBSTR( empleado_alcatel_id, 4 ) AS DECIMAL ) 
		END ) + 1,4,0 ) AS nuevo_ind 
        FROM
	    ( SELECT empleado_alcatel_id FROM incore.empleados WHERE empleado_alcatel_id < '2000' UNION SELECT ind FROM solicitud_alta ) AS inds
        "));
        if (!empty($ind) && !empty($ind[0]))
            return $ind[0]->nuevo_ind != null ? intval($ind[0]->nuevo_ind):0;
        else
            return 0;
    }

    public function getIndRH(){
        $ind = DB::select(DB::raw("
        SELECT LPAD(MAX(
		CASE WHEN incore.isnumeric ( empleado_alcatel_id ) 
		    THEN
		    CAST( empleado_alcatel_id AS DECIMAL ) ELSE CAST( SUBSTR( empleado_alcatel_id, 4 ) AS DECIMAL ) 
		END ) + 1,4,0 ) AS nuevo_ind 
        FROM
	    ( SELECT empleado_alcatel_id FROM incore.empleados WHERE empleado_alcatel_id < '2000' UNION SELECT ind FROM incore.solicitudes ) AS inds
        "));
        if (!empty($ind) && !empty($ind[0]))
            return $ind[0]->nuevo_ind != null ? intval($ind[0]->nuevo_ind):0;
        else
            return 0;
    }

    public function store(Request $request)
    {
        $this->authorize('access',[User::class, 'crear_solicitudes']);
        try{
            DB::beginTransaction();
            $sol                = new Solicitudes;
            //CAMPOS GENERALES
            $sol->cliente       = $request->cliente;
            $sol->servicio      = $request->servicio;
            $sol->region        = $request->region;
            $sol->tecnologia    = $request->tecnologia;
            $sol->grupo         = $request->grupo;
            $sol->nombre        = $request->nombre;
            $sol->apaterno      = $request->apaterno;
            $sol->amaterno      = $request->amaterno;
            $sol->fecha_inicio  = $request->fecha_inicio;
            $sol->fecha_alta    = $this->date;
            $sol->puesto        = $request->puesto;
            $sol->area          = $request->area;
            $sol->esquema       = $request->esquema;
            $sol->riesgo        = $request->riesgo;
            $id_usuario         = auth()->user()->id_usuario;
            $sol->solicitante   = $id_usuario;
            if (isset($request->botas)) {
                $sol->botas = 1;
            } else {
                $sol->botas = 0;
            }
            $sol->talla_botas = 0;
            if (isset($request->playera)) {
                $sol->playera = 1;
            } else {
                $sol->playera = 0;
            }
            $sol->talla_playera    = 0;
            $sol->actividad        = $request->actividad;
            $sol->coordinador_id   = $request->coordinador_id;
            $sol->lugar_trabajo    = $request->lugar_trabajo;
            $sol->cotizacion_url   = null;
            $sol->caso_negocio_url = null;
            $sol->vobo_url         = null;
            $sol->curriculum_url   = null;
            if (isset($request->correo)) {
                $sol->tipo_correo = $request->tipo_correo;
            } else {
                $sol->tipo_correo = null;
            }
            if ($request->sueldo_imss == "") {
                $sol->sueldo_imss = 0;
            } else {
                $sol->sueldo_imss = $request->sueldo_imss;
            }
            if ($request->sueldo_variable == "") {
                $sol->sueldo_variable = 0;
            } else {
                $sol->sueldo_variable = $request->sueldo_variable;
            }
            $sol->motivo    = $request->motivo;
            $sol->direccion = $request->direccion;


            if ($request->servicio == "RREC" ||  $request->servicio == "POLZ" ||  $request->servicio == "TKBS" ||  $request->servicio == "SERV") {
                $ind                = $this->getIndIncore() > $this->getIndRH() ? $this->getIndIncore():$this->getIndRH();
                $sol->tipo_proyecto = $request->esquemas; //Esquema: normal, task, etc...
                $sol->ind           = $ind;
                $sol->codigo_sueldo = $request->codigo_sueldo != ""? $request->codigo_sueldo:0;
                $sol->sueldo_venta  = $request->sueldo_venta;
                switch ($request->esquemas) {
                    case '2':
                    case '6':

                        if (isset($request->celular)) {
                            $sol->celular        = 1;
                            $sol->codigo_celular = 0;
                        } else {
                            $sol->celular        = 0;
                            $sol->codigo_celular = 0;
                        }
                        if (isset($request->computadora)) {
                            $sol->computadora        = 1;
                            $sol->codigo_computadora = 0;
                            $sol->desc_computadora   = $request->desc_computadora;
                        } else {
                            $sol->computadora        = 0;
                            $sol->codigo_computadora = 0;
                        }
                        if (isset($request->auto)) {
                            $sol->auto        = 1;
                            $sol->codigo_auto = 0;
                        } else {
                            $sol->auto        = 0;
                            $sol->codigo_auto = 0;
                        }
                        if (isset($request->bam)) {
                            $sol->bam        = 1;
                            $sol->codigo_bam = 0;
                        } else {
                            $sol->bam        = 0;
                            $sol->codigo_bam = 0;
                        }
                        if (isset($request->software)) {
                            $sol->software        = 1;
                            $sol->codigo_software = 0;
                            $sol->desc_software   = $request->desc_software;
                        } else {
                            $sol->software        = 0;
                            $sol->codigo_software = 0;
                        }
                        $sol->plan_linea     = $request->plan_celular_select;
                        $sol->plan_linea_bam = $request->plan_bam_select;
                        break;
                    case '3':
                    case '4':
                    case '7':

                        if (isset($request->celular)) {
                            $sol->celular        = 1;
                            $sol->codigo_celular = $request->codigo_celular;
                        } else {
                            $sol->celular        = 0;
                            $sol->codigo_celular = 0;
                        }
                        if (isset($request->computadora)) {
                            $sol->computadora        = 1;
                            $sol->codigo_computadora = $request->codigo_computadora;
                            $sol->desc_computadora   = $request->desc_computadora;
                        } else {
                            $sol->computadora        = 0;
                            $sol->codigo_computadora = 0;
                        }
                        if (isset($request->auto)) {
                            $sol->auto        = 1;
                            $sol->codigo_auto = $request->codigo_auto;
                        } else {
                            $sol->auto        = 0;
                            $sol->codigo_auto = 0;
                        }
                        if (isset($request->bam)) {
                            $sol->bam        = 1;
                            $sol->codigo_bam = $request->codigo_bam;
                        } else {
                            $sol->bam        = 0;
                            $sol->codigo_bam = 0;
                        }
                        if (isset($request->software)) {
                            $sol->software        = 1;
                            $sol->codigo_software = $request->codigo_software;
                            $sol->desc_software   = $request->desc_software;
                        } else {
                            $sol->software        = 0;
                            $sol->codigo_software = 0;
                        }
                        $sol->plan_linea     = $request->plan_celular_select;
                        $sol->plan_linea_bam = $request->plan_bam_select;

                        break;
                }
                $sol->venta  = $request->venta_calculada;
                $sol->costo  = $request->costo_estimado;
                $sol->margen = $request->margen;


            } else {
                $sol->ind           = 0;
                $sol->codigo_sueldo = 0;
                $sol->sueldo_venta  = 0;

                if (isset($request->celular)) {
                    $sol->celular        = 1;
                    $sol->codigo_celular = 0;
                } else {
                    $sol->celular        = 0;
                    $sol->codigo_celular = 0;
                }
                if (isset($request->computadora)) {
                    $sol->computadora        = 1;
                    $sol->codigo_computadora = 0;
                    $sol->desc_computadora   = $request->desc_computadora;
                } else {
                    $sol->computadora        = 0;
                    $sol->codigo_computadora = 0;
                }
                if (isset($request->auto)) {
                    $sol->auto        = 1;
                    $sol->codigo_auto = 0;
                } else {
                    $sol->auto        = 0;
                    $sol->codigo_auto = 0;
                }
                if (isset($request->bam)) {
                    $sol->bam        = 1;
                    $sol->codigo_bam = 0;
                } else {
                    $sol->bam        = 0;
                    $sol->codigo_bam = 0;
                }
                if (isset($request->software)) {
                    $sol->software        = 1;
                    $sol->codigo_software = 0;
                    $sol->desc_software   = $request->desc_software;
                } else {
                    $sol->software        = 0;
                    $sol->codigo_software = 0;
                }
                $sol->plan_linea     = $request->plan_celular_select;
                $sol->plan_linea_bam = $request->plan_bam_select;

                $sol->venta         = 0;
                $sol->costo         = 0;
                $sol->tipo_proyecto = 1; //Esquema: normal, task, etc...
            }

            $sol->save();
            //GUARDADO DE DOCUMENTOS
            $lastid   = $sol->id;
            $sol_file = $sol::find($lastid);
            $carpeta  = "sol_" . $lastid;
            if ($request->file('vobo') != null || $request->file('cv') != null) {
                Storage::makeDirectory('public/solicitudes/' . $carpeta, 0775, true);
            }
            if ($request->servicio == "RREC" ||  $request->servicio == "POLZ" ||  $request->servicio == "TKBS" ||  $request->servicio == "SERV") {
                if ($request->file('caso_negocio') != null) {
                    $nombre = "caso_negocio_" . $carpeta;
                    $sol_file->caso_negocio_url = Upload::uploadFile('solicitudes/'.$carpeta,'caso_negocio', $sol_file, $nombre);
                }
                if ($request->file('cotizacion') != null) {
                    $nombre = "cotizacion_" . $carpeta;
                    $sol_file->cotizacion_url = Upload::uploadFile('solicitudes/'.$carpeta,'cotizacion', $sol_file, $nombre);
                }
            }
            if ($request->file('vobo') != null) {
                $nombre = "vobo_" . $carpeta;
                $sol_file->vobo_url = Upload::uploadFile('solicitudes/'.$carpeta,'vobo', $sol_file, $nombre);
            }
            if ($request->file('cv') != null) {
                $nombre = "cv_" . $carpeta;
                $sol_file->curriculum_url = Upload::uploadFile('solicitudes/'.$carpeta,'cv',$sol_file, $nombre);
            }
            $sol_file->save();

            $sol_altas_auth               = new SolicitudesAltasAuth;
            $sol_altas_auth->id_solicitud = $sol->id;
            $sol_altas_auth->save();

            /* Evento para enviar correos */
            event(new AltaEvents($sol, 'notificar_dir'));

            $mensaje   = 'Registro de solicitud';
            $Tipo_bita = 'solicitud_alta';
            $opcional  = 'alta';
            GlobalModel::SetBitacoras("$Tipo_bita", $sol->id, auth()->user()->id_usuario, 0, "$mensaje", "$opcional");

            DB::commit();
            return redirect()->route('altas.index');
        }catch (\Exception $e){
            DB::rollBack();
            dd($e);
            return $e;
        }
    }

    public function AutorizarSolicitud(Request $request)
    {
        $date     = date('Y-m-d H:i:s');
        try {
            DB::begintransaction();
            $id_solicitud   = $request->id_solicitud;
            $id_checkauth   = $request->id_checkauth;
            $valorCheck     = $request->valorCheck;
            $sol            = Solicitudes::where('id', '=', $id_solicitud)->first();
            $auth           = SolicitudesAltasAuth::where('id_solicitud', '=', $id_solicitud)->first();
            switch ($id_checkauth) {
                case 'computadora':
                    $auth->computadora = $valorCheck;
                    $auth->obs_compu   = $request->observaciones_computadora;
                    $auth->email_nae   = $request->correo_nae;
                    break;
                case 'coche':
                    $auth->coche    = $valorCheck;
                    $auth->obs_auto = $request->observaciones_varios;
                    break;
                case 'celular':
                    $auth->celular     = $valorCheck;
                    $auth->obs_celular = $request->observaciones_varios;
                    break;
                case 'herramientas':
                    $auth->herramientas_almacen = $valorCheck;
                    $auth->obs_herra            = $request->observaciones_almacenamiento;
                    break;
                case 'firmado':
                    $auth->contrato_firmado = 'OK';
                    break;
                case 'x':
                    $auth->listo_cita       = 'cita';
                    $auth->auth_entregables = $date;
                    $auth->auth_direccion   = $date;
                    $auth->id_dir_user      = auth()->user()->id_usuario;
                    break;
            }

            // Guardar en bitacora
            $mensaje   = 'Autorizar Solicitud';
            $Tipo_bita = 'solicitud_alta';
            $opcional  = 'Autorizar solicitud';
            if (isset($id_checkauth) && $id_checkauth != 'x' && $id_checkauth != 'X') {
                $opcional = 'Autorizar ' . $id_checkauth;
            } else {
            }
            GlobalModel::SetBitacoras("$Tipo_bita", $id_solicitud, auth()->user()->id_usuario, 0, "$mensaje", "$opcional");
            $auth->save();
            $response = [
                "ok"   => true,
                "data" => $auth
            ];
            DB::commit();
            switch ($id_checkauth) {
                case 'computadora':
                    event(new AltaEvents($sol,'listo_herra','computo'));
                    break;
                case 'coche':
                    event(new AltaEvents($sol,'listo_herra','auto'));
                    break;
                case 'celular':
                    event(new AltaEvents($sol,'listo_herra','celular'));
                    break;
                case 'herramientas':
                    event(new AltaEvents($sol,'listo_herra','almacen'));
                    break;
                case 'x':
                    event(new AltaEvents($sol, 'notificar_auth_rh'));
                    break;
            }
            return $response;
        } catch (\Exception $e) {
            DB::rollback();
            $response = [
                "ok"   => false,
                "data" => $e
            ];
            return $response;
        }
    }

    public function getBitacoraAlta($id)
    {
        $tal          = explode("-", $id);
        $idregistro   = $tal[0];
        $tiporegistro = $tal[1];
        $bitacoras    = DB::select(DB::raw("call rh.sp_bitacoras_sistema($idregistro,$tiporegistro)"));
        return DataTables::of($bitacoras)
            ->whitelist(['CLAVE', 'TIPO', 'REGISTRO', 'USUARIO', 'EMPLEADO', 'DETALLES', 'FECHA', 'HORA', 'ESTADO'])
            ->make(true);
    }

    public function edit(Request $request)
    {
        $solicitud      = new Solicitudes;
        $solicitud_temp = $solicitud::find($request->id);
    }

    public function update(Request $request)
    {
        $this->authorize('access',[User::class, 'editar_solicitudes']);
        $solicitud  = new Solicitudes;
        $sol        = $solicitud::find($request->id_solicitud);
        //CAMPOS GENERALES
        $sol->nombre        = $request->nombre;
        $sol->apaterno      = $request->apaterno;
        $sol->amaterno      = $request->amaterno;
        $sol->fecha_inicio  = $request->fecha_inicio;
        $sol->puesto        = $request->puesto;
        $sol->area          = $request->area;
        $sol->esquema       = $request->esquema;
        $sol->riesgo        = $request->riesgo;
        $id_solicitante     = $request->id_user;

        if (isset($request->botas)) {
            $sol->botas = 1;
        } else {
            $sol->botas = 0;
        }
        $sol->talla_botas = 0;
        if (isset($request->playera)) {
            $sol->playera = 1;
        } else {
            $sol->playera = 0;
        }
        $sol->talla_playera    = 0;
        $sol->actividad        = $request->actividad;
        $sol->coordinador_id   = $request->coordinador_id;
        $sol->pm               = $request->pm;
        $sol->lugar_trabajo    = $request->lugar_trabajo;
        $sol->cotizacion_url   = null;
        $sol->caso_negocio_url = null;
        $sol->vobo_url         = null;
        $sol->curriculum_url   = null;
        if (isset($request->correo)) {
            $sol->tipo_correo = $request->tipo_correo;
        } else {
            $sol->tipo_correo = null;
        }
        if ($request->sueldo_imss == "") {
            $sol->sueldo_imss = 0;
        } else {
            $sol->sueldo_imss = $request->sueldo_imss;
        }
        if ($request->sueldo_variable == "") {
            $sol->sueldo_variable = 0;
        } else {
            $sol->sueldo_variable = $request->sueldo_variable;
        }
        $sol->motivo        = $request->motivo;
        $sol->direccion     = $request->direccion;
        $sol->tipo_proyecto = $request->esquemas; //Esquema: normal, task, etc...
        $sol->sueldo_venta  = $request->sueldo_venta;

        if ($request->cliente == "NOK" && $request->servicio == "RREC") {

            $sol->tipo_proyecto = $request->esquemas; //Esquema: normal, task, etc...
            $sol->ind           = 0;
            $sol->codigo_sueldo = 0;

            switch ($request->esquemas) {
                case '2':
                case '6':

                    if (isset($request->celular)) {
                        $sol->celular        = 1;
                        $sol->codigo_celular = 0;
                    } else {
                        $sol->celular        = 0;
                        $sol->codigo_celular = 0;
                    }
                    if (isset($request->computadora)) {
                        $sol->computadora        = 1;
                        $sol->codigo_computadora = 0;
                        $sol->desc_computadora   = $request->desc_computadora;
                    } else {
                        $sol->computadora        = 0;
                        $sol->codigo_computadora = 0;
                    }
                    if (isset($request->auto)) {
                        $sol->auto        = 1;
                        $sol->codigo_auto = 0;
                    } else {
                        $sol->auto        = 0;
                        $sol->codigo_auto = 0;
                    }
                    if (isset($request->bam)) {
                        $sol->bam        = 1;
                        $sol->codigo_bam = 0;
                    } else {
                        $sol->bam        = 0;
                        $sol->codigo_bam = 0;
                    }
                    if (isset($request->software)) {
                        $sol->software        = 1;
                        $sol->codigo_software = 0;
                        $sol->desc_software   = $request->desc_software;
                    } else {
                        $sol->software        = 0;
                        $sol->codigo_software = 0;
                    }
                    $sol->plan_linea     = $request->plan_celular_select;
                    $sol->plan_linea_bam = $request->plan_bam_select;

                    break;
                case '3':
                case '4':
                case '7':

                    if (isset($request->celular)) {
                        $sol->celular        = 1;
                        $sol->codigo_celular = $request->codigo_celular;
                    } else {
                        $sol->celular        = 0;
                        $sol->codigo_celular = 0;
                    }
                    if (isset($request->computadora)) {
                        $sol->computadora        = 1;
                        $sol->codigo_computadora = $request->codigo_computadora;
                        $sol->desc_computadora   = $request->desc_computadora;
                    } else {
                        $sol->computadora        = 0;
                        $sol->codigo_computadora = 0;
                    }
                    if (isset($request->auto)) {
                        $sol->auto        = 1;
                        $sol->codigo_auto = $request->codigo_auto;
                    } else {
                        $sol->auto        = 0;
                        $sol->codigo_auto = 0;
                    }
                    if (isset($request->bam)) {
                        $sol->bam        = 1;
                        $sol->codigo_bam = $request->codigo_bam;
                    } else {
                        $sol->bam        = 0;
                        $sol->codigo_bam = 0;
                    }
                    if (isset($request->software)) {
                        $sol->software        = 1;
                        $sol->codigo_software = $request->codigo_software;
                        $sol->desc_software   = $request->desc_software;
                    } else {
                        $sol->software        = 0;
                        $sol->codigo_software = 0;
                    }
                    $sol->plan_linea     = $request->plan_celular_select;
                    $sol->plan_linea_bam = $request->plan_bam_select;

                    break;
            }
            $sol->venta = $request->venta_calculada;
            $sol->costo = $request->costo_estimado;
        }
        else {
            $sol->ind           = 0;
            $sol->codigo_sueldo = 0;
            $sol->sueldo_venta  = 0;

            if (isset($request->celular)) {
                $sol->celular        = 1;
                $sol->codigo_celular = 0;
            } else {
                $sol->celular        = 0;
                $sol->codigo_celular = 0;
            }
            if (isset($request->computadora)) {
                $sol->computadora        = 1;
                $sol->codigo_computadora = 0;
                $sol->desc_computadora   = $request->desc_computadora;
            } else {
                $sol->computadora        = 0;
                $sol->codigo_computadora = 0;
            }
            if (isset($request->auto)) {
                $sol->auto        = 1;
                $sol->codigo_auto = 0;
            } else {
                $sol->auto        = 0;
                $sol->codigo_auto = 0;
            }
            if (isset($request->bam)) {
                $sol->bam        = 1;
                $sol->codigo_bam = 0;
            } else {
                $sol->bam        = 0;
                $sol->codigo_bam = 0;
            }
            if (isset($request->software)) {
                $sol->software        = 1;
                $sol->codigo_software = 0;
                $sol->desc_software   = $request->desc_software;
            } else {
                $sol->software        = 0;
                $sol->codigo_software = 0;
            }
            $sol->plan_linea     = $request->plan_celular_select;
            $sol->plan_linea_bam = $request->plan_bam_select;
            $sol->venta          = 0;
            $sol->costo          = 0;
            $sol->tipo_proyecto  = 1; //Esquema: normal, task, etc...
        }

        $sol->save();
        $lastid   = $sol->id;
        $sol_file = $sol::find($lastid);
        $carpeta  = "sol_" . $lastid;
        if ($request->file('vobo') != null || $request->file('cv') != null) {
            Storage::makeDirectory('solicitudes/' . $carpeta, 0775, true);
        }
        if ($request->servicio == "RREC") {
            if ($request->file('caso_negocio') != null) {
                $ext = $request->file('caso_negocio')->getClientOriginalExtension();
                $sol_file->caso_negocio_url = $request->file('caso_negocio')->storeas('solicitudes/' . $carpeta, "caso_negocio_" . $carpeta . "." . $ext);
            }
            if ($request->file('cotizacion') != null) {
                $ext = $request->file('cotizacion')->getClientOriginalExtension();
                $sol_file->cotizacion_url = $request->file('cotizacion')->storeas('solicitudes/' . $carpeta, "cotizacion_" . $carpeta . "." . $ext);
            }
        }
        if ($request->file('vobo') != null) {
            $ext = $request->file('vobo')->getClientOriginalExtension();
            $sol_file->vobo_url = $request->file('vobo')->storeas('solicitudes/' . $carpeta, "vobo_" . $carpeta . "." . $ext);
        }
        if ($request->file('cv') != null) {
            $ext = $request->file('cv')->getClientOriginalExtension();
            $sol_file->curriculum_url = $request->file('cv')->storeas('solicitudes/' . $carpeta, "cv_" . $carpeta . "." . $ext);
        }
        $sol_file->save();

        $mensaje   = 'Editar Solicitud';
        $Tipo_bita = 'solicitud_alta';
        $opcional  = 'EDITAR';

        GlobalModel::SetBitacoras("$Tipo_bita", $sol->id, auth()->user()->id_usuario, 0, "$mensaje", "$opcional");
        return Redirect::to('altas');

    }

    public function updateSolicitud(Request $request)
    {
        $this->authorize('access',[User::class, 'editar_solicitudes']);
        $solicitud      = new Solicitudes;
        $solicitud_temp = $solicitud::find($request->id);
        $clientes       = CatalogoWbs::Clientes();
        $estados        = Estados::getEstados();
        $coordinadores  = Coordinadores::getCoordinadores();
        $planes         = CatalogoPlanesLineas::getPlanes();
        $costos         = CostosIncore::getCostos();
        $ipuestos       = DB::table('incore.catalogo_puesto')->select()->get();
        $puestos        = [];
        foreach ($ipuestos as $item) {
            if ($item->activo != 0)
                $puestos[$item->nombre_puesto] = $item->nombre_puesto;
        }

        $iareas = DB::table('incore.catalogo_areas')
            ->select()
            ->get();
        $areas = [];
        foreach ($iareas as $item) {
            if ($item->estatus == 'ACTIVO')
                $areas[$item->area] = $item->area;
        }


        $esquemas = [
            '0' => 'SELECCIONE',
            '1' => 'NORMAL',
            '2' => 'TASK BASED',
            '3' => 'RENTA FIJA',
            '4' => 'ETL',
            '6' => 'PILIZA',
            '7' => 'RENTA FIJA'
        ];

        return view('altas.update', [
            'clientes'       => $clientes,
            'estados'        => $estados,
            'coordinadores'  => $coordinadores,
            'planes'         => $planes,
            'costos'         => $costos,
            'puestos'        => $puestos,
            'areas'          => $areas,
            'solicitud_temp' => $solicitud_temp
        ]);

    }

    public function AgendarCitaFirma(Request $request)
    {
        $this->authorize('access',[User::class, 'agendar_cita']);
        try{
            DB::begintransaction();
            $id_solicitud   = $request->id_solicitud;
            $id_solicitante = $request->id_solicitante;
            $sol            = new Solicitudes;
            $sol_temp       = $sol::find($id_solicitud);

            // Guardar en bitacora
            $mensaje    = 'Agendar cita de firma';
            $Tipo_bita  = 'solicitud_alta';
            $opcional   = 'CITA FIRMA';
            GlobalModel::SetBitacoras("$Tipo_bita", $id_solicitud, auth()->user()->id_usuario, 0, "$mensaje", "$opcional");

            $sol_temp->fecha_cita    = $request->fecha_cita;
            $sol_temp->hora_cita     = $request->hora_cita;
            $sol_temp->detalles_cita = $request->detalles_cita;
            $sol_temp->correo_cita   = $request->correo_cita;
            if ($request->num_botas)
                $sol_temp->talla_botas = $request->num_botas;
            if ($request->num_playera)
                $sol_temp->talla_playera = $request->num_playera;
            $sol_temp->correo_cita   = $request->correo_cita;
            $sol_temp->status_cita   = "PENDIENTE";
            $sol_temp->save();

            $auth               = SolicitudesAltasAuth::where('id_solicitud','=',$sol_temp->id)->first();
            $auth->auth_rh      = date('Y-m-d H:i:s');
            $auth->id_user_rh   = auth()->user()->id_usuario;
            $auth->listo_cita   = 'ok';
            $auth->save();

            event(new AltaEvents($sol_temp, 'notificar_alta_herramientas'));

            DB::commit();
            return response()->json([
                'ok' => true,
                'data' => $sol_temp
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

    public function getCoordinadores(Request $request){
        $coords = CatalogoCoordinadores::query();
        $coords_nokia = DB::table('incore.catalogo_coordinadores_nokia_indeplo')
            ->select('coordinador_nokia_id')->get();
        $array = [];
        foreach ($coords_nokia as $item){
            $array[] = $item->coordinador_nokia_id;
        }
        if ($request->cliente == 'NOK'){
            $coords->whereIn('id',$array);
        }
        $coords->where('id','!=',269);/* Harcodeo para quitar a los coordinadores repetidos en este caso enrique macedo */
        $coords->where('id','!=',273);/* Otra vez enrique macedo validado contra la tabala movimientos recursos */
        $coords->where('estatus','=','1')->orderBy('nombre', 'asc');
        $coords = $coords->get();
        return response()->json([
            'ok' => true,
            'data' => $coords
        ]);
    }

    public function aprobar(Request $request){
        if(!isset($request->id))
            return redirect()->route('altas.index');
        $solicitud = VistaSolAltas::find($request->id);
        $puesto  = Puesto::find($solicitud->id_puesto);
        $estado = Estados::find($solicitud->lugar_trabajo);
        return view('altas.aprobar',[
            'solicitud' => $solicitud, 'puesto' => $puesto,
            'estado' => $estado
        ]);
    }

    public function autorizarDireccion(Request $request)
    {
        $date     = date('Y-m-d H:i:s');
        try {
            DB::begintransaction();
            $sol            = Solicitudes::find($request->id);
            $auth           = SolicitudesAltasAuth::where('id_solicitud', '=', $sol->id)->first();

            $mensaje   = 'Autorizar Solicitud';
            $Tipo_bita = 'solicitud_alta';
            $opcional  = '';

            if ($request->tipo == 'autorizar'){
                $auth->listo_cita       = 'cita';
                $auth->auth_entregables = $date;
                $auth->auth_direccion   = $date;
                $auth->id_dir_user      = auth()->user()->id_usuario;
                $opcional               = 'Autorizar solicitud por Direccion';
            }
            else{
                $sol->usuario_rechazar = auth()->user()->id_usuario;
                $auth->auth_entregables = $date;
                $auth->auth_direccion   = $date;
                $auth->id_dir_user      = auth()->user()->id_usuario;
                $opcional               = 'Cancelar solicitud por Direccion';
                $sol->save();
            }

            GlobalModel::SetBitacoras("$Tipo_bita", $sol->id, auth()->user()->id_usuario, 0, "$mensaje", "$opcional");
            $auth->save();
            DB::commit();
            event(new AltaEvents($sol, 'notificar_auth_rh'));
            return redirect()->route('altas.index')->with('success','Solicitud Actualizada correctamente');
        } catch (\Exception $e) {
            DB::rollback();
            dd($e);
            return back()->with('Error', 'Ocurrio un error');
        }
    }
}