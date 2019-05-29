<?php

namespace App\Http\Controllers;

use App\CatalogoPlanesLineas;
use App\CatalogoWbs;
use App\Classes\NuevoEmpleado;
use App\Classes\Poliza;
use App\Classes\RentaFijaETL;
use App\Classes\TaskBased;
use App\Coordinadores;
use App\CostosIncore;
use App\Empleados;
use App\empleadosbaja;
use App\Estados;
use App\Events\BajasEvents;
use App\GlobalModel;
use App\Helpers\Upload;
use App\Models\Area;
use App\Models\CatalogoCoordinadores;
use App\Models\CatCoordNokiaInd;
use App\Models\Localidad;
use App\Models\MovimientoRecurso;
use App\Models\Movimientos;
use App\Models\MovimientosCoordinador;
use App\Models\MovimientosProyecto;
use App\Models\MovimientosSueldo;
use App\Models\ProyectosEntCoordRecurso;
use App\Models\Puesto;
use App\notificacion;
use App\SolBajaNomina;
use App\Solicitudes;
use App\SolicitudesAltasAuth;
use App\User;
use DB;
use File;
use Illuminate\Http\Request;
use Storage;
use Yajra\Datatables\Datatables;


class EmpleadosController extends Controller
{

    protected $rules = [
        'grupo' => ['required']
    ];

    public function index()
    {
        $this->authorize('access',[User::class, 'listado_empleados']);
        $clientes       = CatalogoWbs::Clientes();
        $coordinadores  = Coordinadores::getCoordinadores();
        $planes         = CatalogoPlanesLineas::getPlanes();
        $estados        = Estados::getEstados();
        $vistaName      = 'empleados.index';
        $ilocalidades   = Localidad::all();
        $localidades = [];
        foreach ($ilocalidades as $item){
                $localidades[] = $item->localidad_nombre;
        }
        $puestos = Puesto::all();
        $proveedores = DB::table('incore.catalogo_proveedores_recursos')
            ->select()
            ->where('activo', 1)
            ->get();
        $razones = DB::table('incore.catalogo_razonrh')
            ->select()
            ->where('proveedor_id', 1)
            ->get();
        $iareas = Area::where('estatus','ACTIVO')->get();
        $areas = [];
        foreach ($iareas as $item){
            $areas[$item->area] = $item->area;
        }
        return view($vistaName, [
            'clientes'      => $clientes,
            'coordinadores' => $coordinadores,
            'estados'       => $estados,
            'localidades'   => $localidades,
            'puestos'       => $puestos,
            'proveedores'   => $proveedores,
            'areas'         => $areas,
            'razones'       => $razones
        ]);
    }


    public function obtenerEmpleado($criterio)
    {
        $EmpleadoEncontrado = DB::select(DB::raw("call rh.sp_busca_empleado_criteria('$criterio');"));
        return DataTables::of($EmpleadoEncontrado)
            ->make(true);
    }


    public function getEmpleadoBaja(Request $id)
    {
        $sol      = new Empleadosbaja();
        $sol_temp = $sol::find($id->id);
        return $sol_temp;
    }


    public function ReingresarEmpleado(Request $request)
    {
        $empleado                    = new Empleados;
        $id                          = $request->rid;
        $emp                         = $empleado::find($id);
        $emp->empleado_alcatel_id    = $request->ind_val;
        $emp->empleado_nombre        = $request->rnombre;
        $emp->empleado_apaterno      = $request->rapaterno;
        $emp->empleado_amaterno      = $request->ramaterno;
        $emp->calle                  = $request->rcalle;
        $emp->colonia                = $request->rcolonia;
        $emp->municipio              = $request->rmunicipio;
        $emp->cp                     = $request->rcp;
        $emp->estado                 = $request->estado;
        $emp->nss                    = $request->rnss;
        $emp->curp                   = $request->curp;
        $emp->rfc                    = $request->rrfc;
        $emp->mail                   = $request->rmail;
        $emp->telefono2              = $request->rtelefono2;
        $emp->telefono               = $request->telefono;
        $emp->empresa                = $request->empresa;
        $emp->empleado_estatus       = "ACTIVO";
        $emp->empleado_fecha_alta    = $request->fecha_ingreso;
        $emp->segmento               = $request->segmento;
        $emp->empleado_observaciones = $request->robservaciones;
        $emp->fecha_ingreso          = $request->fecha_ingreso;
        $emp->localidad              = $request->localidad;
        $emp->razon_social           = $request->razon_rh;
        $emp->num_monex              = $request->monex;
        $emp->no_cuenta              = $request->rnum_cuenta;
        $emp->esquema_viaticos       = $request->esquema_viaticos;
        $emp->clave_cuenta           = $request->rclabe;
        $emp->banco                  = $request->rbanco;
        $emp->empleado_observaciones = $request->robservaciones;
        $emp->num_interior           = $request->no_interior;
        $emp->colonia                = $request->name_localidad;
        $emp->num_exterior           = $request->rno_exterior;
        $emp->segmento               = $request->segmento;
        $emp->save();

        $idsol                      = $request->rsolicitud;
        $sol                        = new Solicitudes;
        $sol_temp                   = $sol::find($idsol);
        $sol_temp->cliente          = $request->cliente;
        $sol_temp->servicio         = $request->servicio;
        $sol_temp->region           = $request->region;
        $sol_temp->tecnologia       = $request->tecnologia;
        $sol_temp->grupo            = $request->grupo;
        $sol_temp->coordinador_id   = $request->coordinadores;
        $sol_temp->status_cita      = null;
        $sol_temp->sueldo_variable  = $request->sueldo_asimilado;
        $sol_temp->sueldo_imss      = $request->sueldo_imss;
        $sol_temp->puesto           = $request->puesto;
        $sol_temp->grupo            = $request->grupo;
        $sol_temp->grupo            = $request->grupo;
        $sol_temp->grupo            = $request->grupo;
        $sol_temp->nombre           = $request->rnombre;
        $sol_temp->apaterno         = $request->rapaterno;
        $sol_temp->amaterno         = $request->ramaterno;
        $sol_temp->save();
        $REST = DB::select(DB::raw("call rh.sp_restaurar_auth('$idsol');"));
        return $REST;
    }

    public function create()
    {
        $clientes       = CatalogoWbs::Clientes();
        $estados        = Estados::getEstados();
        $coordinadores  = Coordinadores::getCoordinadores();
        $planes         = CatalogoPlanesLineas::getPlanes();
        $costos         = CostosIncore::getCostos();
        return view('altas.create', [
            'clientes'      => $clientes,
            'estados'       => $estados,
            'coordinadores' => $coordinadores,
            'planes'        => $planes,
            'costos'        => $costos
        ]);
    }

    public function getEmpleado(Request $request)
    {
        $id         = $request->input('empleado_id');
        $sol        = new Empleados;
        $sol_temp   = $sol::find($id);
        $empleado   = DB::table('vista_empleados_activos')->where('id', $id)->first();
        return response()->json([
            "ok" => true,
            "data" => $empleado
        ]);
    }

    public function getEmpleadoData(Request $request)
    {
        $id_empleado   = intval($request->id);
        $empleado      = new Empleados;
        $empleado_temp = $empleado::find($id_empleado);
        return json_encode($empleado_temp, JSON_FORCE_OBJECT);
    }

    public function getCoordinadores(Request $request)
    {
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

    public function getHerramientasEmpleado(Request $request)
    {
        $herramientas = DB::table('solicitud_alta AS sa')
            ->select(DB::raw(
                'sa.auto,sa.celular,sa.plan_linea,sa.computadora,sa.desc_computadora,sa.software,sa.desc_software,
                sa.tipo_correo,sa.bam,sa.botas,sa.playera,sa.herramientas_detalles,cpl1.plan_nombre AS linea_nombre,
                cpl2.plan_nombre AS bam_nombre'))
            ->leftJoin('catalogo_planes_lineas AS cpl1', 'sa.plan_linea','=','cpl1.plan_id')
            ->leftJoin('catalogo_planes_lineas AS cpl2', 'sa.plan_linea_bam','=','cpl1.plan_id')
            ->where('sa.id', '=', $request->id)
            ->first();
        return response()->json([
            'ok' => true,
            'data' => $herramientas
        ]);
    }

    public function updateHerramientasEmpleado(Request $request)
    {
        $id_empleado                     = $request->id_empleado;
        $sol                             = new Solicitudes;
        $sol_temp                        = $sol::find($id_empleado);
        $sol_temp->celular               = $request->celular_check;
        $sol_temp->plan_linea            = $request->celular_plan;
        $sol_temp->computadora           = $request->computadora_check;
        $sol_temp->desc_computadora      = $request->computadora_desc;
        $sol_temp->software              = $request->software_check;
        $sol_temp->desc_software         = $request->software_desc;
        $sol_temp->tipo_correo           = $request->tipo_correo;
        $sol_temp->bam                   = $request->bam_check;
        $sol_temp->plan_linea_bam        = $request->bam_plan;
        $sol_temp->auto                  = $request->auto_check;
        $sol_temp->botas                 = $request->botas_check;
        $sol_temp->playera               = $request->playera_check;
        $sol_temp->herramientas_detalles = $request->herramientas_almacen;
        $sol_temp->save();
        return json_encode($sol_temp, JSON_FORCE_OBJECT);
    }

    public function updateEmpleado(Request $request)
    {
        $this->authorize('access',[User::class, 'editar_empleado']);
        try{
            DB::beginTransaction();
            $emp                              = new Empleados;
            $emp_temp                         = $emp::find($request->eid);
            $nss_exist                        = Empleados::where('nss',$request->enss)
                                                ->where('empleado_id', '!=', $request->eid)
                                                ->first();
            $curp_exist                       = Empleados::where('curp',$request->ecurp)
                                                ->where('empleado_id', '!=', $request->eid)
                                                ->first();
            $rfc_exist                        = Empleados::where('rfc',$request->erfc)
                                                ->where('empleado_id', '!=', $request->eid)
                                                ->first();
            $emp_temp->empleado_num           = $request->eempleado;
            $emp_temp->empleado_alcatel_id    = $request->eind_val == "" ? 0:$request->eind_val;
            $emp_temp->empleado_nombre        = $request->enombre;
            $emp_temp->empleado_apaterno      = $request->eamaterno;
            $emp_temp->empleado_amaterno      = $request->eapaterno;
            $emp_temp->calle                  = $request->ecalle;
            $emp_temp->num_exterior           = $request->eno_exterior;
            $emp_temp->num_interior           = $request->eno_interior;
            $emp_temp->colonia                = $request->ecolonia;
            $emp_temp->municipio              = $request->emunicipio;
            $emp_temp->cp                     = $request->ecp;
            $emp_temp->estado                 = $request->eestado;
            if ($nss_exist == null)
                $emp_temp->nss                    = $request->enss;
            if ($curp_exist == null)
                $emp_temp->curp                   = $request->ecurp;
            if ($rfc_exist == null)
                $emp_temp->rfc                    = $request->erfc;
            $emp_temp->mail                   = $request->email;
            $emp_temp->telefono               = $request->etelefono;
            $emp_temp->telefono2              = $request->etelefono2;
            $emp_temp->empresa                = $request->eempresa;
            $emp_temp->segmento               = $request->esegmento;
            $emp_temp->empleado_observaciones = $request->eobservaciones;
            $emp_temp->save();

            /* Actualizar el movimiento recurso */
            $mov_rec                         = MovimientoRecurso::find($request->mov_rec_id);
            $mov_rec->numero_empleado        = $request->eempleado;
            $mov_rec->localidad              = $request->elocalidad;
            $mov_rec->razon_rh               = $request->erazon_rh;
            $mov_rec->esquema                = $request->eesquema_viaticos;
            $mov_rec->monex                  = $request->emonex;
            $mov_rec->num_cuenta             = $request->enum_cuenta;
            $mov_rec->clabe                  = $request->eclabe;
            $mov_rec->banco                  = $request->ebanco;
            $mov_rec->save();

            /* Actualizar el coordinador del empleado
            $mov_coord                        = MovimientosCoordinador::find($request->mov_coord_id);
            $mov_coord->coordinador_id        = $request->ecoordinadores;
            $mov_coord->save();

            $emp_temp->proveedor              = $request->eproveedor;*/
            DB::commit();
            return response()->json([
                "ok"    => true,
                "data"  => $emp_temp
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return response()->json($e);
        }
    }

    public function store(Request $request)
    {
        $sol               = new Solicitudes;
        $cadena            = "";
        $sol->cliente      = $request->cliente;
        $sol->servicio     = $request->servicio;
        $sol->region       = $request->region;
        $sol->tecnologia   = $request->tecnologia;
        $sol->grupo        = $request->grupo;
        $sol->nombre       = $request->nombre;
        $sol->apaterno     = $request->apaterno;
        $sol->amaterno     = $request->amaterno;
        $sol->fecha_inicio = $request->fecha_inicio;
        $sol->puesto       = $request->puesto;
        $sol->esquema      = $request->esquema;
        $sol->riesgo       = $request->riesgo;
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
        $sol->talla_playera     = 0;
        $sol->actividad         = $request->actividad;
        $sol->coordinador_id    = $request->coordinador_id;
        $sol->pm                = $request->pm;
        $sol->lugar_trabajo     = $request->lugar_trabajo;
        $sol->cotizacion_url    = null;
        $sol->caso_negocio_url  = null;
        $sol->vobo_url          = null;
        $sol->curriculum_url    = null;
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
        $sol->tipo_proyecto = $request->esquemas;
        $sol->sueldo_venta  = $request->sueldo_venta;

        if ($request->cliente == "NOK" && $request->servicio == "RREC") {
            $sol->tipo_proyecto = $request->esquemas; //Esquema: normal, task, etc...
            $sol->ind           = 0;
            $sol->codigo_sueldo = 0;
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
            }
            $sol->venta = $request->venta_calculada;
            $sol->costo = $request->costo_estimado;


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
            $sol->venta          = 0;
            $sol->costo          = 0;
            $sol->tipo_proyecto  = 1; //Esquema: normal, task, etc...
        }

        $sol->save();
        //GUARDADO DE DOCUMENTOS
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

        return view('altas.index');
    }

    public function bajaEmpleado(Request $request)
    {
        //dd($request);
        $this->authorize('access',[User::class, 'baja_empleado']);
        try{
            DB::beginTransaction();
            $empleado_fecha_baja = $request->input('empleado_fecha_baja');
            $fechaEmi            = $request->input('fechaEmi');
            $incidencia          = $request->input('incidencia');
            $obs                 = $request->input('obs');
            $motivo              = $request->input('motivo');
            $conbaja             = $request->input('conbaja');
            $vobo                = $request->input('vobo');
            $id                  = $request->input('id');

            $sol                    = new SolBajaNomina;
            $sol->fecha_baja_sol    = $empleado_fecha_baja;
            $sol->fecha_emision     = $fechaEmi;
            $sol->incidencias       = $incidencia;
            $sol->observaciones     = $obs;
            $sol->motivo            = $motivo;
            $sol->conocimiento_baja = $conbaja==1 ? 'SI':'NO';
            //$sol->vobo_jefe         = $vobo;
            $sol->id_empleado       = $id;
            $sol->solicitante       = $request->input('solicitante');
            $sol->save();
            if ($request->file('vobo') != null){
                $dir = 'solicitudes_bajas/baja_'.$sol->id;
                $nombre = 'baja_vobo_'.$sol->id;
                $sol->vobo_jefe = Upload::uploadFile($dir,'vobo', $sol, $nombre);
                $sol->save();
            }
            DB::commit();
            event(new BajasEvents($sol,'nueva_baja'));
            return response()->json([
                "ok" => true,
                "data" => $sol
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

    public function getPlanes()
    {
        $planes = CatalogoPlanesLineas::getPlanes();
        $data   = json_decode($planes);
        return json_encode($data, JSON_FORCE_OBJECT);
    }

    public function createEmpleado(Request $request)
    {
        $this->authorize('access',[User::class, 'autorizar_empleado']);
        try{
            if ($request->enviar != 0) {
                $empleado = Empleados::find($request->enviar);
                $empleado->empleado_estatus    = "ACTIVO";
                $empleado->empleado_fecha_baja = null;
                $empleado->baja_rh = null;

                $mov_recursos = MovimientosProyecto::where('empleado_id', $empleado->empleado_id)
                    ->where('fecha_fin', $request->fecha_ingreso)
                    ->first();
                if ($mov_recursos)
                return response()->json([
                    'ok'    => true,
                    'data'  => $mov_recursos,
                    'fecha' => true
                ]);
            }
            $empleado = NuevoEmpleado::create($request);
            return response()->json([
                "ok"    => true,
                "data"  => $empleado,
                'fecha' => false
            ]);
        }catch (\Exception $e){
            return $e;
        }
    }

    public function createSinSolicitud(Request $request){
        try{
            DB::beginTransaction();
            /* Validar si es ingreso nuevo o reingreso */
            if ($request->enviar == 0)
                $empleado = new Empleados;
            else{
                $empleado = Empleados::find($request->enviar);
                $empleado->empleado_estatus    = "ACTIVO";
                $empleado->empleado_fecha_baja = null;
            }
            /* Guardar los datos del empleado */
            $empleado->empleado_num           = $request->num_empleado;
            $empleado->empleado_alcatel_id    = $request->ind_alcatel == "" ? 0:$request->ind_alcatel;
            $empleado->empleado_nombre        = $request->name;
            $empleado->empleado_apaterno      = $request->apaterno;
            $empleado->empleado_amaterno      = $request->amaterno;
            $empleado->calle                  = $request->calle;
            $empleado->num_exterior           = $request->num_ext;
            $empleado->num_interior           = $request->num_int;
            $empleado->colonia                = $request->colonia;
            $empleado->municipio              = $request->municipio;
            $empleado->cp                     = $request->cp;
            $empleado->estado                 = $request->estado;
            $empleado->nss                    = $request->nss;
            $empleado->curp                   = $request->curp;
            $empleado->rfc                    = $request->rfc;
            $empleado->mail                   = $request->email;
            $empleado->telefono2              = $request->telefono2;
            $empleado->telefono               = $request->telefono1;
            $empleado->empresa                = $request->empresa;
            $empleado->segmento               = $request->segmento;
            $empleado->empleado_fecha_alta    = date("Y-m-d H:i:s");
            $empleado->empleado_observaciones = $request->observaciones;
            $empleado->id_solicitud           = $request->id_solicitud;
            $empleado->area                   = $request->area;
            $empleado->save();

            /* Crear el nuevo movimiento del recurso */
            $mov_recurso = Movimientos::movimientoRecurso($empleado, $request);
            if ($mov_recurso['ok'] == false){
                DB::rollBack();
                return response()->json([
                    "ok" => false,
                    "data" => "Error al guardar el movimiento del recurso"
                ]);
            }

            /* Validar si es de nokia y es rrec para agregarlo al catalogo esto seguramente cambiara */
            if($request->cliente == "NOK" && $request->servicio == "RREC"){
                $coordinador = Coordinadores::where('id', $request->coordinador)->first();
                if($coordinador->user_log != 0){
                    /* Agregar al catalogo de coordinadores nokia indeplo*/
                    $coord_nok_ind = Movimientos::movimientoCoordNokInd($request);
                    if ($coord_nok_ind == false){
                        DB::rollBack();
                        return response()->json([
                            "ok" => false,
                            "data" => "Error al guardar el coordinador de nokia"
                        ]);
                    }
                }
                else{
                    $coord_nok_ind = CatCoordNokiaInd::where('coordinador_nokia_id', $request->coordinador)->get();
                    if (count($coord_nok_ind) == 0){
                        /* Agregar al catalogo de coordinadores nokia indeplo*/
                        $coord_nok_ind = Movimientos::movimientoCoordNokInd($request);
                        if ($coord_nok_ind == false){
                            DB::rollBack();
                            return response()->json([
                                "ok" => false,
                                "data" => "Error al guardar el coordinador de nokia"
                            ]);
                        }
                    }
                }
            }
            /* Crear el nuevo moviemiento proyecto */
            $mov_proyecto = Movimientos::movimientoProyecto($empleado, $request);
            if ($mov_proyecto == false){
                DB::rollBack();
                return response()->json([
                    "ok" => false,
                    "data" => "Error al guardar el proyecto"
                ]);
            }

            if ($request->coordinador != 0){
                /* Agregar el nuevo coordinador del recurso */
                $mov_coordinador = Movimientos::movimientoCoordinador($empleado, $request);
                if ($mov_coordinador == false){
                    DB::rollBack();
                    return response()->json([
                        "ok" => false,
                        "data" => "Error al guardar el coordinador"
                    ]);
                }
            }

            /* Agregar el nuevo sueldo del recurso */
            $mov_sueldo = Movimientos::movimientoSueldo($empleado, $request);
            if ($mov_sueldo == false){
                DB::rollBack();
                return response()->json([
                    "ok" => false,
                    "data" => "Error al guardar el suledo"
                ]);
            }

            /* Agregar el nuevo puesto del recurso */
            $mov_puesto = Movimientos::movimientoPuesto($empleado, $request);
            if ($mov_puesto == false){
                DB::rollBack();
                return response()->json([
                    "ok" => false,
                    "data" => "Error al guardar el puesto"
                ]);
            }
            DB::commit();
            return response()->json([
                "ok"    => true,
                "data"  => $empleado
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return $e;
        }
    }

    public function exist(Request $request){
        try{
            $empleado = Empleados::where($request->attr, '=', $request->value)->first();
            /* Arreglo de respuesta en caso de que exista el empleado y este activo se envia el array tal como se inicializa */
            $response = [
                "ok"     => true,
                "active" => true,
                "exist"  => true,
                "data"   => $empleado
            ];
            if($empleado != null){
                if ($empleado->empleado_estatus != "ACTIVO"){
                    /* Si existe el empleado pero no esta activo se hace el cambio */
                    $response["active"] = false;
                }
            }
            else{
                /* En caso de que no exista el empleado se vacian los datos */
                $response["active"] = false;
                $response["exist"]  = false;
                $response["data"]   = [];
            }
            return $response;
        }catch (\Exception $e){
            $response = [
                "ok"     => false,
                "active" => false,
                "exist"  => false,
                "data"   => $e
            ];
            return $response;
        }
    }

    public function cambioCoord(Request $request){
        $conn = DB::connection('incore');
        $conn->beginTransaction();
        try{
            $coord = CatalogoCoordinadores::find($request->coord_id);
            if ($coord == null)
                return response()->json([
                    'ok' => true,
                    'data' => "No existe el coordinador"
                ]);

            $mov_viejo            = MovimientosCoordinador::where('empleado_id',$request->id)
                                   ->whereNull('fecha_fin')->first();
            $mov_viejo->fecha_fin = $request->fecha_fin;
            $mov_viejo->save();

            $mov_nuevo                  = new MovimientosCoordinador();
            $mov_nuevo->empleado_id     = $request->id;
            $mov_nuevo->coordinador_id  = $request->coord_id;
            $mov_nuevo->fecha_inicio    = $request->fecha_ini;
            $mov_nuevo->save();
            $conn->commit();
            return response()->json([
                'ok' => true,
                'data' => $coord
            ]);
        }catch (\Exception $e){
            $conn->rollBack();
            return response()->json([
                'ok' => false,
                'data' => "Error"
            ]);
        }
    }

    public function cambioSueldo(Request $request){
        $conn = DB::connection('incore');
        $conn->beginTransaction();
        try{
            $mov_viejo            = MovimientosSueldo::where('empleado_id',$request->id)
                                    ->whereNull('fecha_fin')->first();
            $mov_viejo->fecha_fin = $request->fecha_fin;
            $mov_viejo->save();
            $mov_nuevo                           = new MovimientosSueldo();
            $mov_nuevo->empleado_id              = $request->id;
            $mov_nuevo->sueldo_imss              = $request->sueldo_imss;
            $mov_nuevo->sueldo_asimilado         = $request->sueldo_asimilado;
            $mov_nuevo->sueldo_imss_bruto        = $request->imss_bruto == "" ? null:$request->imss_bruto;
            $mov_nuevo->sueldo_alternativo_bruto = $request->asimilado_bruto == "" ? null:$request->asimilado_bruto;
            $mov_nuevo->fecha_inicio             = $request->fecha_ini;
            $mov_nuevo->save();
            $conn->commit();
            return response()->json([
                'ok' => true,
                'data' => $mov_nuevo
            ]);
        }catch (\Exception $e){
            $conn->rollBack();
            dd($e);
            return response()->json([
                'ok' => false,
                'data' => "Error"
            ]);
        }
    }
}

