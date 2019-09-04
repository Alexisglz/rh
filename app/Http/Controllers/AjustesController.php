<?php

namespace App\Http\Controllers;

use App\Empleados;
use App\Events\SueldosEvents;
use App\Models\AjusteSueldo;
use App\Models\VistaAjusteSueldo;
use App\User;
use DB;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Storage;

class AjustesController extends Controller
{
    public function index(){
        $this->authorize('access',[User::class, 'listado_ajuste_s']);
        return view('ajustes.index');
    }

    public function save(Request $request){
        $this->authorize('access',[User::class, 'nuevo_ajuste_s']);
        try{
            DB::beginTransaction();
            $empleado              = Empleados::find($request->id);
            $ajuste                = new AjusteSueldo();
            $ajuste->id_empleado   = $empleado->empleado_id;
            $ajuste->ro            = $request->ro;
            $ajuste->num_empleado  = $empleado->empleado_num;
            $ajuste->tradicional   = $request->tradicional;
            $ajuste->asimilado     = $request->asimilado;
            $ajuste->observaciones = $request->observaciones;
            $ajuste->fecha_inicio  = $request->fecha;
            $ajuste->save();
            $ajuste->url = $this->createFile($ajuste->id, $ajuste->num_empleado);
            $ajuste->save();
            DB::commit();
            event(new SueldosEvents(null,'auth_ajuste', $ajuste->id));
            return response()->json([
                'ok' => true,
                'data' => $empleado
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return response()->json([
                'ok' => false,
                'data' => $e->getMessage()
            ]);
        }
    }

    public function edit(Request $request){
        try{
            DB::beginTransaction();
            $ajuste = AjusteSueldo::find($request->id);
            $ajuste->tradicional   = $request->tradicional;
            $ajuste->asimilado     = $request->asimilado;
            $ajuste->observaciones = $request->observaciones;
            $ajuste->save();
            DB::commit();
            return response()->json([
                'ok' => true,
                'data' => $ajuste
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return response()->json([
                'ok' => false,
                'data' => $e->getMessage()
            ]);
        }
    }

    public function createFile($id, $num){
        try{
            $dir = 'ajustes/'.$id.'_'.$num.'/';
            if (!Storage::exists($dir)){
                Storage::makeDirectory($dir, 0775, true);
            }
            $name = $dir.$id.'_'.$num.'_'.date('Ymd').'.xlsx';
            Excel::store(new \App\Exports\AjusteSueldo([$id]),$name,'public');
            return $name;
        }catch (\Exception $e){
            return $e;
        }
    }

    public function createExcel($ids){
        try{
            $dir = 'ajustes/enviados_'.date('Ymd').'/';
            if (!Storage::exists($dir)){
                Storage::makeDirectory($dir, 0775, true);
            }
            $name = $dir.'ajustes_'.date('Ymd').'.xlsx';
            Excel::store(new \App\Exports\AjusteSueldo($ids),$name,'public');
            return $name;
        }catch (\Exception $e){
            return $e;
        }
    }

    public function delete(Request $request){
        try{
            DB::beginTransaction();
            $ajuste = AjusteSueldo::find($request->id);
            $dir = 'ajustes/'.$ajuste->id.'_'.$ajuste->num_empleado;
            if (Storage::disk('public')->exists($dir)){
                Storage::disk('public')->deleteDirectory($dir);
            }
            $ajuste->delete();
            DB::commit();
            return response()->json([
                'ok' => true,
                'data' => $ajuste
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return response()->json([
                'ok' => false,
                'data' => $e->getMessage()
            ]);
        }
    }

    public function send(Request $request){
        try{
            DB::beginTransaction();
            $url = $this->createExcel($request->ajustes);
            foreach ($request->ajustes as $item){
                $ajuste            = AjusteSueldo::find($item);
                $ajuste->estatus   = 'enviado';
                $ajuste->url_envio = $url;
                $ajuste->save();
            }
            DB::commit();
            event(new SueldosEvents($url,'envio_ajustes'));
            return response()->json([
                'ok'   => true,
                'data' => []
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return response()->json([
                'ok'   => false,
                'data' => $e->getMessage()
            ]);
        }
    }

    public function autorizar(){
        return view('ajustes.autorizar');
    }

    public function validarAjuste(Request $request){
        try{
            DB::beginTransaction();
            $ajuste = AjusteSueldo::find($request->id);
            $ajuste->fecha_validacion = date('Y-m-d H:i:s');
            if ($request->accion == 'autorizar'){
                $ajuste->estatus = 'autorizado';
                $ajuste->usuario_auth = auth()->user()->id_usuario;
            }
            else{
                $ajuste->estatus = 'rechazado';
                $ajuste->usuario_cancel = auth()->user()->id_usuario;
            }
            $ajuste->save();
            DB::commit();
            return response()->json([
                'ok' => true,
                'data' => $ajuste
            ]);
        }catch (\Exception $e){
            DB::rollBack();
            return response()->json([
                'ok' => false,
                'data' => $e->getMessage()
            ]);
        }
    }

    public function validar(Request $request){
        if (!isset($request->id))
            return redirect()->route('ajuste.index');
        $ajuste = VistaAjusteSueldo::find($request->id);
        return view('ajustes.aprobar',[
            'ajuste' => $ajuste
        ]);
    }

    public function saveAprobar(Request $request){
        try{
            DB::beginTransaction();
            $ajuste = AjusteSueldo::find($request->id);
            $ajuste->fecha_validacion = date('Y-m-d H:i:s');
            if ($request->accion == 'autorizar'){
                $ajuste->estatus = 'autorizado';
                $ajuste->usuario_auth = auth()->user()->id_usuario;
            }
            else{
                $ajuste->estatus = 'rechazado';
                $ajuste->usuario_cancel = auth()->user()->id_usuario;
            }
            $ajuste->save();
            DB::commit();
            return redirect()->route('ajuste.autorizar')->with('success','Solicitud actualizada correctamente');
        }catch (\Exception $e){
            DB::rollBack();
            return response()->json([
                'ok' => false,
                'data' => $e->getMessage()
            ]);
        }
    }
}
