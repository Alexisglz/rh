<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

/**
 * App\CatalogoCodigos
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoCodigos newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoCodigos newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoCodigos query()
 * @mixin \Eloquent
 */
class CatalogoCodigos extends Model
{
    protected $connection = 'incore';
	protected $table      = 'catalogo_nokia_codigos';
	public $timestamps    = false;

    public static function getCodigosCelular($term, $edit = false){
    	$array = DB::table('incore.catalogo_nokia_codigos')
    			->select()
    			->where('tipo','like','%celular%')
    			->where('codigo','like','%'.$term.'%')
    			->whereNull('caduca');
    	if ($edit == true)
    	    $array = $array->first();
    	else
    	    $array = $array->get();
    	return $array;
    } 


	public static function getCodigosCelularDato($term, $edit = false){
    	$array = DB::table('incore.catalogo_nokia_codigos')
    			->select()
    			->where('codigo',"=",$term);
    	if ($edit == true)
    	    $array = $array->first();
    	else
    	    $array = $array->get();
    	return $array;
	} 



    public static function getCodigosComputadora($term, $edit = false){
    	$array = DB::table('incore.catalogo_nokia_codigos')
    			->select()
    			->where('tipo','like','%computo%')
    			->where('codigo','like','%'.$term.'%')
    			->whereNull('caduca');
    	if ($edit == true)
    	    $array = $array->first();
    	else
    	    $array = $array->get();
    	return $array;
    } 

    public static function getCodigosSoftware($term, $edit = false){
    	$array = DB::table('incore.catalogo_nokia_codigos')
    			->select()
    			->where('tipo','like','%sw%')
    			->where('codigo','like','%'.$term.'%')
    			->whereNull('caduca');
    	if ($edit == true)
    	    $array = $array->first();
    	else
    	    $array = $array->get();
    	return $array;
    } 

    public static function getCodigosBam($term, $edit = false){
    	$array = DB::table('incore.catalogo_nokia_codigos')
    			->select()
    			->where('tipo','like','%bam%')
    			->where('codigo','like','%'.$term.'%')
    			->whereNull('caduca');
    	if ($edit == true)
    	    $array = $array->first();
    	else
    	    $array = $array->get();
    	return $array;
    }

    public static function getCodigosAuto($term, $edit = false){
    	$array = DB::table('incore.catalogo_nokia_codigos')
    			->select()
    			->where('tipo','like','%auto%')
    			->where('codigo','like','%'.$term.'%')
    			->whereNull('caduca');
    	if ($edit == true)
    	    $array = $array->first();
    	else
    	    $array = $array->get();
    	return $array;
    } 

    public static function getCodigosPoliza($term, $edit = false){
        $array = DB::table('incore.catalogo_nokia_codigos')
                ->select()
              ->where('tipo','like','%poliza%')
                ->where('codigo','like','%'.$term.'%')
                ->whereNull('caduca');
        if ($edit == true)
    	    $array = $array->first();
    	else
    	    $array = $array->get();
        return $array;
    }

    public static function getCodigosSueldo($term, $edit = false){
        $array = DB::table('incore.catalogo_nokia_codigos')
                ->select('*')
                ->where('tipo','like','%sueldo%')
                ->where('codigo','like','%'.$term.'%')
                ->whereNull('caduca');
        if ($edit == true)
    	    $array = $array->first();
    	else
    	    $array = $array->get();
        return $array;
    } 
}