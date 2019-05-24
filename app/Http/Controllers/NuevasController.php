<?php

namespace App\Http\Controllers;

use App\GlobalModel;
use Illuminate\Http\Request;
use Storage;

class NuevasController extends Controller
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
        return view('incidencias.index');
    }

    public function create()
    {
        return view('incidencias.nueva');
    }


    public function getEmpleados(Request $request){
        //$data = Item::select("nombre ")->where("concat_ws(' ',empleado_nombre,empleado_apaterno,empleado_amaterno)","LIKE","%{$request->input('query')}%")->get();

        $empleados = DB::table('empleados')
                ->select(DB::raw("concat_ws(' ', empleado_nombre, empleado_apaterno, empleado_amaterno) AS nombre"),'empleado_id as id')                
                ->where("empleado_nombre","LIKE","%{$request->input('term')}%")
                ->get();
        $data=array();

        foreach ($empleados as $empleado) {
              $data[]=array('value'=>$empleado->nombre,'id'=>$empleado->id);
        }
        return response()->json($data);
    }
    



    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

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
