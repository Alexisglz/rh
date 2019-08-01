<?php

namespace App\Http\Controllers;

use App\CatalogoCodigos;
use App\CatalogoPlanesLineas;
use App\Coordinadores;
use App\EmpleadosCatalogoCarga;
use App\EmpleadosCatalogoSat;
use Illuminate\Http\Request;
use Input;

class PeticionesSolicitudesController extends Controller
{
    public function getPlanes(){
    	$array = CatalogoPlanesLineas::getPlanes();
    	return $array;
    }

    public function getCodigosCelular(Request $request){
    	$term   = $request->term;
        $edit   = (isset($request->edit) && $request->edit == 1) ? true:false;
    	$array  = CatalogoCodigos::getCodigosCelular($term, $edit);
    	$result = array();
    	if ($edit == true){
            $result =[
                'id'       => $array->id,
                'value'    => $array->codigo,
                'label'    => $array->codigo.' - '.$array->concepto,
                'concepto' => $array->concepto,
                'precio'   => $array->precio,
                'diario'   => $array->diario,
            ];
        }
    	else{
            foreach ($array as $key => $value){
                $result[] =[
                    'id'       => $value->id,
                    'value'    => $value->codigo,
                    'label'    => $value->codigo.' - '.$value->concepto,
                    'concepto' => $value->concepto,
                    'precio'   => $value->precio,
                    'diario'   => $value->diario,
                ];
            }
        }
    	return response()->json($result);
    }

    public function getCodigosCelularDato(Request $request){
    	$term   = $request->term;
    	$edit   = (isset($request->edit) && $request->edit == 1) ? true:false;
    	$array  = CatalogoCodigos::getCodigosCelularDato($term,$edit);
    	$result = array();
        if ($edit == true){
            $result =[
                'id'       => $array->id,
                'value'    => $array->codigo,
                'label'    => $array->codigo.' - '.$array->concepto,
                'concepto' => $array->concepto,
                'precio'   => $array->precio,
                'diario'   => $array->diario,
            ];
        }
        else{
            foreach ($array as $key => $value){
                $result[] =[
                    'id'       => $value->id,
                    'value'    => $value->codigo,
                    'label'    => $value->codigo.' - '.$value->concepto,
                    'concepto' => $value->concepto,
                    'precio'   => $value->precio,
                    'diario'   => $value->diario,
                ];
            }
        }
    	return response()->json($result);
    }

    public function getCodigosComputadora(Request $request){
    	$term   = $request->term;
    	$edit   = (isset($request->edit) && $request->edit == 1) ? true:false;
    	$array  = CatalogoCodigos::getCodigosComputadora($term,$edit);
    	$result = array();
        if ($edit == true){
            $result =[
                'id'       => $array->id,
                'value'    => $array->codigo,
                'label'    => $array->codigo.' - '.$array->concepto,
                'concepto' => $array->concepto,
                'precio'   => $array->precio,
                'diario'   => $array->diario,
            ];
        }
        else{
            foreach ($array as $key => $value){
                $result[] =[
                    'id'       => $value->id,
                    'value'    => $value->codigo,
                    'label'    => $value->codigo.' - '.$value->concepto,
                    'concepto' => $value->concepto,
                    'precio'   => $value->precio,
                    'diario'   => $value->diario,
                ];
            }
        }
    	return response()->json($result);
    }

    public function getCodigosSoftware(Request $request){
    	$term   = $request->term;
    	$edit   = (isset($request->edit) && $request->edit == 1) ? true:false;
    	$array  = CatalogoCodigos::getCodigosSoftware($term,$edit);
    	$result = array();
        if ($edit == true){
            $result =[
                'id'       => $array->id,
                'value'    => $array->codigo,
                'label'    => $array->codigo.' - '.$array->concepto,
                'concepto' => $array->concepto,
                'precio'   => $array->precio,
                'diario'   => $array->diario,
            ];
        }
        else{
            foreach ($array as $key => $value){
                $result[] =[
                    'id'       => $value->id,
                    'value'    => $value->codigo,
                    'label'    => $value->codigo.' - '.$value->concepto,
                    'concepto' => $value->concepto,
                    'precio'   => $value->precio,
                    'diario'   => $value->diario,
                ];
            }
        }
    	return response()->json($result);
    }

    public function getCodigosBam(Request $request){
    	$term   = $request->term;
    	$edit   = (isset($request->edit) && $request->edit == 1) ? true:false;
    	$array  = CatalogoCodigos::getCodigosBam($term,$edit);
    	$result = array();
        if ($edit == true){
            $result =[
                'id'       => $array->id,
                'value'    => $array->codigo,
                'label'    => $array->codigo.' - '.$array->concepto,
                'concepto' => $array->concepto,
                'precio'   => $array->precio,
                'diario'   => $array->diario,
            ];
        }
        else{
            foreach ($array as $key => $value){
                $result[] =[
                    'id'       => $value->id,
                    'value'    => $value->codigo,
                    'label'    => $value->codigo.' - '.$value->concepto,
                    'concepto' => $value->concepto,
                    'precio'   => $value->precio,
                    'diario'   => $value->diario,
                ];
            }
        }
    	return response()->json($result);
    }

    public function getCodigosAuto(Request $request){
    	$term   = $request->term;
    	$edit   = (isset($request->edit) && $request->edit == 1) ? true:false;
    	$array  = CatalogoCodigos::getCodigosAuto($term,$edit);
    	$result = array();
        if ($edit == true){
            $result =[
                'id'       => $array->id,
                'value'    => $array->codigo,
                'label'    => $array->codigo.' - '.$array->concepto,
                'concepto' => $array->concepto,
                'precio'   => $array->precio,
                'diario'   => $array->diario,
            ];
        }
        else{
            foreach ($array as $key => $value){
                $result[] =[
                    'id'       => $value->id,
                    'value'    => $value->codigo,
                    'label'    => $value->codigo.' - '.$value->concepto,
                    'concepto' => $value->concepto,
                    'precio'   => $value->precio,
                    'diario'   => $value->diario,
                ];
            }
        }
    	return response()->json($result);
    }

    public function getCodigosPoliza(Request $request){
    	$term   = $request->term;
    	$edit   = (isset($request->edit) && $request->edit == 1) ? true:false;
    	$array  = CatalogoCodigos::getCodigosPoliza($term,$edit);
    	$result = array();
        if ($edit == true){
            $result =[
                'id'       => $array->id,
                'value'    => $array->codigo,
                'label'    => $array->codigo.' - '.$array->concepto,
                'concepto' => $array->concepto,
                'precio'   => $array->precio,
                'diario'   => $array->diario,
            ];
        }
        else{
            foreach ($array as $key => $value){
                $result[] =[
                    'id'       => $value->id,
                    'value'    => $value->codigo,
                    'label'    => $value->codigo.' - '.$value->concepto,
                    'concepto' => $value->concepto,
                    'precio'   => $value->precio,
                    'diario'   => $value->diario,
                ];
            }
        }
    	return response()->json($result);
    }

    public function getCodigosSueldo(Request $request){
        $term   = $request->term;
        $edit   = (isset($request->edit) && $request->edit == 1) ? true:false;
        $array  = CatalogoCodigos::getCodigosSueldo($term,$edit);
        $result = array();
        if ($edit == true){
            $result =[
                'id'       => $array->id,
                'value'    => $array->codigo,
                'label'    => $array->codigo.' - '.$array->concepto,
                'concepto' => $array->concepto,
                'precio'   => $array->precio,
                'diario'   => $array->diario,
            ];
        }
        else{
            foreach ($array as $key => $value){
                $result[] =[
                    'id'       => $value->id,
                    'value'    => $value->codigo,
                    'label'    => $value->codigo.' - '.$value->concepto,
                    'concepto' => $value->concepto,
                    'precio'   => $value->precio,
                    'diario'   => $value->diario,
                ];
            }
        }
        return response()->json($result);
    }

    public function getCoord(Request $request){
        $valor = $request->valor;
        $array = Coordinadores::existeCoord($valor);
        return json_encode($array);
    }

    public function calcularCostosRecuros(Request $request) {
        $riesgo         = ( $request->riesgo == 2 || $request->riesgo == 1 ) ? 'RIESGO 2':'RIESGO 5';
        $imss           = $request->imss;
        $variable       = $request->variable;
        $esquema        = ( !empty($request->esquema) ) ? $request->esquema:"ALTERNATIVO";
        $sueldo_total   = $request->imss + $request->variable;

        $getCostosCarga = EmpleadosCatalogoCarga::getCostosCarga( $riesgo , $imss );
        $porcentaje     = 0;
        foreach ($getCostosCarga as $data) {
            foreach ($data as $key => $value) {
                $porcentaje = $value;
            }
        }

        $getCostosSat   = EmpleadosCatalogoSat::getCostosSat( $sueldo_total );
        $isr_porcentaje = 0;
        foreach ($getCostosSat as $data) {
            foreach ($data as $key => $value) {
                $isr_porcentaje = $value;
            }
        }

        $carga        = $imss * $porcentaje/100;
        $imss_isr     = $imss * $isr_porcentaje/100;
        $imss_fee     = $imss * 0.045;
        $variable_isr = $variable * $isr_porcentaje/100;
        $variable_fee = $variable * 0.045;

        switch ($esquema) {
            case 'TRADICIONAL':
                $costo = $imss + $carga + $imss_isr + $imss_fee;
                break;
            case 'ALTERNATIVO':
                $costo = ($imss + $carga + $imss_isr + $imss_fee) + ($variable + $variable_fee);
                break;
            
            case 'ASIMILADO':
            case 'MIXTO':
                $costo = ($imss + $carga + $imss_isr + $imss_fee) + ($variable + $variable_isr + $variable_fee);
                break;

            case 'EFECTIVO':
                $costo = $sueldo_total;
                break;
        }

        $array = [
            "costo_mensual" => $costo,
            "carga"         => $carga,
            "imss_isr"      => $imss_isr,
            "imss_fee"      => $imss_fee,
            "porcentaje"    => $porcentaje,
            "riesgo"        => $riesgo
        ];
        return $array;
    }

    public function getCostoPlan(Request $request) {
        $costo = CatalogoPlanesLineas::getCostoPlan($request->id);
        return $costo;
    }
}
