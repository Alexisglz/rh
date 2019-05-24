<?php

namespace App\Http\Controllers;

use App\CatalogoWbs;
use App\Classes\Poliza;
use App\Classes\RentaFijaETL;
use App\Classes\TaskBased;
use App\Classes\VentaRO;
use Illuminate\Http\Request;

class WbsController extends Controller
{
    public function getWbs(Request $request){
    	$campo     = $request->valor;
    	$siguiente = $request->campo;
    	$tabla     = $request->tabla;

    	$cliente    = $request->cliente;
        $servicio   = $request->servicio;
        $region     = $request->region;
        $tecnologia = $request->tecnologia;
        $grupo      = $request->grupo;

        $servicios = CatalogoWbs::getSiguiente($campo,$siguiente,$tabla,$cliente,$servicio,$region,$tecnologia,$grupo);
        return $servicios;
    }

    public function taskBased(){
        $codigos = TaskBased::taskBased(2271);
        return $codigos;
    }

    public function rentaEtl(){
        $codigos = RentaFijaETL::create(2283);
        return $codigos;
    }

    public function poliza(){
        $codigos = Poliza::create(2271);
        return $codigos;
    }

    public function calcularVentaRo(){
        $venta = VentaRO::calcularVenta(48369);
        return $venta;
    }
}