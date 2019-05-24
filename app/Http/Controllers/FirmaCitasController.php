<?php

namespace App\Http\Controllers;

use App\Estados;
use App\GlobalModel;
use App\Models\Puesto;
use App\User;
use Illuminate\Support\Facades\DB;

class FirmaCitasController extends Controller
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
        $this->authorize('access',[User::class, 'listado_citas']);
        $puestos = Puesto::where('activo','!=', 0)->get();
        $iareas = DB::table('incore.catalogo_areas')
            ->select()
            ->get();
        $areas = [];
        foreach ($iareas as $item){
            if($item->estatus == 'ACTIVO')
                $areas[$item->area] = $item->area;
        }
        $ilocalidades = DB::table('incore.catalogo_localidades')
            ->select()
            ->get();
        $localidades = [];
        foreach ($ilocalidades as $item){
            $localidades[] = $item->localidad_nombre;
        }
        $proveedores = DB::table('incore.catalogo_proveedores_recursos')
            ->select()
            ->where('activo', 1)
            ->get();
        $razones = DB::table('incore.catalogo_razonrh')
            ->select()
            ->where('proveedor_id', 1)
            ->get();
        $estados = Estados::all();
        return view('bajas.citas_firma',[
            'puestos'     => $puestos,
            'estados'     => $estados,
            'areas'       => $areas,
            'localidades' => $localidades,
            'proveedores' => $proveedores,
            'razones'     => $razones
        ]);
    }

    public function show($id)
    {
        return view('bajas.citas_firma');
    }

    public function store()
    {
    }

}
