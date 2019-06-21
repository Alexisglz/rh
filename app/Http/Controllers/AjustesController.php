<?php

namespace App\Http\Controllers;

use App\Empleados;
use App\Events\SueldosEvents;
use App\Models\AjusteSueldo;
use App\User;
use DB;
use File;
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
            $ajuste->num_empleado  = $empleado->empleado_num;
            $ajuste->tradicional   = $request->tradicional;
            $ajuste->asimilado     = $request->asimilado;
            $ajuste->observaciones = $request->observaciones;
            $ajuste->save();
            $ajuste->url = $this->createFile($ajuste->id, $ajuste->num_empleado);
            $ajuste->save();
            DB::commit();
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
                $ajuste->enviado   = 'SI';
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
}
