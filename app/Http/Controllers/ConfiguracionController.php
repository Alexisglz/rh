<?php

namespace App\Http\Controllers;

use App\CatalogoWbs;
use App\GlobalModel;
use DB;
use Illuminate\Http\Request;
use Storage;

class ConfiguracionController extends Controller
{
    /**
     *
     * RULES
     *
     **/
    protected $rules = [
        'grupo' => ['required']
    ];

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $clientes = CatalogoWbs::Clientes();
        $servicios = CatalogoWbs::Serv();
        $regiones = CatalogoWbs::Region();
        $tecnologias = CatalogoWbs::Tecnologia();
        $grupos = CatalogoWbs::Grupo();

        return view('configuracion.index', [
            'clientes' => $clientes,
            'servicios' => $servicios,
            'regiones' => $regiones,
            'tecnologias' => $tecnologias,
            'grupos' => $grupos]);
    }



    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function funcionCodigos(Request $req)
    {
        $id = $req->id;
        $opcion = $req->opcion;
        $Ccodigo = $req->Ccodigo;
        $Cconsepto = $req->Cconsepto;
        $Cprecio = $req->Cprecio;
        $Ccosto = $req->Ccosto;
        $Cincluye = $req->Cincluye;
        $Ctipo = $req->Ctipo;
        $Cdiario = $req->Cdiario;
        $Cpd = $req->Cpd;
        $CdiarioGasolina = $req->CdiarioGasolina;
        $MontoViatico = $req->MontoViatico;
        $Horas = $req->Horas;
        $CincluyeViaticos = $req->CincluyeViaticos;
        $CincluyeEquipo = $req->CincluyeEquipo;
        $cDescripcion = $req->cDescripcion;
        $Ccaduca = $req->Ccaduca;


        $query = "call rh.sp_Catalogos_Opciones($opcion, $id,'$Ccodigo', '$Cconsepto',$Cprecio ,$Ccosto , '$Cincluye', '$Ctipo',$Cdiario , '$Cpd',$CdiarioGasolina ,$MontoViatico ,$CincluyeViaticos ,$CincluyeEquipo, '$cDescripcion', '$Horas', '$Ccaduca');";


        $results = DB::select(DB::raw($query));

// $citas=DB::select(DB::raw($query)); 
//     return DataTables::of($citas)           
//     ->make(true);

        return $results;


    }


    public function FuncionesCodigos(Request $req)
    {
        $_Catalogo = $req->Catalogo;
        $_Opcion = $req->Opcion;

        $_idCoordinador = $req->idCoordinador;
        $_Nombre = $req->Nombre;
        $_Apellido = $req->Apellido;
        $_Correo = $req->Correo;


        $_plan_id = $req->plan_id;
        $_plan_codigo = $req->plan_codigo;
        $_plan_nombre = $req->plan_nombre;
        $_plan_tipo = $req->plan_tipo;
        $_plan_descripcion = $req->plan_descripcion;
        $_plan_costo = $req->plan_costo;
        $_plan_precio = $req->plan_precio;
        $_plan_empresa = $req->plan_empresa;
        $_plan_proveedor = $req->plan_proveedor;

        $_idwbs = $req->idwbs;
        $_cliente = $req->cliente;
        $_servicio = $req->servicio;
        $_region = $req->region;
        $_tecnologia = $req->tecnologia;
        $_grupo = $req->grupo;


        $query = "call rh.sp_catalogos_crud('$_Catalogo', '$_Opcion',$_idCoordinador,'$_Nombre', '$_Apellido', '$_Correo',$_plan_id, '$_plan_codigo', '$_plan_nombre', '$_plan_tipo', '$_plan_descripcion',$_plan_costo,$_plan_precio,'$_plan_empresa', '$_plan_proveedor',$_idwbs, '$_cliente', '$_servicio', '$_region', '$_tecnologia',$_grupo)";

        $results = DB::select(DB::raw($query));

// $citas=DB::select(DB::raw($query)); 
//     return DataTables::of($citas)           
//     ->make(true);

        return $results;


    }


    public function funcionProyectosWBS(Request $req)
    {
        $id = $req->id;
        $opcion = $req->opcion;
        $wbs = $req->wbs;
        $nombre = $req->nombre;
        $activo = $req->activo;
        $query = "call rh.sp_proyectos_wbs('$wbs', $opcion,'$id', '$nombre',$activo);";
        $results = DB::select(DB::raw($query));
        return $results;
    }


}






