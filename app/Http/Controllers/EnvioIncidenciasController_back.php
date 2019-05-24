<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Storage;

use App\CatalogoWbs;
use App\Estados;
use App\Coordinadores;
use App\CatalogoPlanesLineas;
use App\CostosIncore;
use App\Solicitudes;
use App\GlobalModel;


class EnvioIncidenciasController extends Controller
{
    /**
    *
    * RULES
    *
    **/
    protected $rules = [
        'grupo'=>['required']
    ];

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('envio_incidencias.envio_incidencias');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $clientes = CatalogoWbs::Clientes();
        $estados = Estados::getEstados();
        $coordinadores = Coordinadores::getCoordinadores();
        $planes = CatalogoPlanesLineas::getPlanes();
        $costos = CostosIncore::getCostos();
        return view('altas.create',[
            'clientes'=>$clientes,
            'estados'=>$estados,
            'coordinadores'=>$coordinadores,
            'planes'=>$planes,
            'costos'=>$costos
        ]);
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //$this->validate($request,$this->rules);
        //return view('altas.index');
        $sol = new Solicitudes;
        $cadena = "";
        //CAMPOS GENERALES
        $sol->cliente = $request->cliente;
        $sol->servicio = $request->servicio;
        $sol->region = $request->region;
        $sol->tecnologia = $request->tecnologia;
        $sol->grupo = $request->grupo;
        $sol->nombre = $request->nombre;
        $sol->apaterno = $request->apaterno;
        $sol->amaterno = $request->amaterno;
        $sol->fecha_inicio = $request->fecha_inicio;
        $sol->puesto = $request->puesto;
        $sol->esquema = $request->esquema; 
        $sol->riesgo = $request->riesgo;
        if ( isset( $request->botas ) ) {
            $sol->botas = 1;
        } else {
            $sol->botas = 0;
        }
        $sol->talla_botas = 0; 
        if ( isset( $request->playera ) ) {
            $sol->playera = 1;
        } else {
            $sol->playera = 0;
        }
        $sol->talla_playera = 0;
        $sol->actividad = $request->actividad;
        $sol->coordinador_id = $request->coordinador_id;
        $sol->pm = $request->pm;
        $sol->lugar_trabajo = $request->lugar_trabajo;
        $sol->cotizacion_url = null;
        $sol->caso_negocio_url = null;
        $sol->vobo_url = null; 
        $sol->curriculum_url = null;
        if ( isset( $request->correo ) ) {
            $sol->tipo_correo = $request->tipo_correo;
        } else {
            $sol->tipo_correo = null;
        }
        if ( $request->sueldo_imss == "" ) {
            $sol->sueldo_imss = 0;
        } else {
            $sol->sueldo_imss = $request->sueldo_imss;
        }
        if ( $request->sueldo_variable == "" ) {
            $sol->sueldo_variable = 0;
        } else {
            $sol->sueldo_variable = $request->sueldo_variable;
        }
        $sol->motivo = $request->motivo;
        $sol->direccion = $request->direccion;


        if ( $request->cliente == "NOK" && $request->servicio == "RREC" ) {

            $sol->tipo_proyecto = $request->esquemas; //Esquema: normal, task, etc...

            $sol->ind = 0; 
            $sol->codigo_sueldo = 0; 
            $sol->sueldo_venta = $request->sueldo_venta;

            switch ( $request->esquemas ) {
                case '2':
                case '6':
                    
                    if ( isset( $request->celular ) ) {
                        $sol->celular = 1;
                        $sol->codigo_celular = 0;
                    } else {
                        $sol->celular = 0;
                        $sol->codigo_celular = 0;
                    }
                    if ( isset( $request->computadora ) ) {
                        $sol->computadora = 1;
                        $sol->codigo_computadora = 0;
                        $sol->desc_computadora = $request->desc_computadora;
                    } else {
                        $sol->computadora = 0;
                        $sol->codigo_computadora = 0;
                    }
                    if ( isset( $request->auto ) ) {
                        $sol->auto = 1;
                        $sol->codigo_auto = 0;
                    } else {
                        $sol->auto = 0;
                        $sol->codigo_auto = 0;
                    }
                    if ( isset( $request->bam ) ) {
                        $sol->bam = 1;
                        $sol->codigo_bam = 0;
                    } else {
                        $sol->bam = 0;
                        $sol->codigo_bam = 0;
                    }
                    if ( isset( $request->software ) ) {
                        $sol->software = 1;
                        $sol->codigo_software = 0;
                        $sol->desc_software = $request->desc_software;
                    } else {
                        $sol->software = 0;
                        $sol->codigo_software = 0;
                    }
                    $sol->plan_linea = $request->plan_celular_select; 
                    $sol->plan_linea_bam = $request->plan_bam_select;

                    break;
                case '3':
                case '4':
                case '7':
                    
                    if ( isset( $request->celular ) ) {
                        $sol->celular = 1;
                        $sol->codigo_celular = $request->codigo_celular;
                    } else {
                        $sol->celular = 0;
                        $sol->codigo_celular = 0;
                    }
                    if ( isset( $request->computadora ) ) {
                        $sol->computadora = 1;
                        $sol->codigo_computadora = 0;
                        $sol->desc_computadora = $request->desc_computadora;
                    } else {
                        $sol->computadora = 0;
                        $sol->codigo_computadora = 0;
                    }
                    if ( isset( $request->auto ) ) {
                        $sol->auto = 1;
                        $sol->codigo_auto = 0;
                    } else {
                        $sol->auto = 0;
                        $sol->codigo_auto = 0;
                    }
                    if ( isset( $request->bam ) ) {
                        $sol->bam = 1;
                        $sol->codigo_bam = 0;
                    } else {
                        $sol->bam = 0;
                        $sol->codigo_bam = 0;
                    }
                    if ( isset( $request->software ) ) {
                        $sol->software = 1;
                        $sol->codigo_software = 0;
                        $sol->desc_software = $request->desc_software;
                    } else {
                        $sol->software = 0;
                        $sol->codigo_software = 0;
                    }
                    $sol->plan_linea = $request->plan_celular_select; 
                    $sol->plan_linea_bam = $request->plan_bam_select;

                    break;
            }  

            $sol->venta = $request->venta_calculada;
            $sol->costo = $request->costo_estimado;
            

        } else {
            $sol->ind = 0; 
            $sol->codigo_sueldo = 0; 
            $sol->sueldo_venta = 0; 
            
            if ( isset( $request->celular ) ) {
                $sol->celular = 1;
                $sol->codigo_celular = 0;
            } else {
                $sol->celular = 0;
                $sol->codigo_celular = 0;
            }
            if ( isset( $request->computadora ) ) {
                $sol->computadora = 1;
                $sol->codigo_computadora = 0;
                $sol->desc_computadora = $request->desc_computadora;
            } else {
                $sol->computadora = 0;
                $sol->codigo_computadora = 0;
            }
            if ( isset( $request->auto ) ) {
                $sol->auto = 1;
                $sol->codigo_auto = 0;
            } else {
                $sol->auto = 0;
                $sol->codigo_auto = 0;
            }
            if ( isset( $request->bam ) ) {
                $sol->bam = 1;
                $sol->codigo_bam = 0;
            } else {
                $sol->bam = 0;
                $sol->codigo_bam = 0;
            }
            if ( isset( $request->software ) ) {
                $sol->software = 1;
                $sol->codigo_software = 0;
                $sol->desc_software = $request->desc_software;
            } else {
                $sol->software = 0;
                $sol->codigo_software = 0;
            }
            $sol->plan_linea = $request->plan_celular_select; 
            $sol->plan_linea_bam = $request->plan_bam_select; 

            $sol->venta = 0;
            $sol->costo = 0;
            $sol->tipo_proyecto = 1; //Esquema: normal, task, etc...
        }

        $sol->save();
        //GUARDADO DE DOCUMENTOS
        $lastid = $sol->id;
        $sol_file = $sol::find($lastid);
        $carpeta = "sol_".$lastid;
        if ( $request->file('vobo')!=null || $request->file('cv')!=null ) {
            Storage::makeDirectory('solicitudes/'.$carpeta, 0775, true);
        }
        if ( $request->servicio == "RREC" ) {
            if ( $request->file('caso_negocio')!=null ) {
                $ext = $request->file('caso_negocio')->getClientOriginalExtension();
                $sol_file->caso_negocio_url = $request->file('caso_negocio')->storeas('solicitudes/'.$carpeta,"caso_negocio_".$carpeta.".".$ext);
            }
            if ( $request->file('cotizacion')!=null ) {
                $ext = $request->file('cotizacion')->getClientOriginalExtension();
                $sol_file->cotizacion_url = $request->file('cotizacion')->storeas('solicitudes/'.$carpeta,"cotizacion_".$carpeta.".".$ext);
            }
        }
        if ( $request->file('vobo')!=null ) {
            $ext = $request->file('vobo')->getClientOriginalExtension();
            $sol_file->vobo_url = $request->file('vobo')->storeas('solicitudes/'.$carpeta,"vobo_".$carpeta.".".$ext);
        }
        if ( $request->file('cv')!=null ) {
            $ext = $request->file('cv')->getClientOriginalExtension();
            $sol_file->curriculum_url = $request->file('cv')->storeas('solicitudes/'.$carpeta,"cv_".$carpeta.".".$ext);
        }
        $sol_file->save();

        return view('altas.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
