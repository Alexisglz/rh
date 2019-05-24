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
	protected $table = 'catalogo_codigos';
	





    public static function getCodigosCelular($term){
    	$array = DB::table('catalogo_codigos')
    			->select()
    			->where('tipo','like','%celular%')
    			->where('codigo','like','%'.$term.'%')
    			->whereNull('caduca')
    			->get();
    	return $array;
    } 


	public static function getCodigosCelularDato($term){
    	$array = DB::table('catalogo_codigos')
    			->select()
    			->where('codigo',"=",$term)
    			->get();
    	return $array;
	} 



    public static function getCodigosComputadora($term){
    	$array = DB::table('catalogo_codigos')
    			->select()
    			->where('tipo','like','%computo%')
    			->where('codigo','like','%'.$term.'%')
    			->whereNull('caduca')
    			->get();
    	return $array;
    } 

    public static function getCodigosSoftware($term){
    	$array = DB::table('catalogo_codigos')
    			->select()
    			->where('tipo','like','%sw%')
    			->where('codigo','like','%'.$term.'%')
    			->whereNull('caduca')
    			->get();
    	return $array;
    } 

    public static function getCodigosBam($term){
    	$array = DB::table('catalogo_codigos')
    			->select()
    			->where('tipo','like','%bam%')
    			->where('codigo','like','%'.$term.'%')
    			->whereNull('caduca')
    			->get();
    	return $array;
    }

    public static function getCodigosAuto($term){
    	$array = DB::table('catalogo_codigos')
    			->select()
    			->where('tipo','like','%auto%')
    			->where('codigo','like','%'.$term.'%')
    			->whereNull('caduca')
    			->get();
    	return $array;
    } 

    public static function getCodigosPoliza($term){
        $array = DB::table('catalogo_codigos')
                ->select()
              ->where('tipo','like','%poliza%')
                ->where('codigo','like','%'.$term.'%')
                ->whereNull('caduca')
                ->get();
        return $array;
    }

    public static function getCodigosSueldo($term){
        $array = DB::table('catalogo_codigos')
                ->select('*')
                ->where('tipo','like','%sueldo%')
                ->where('codigo','like','%'.$term.'%')
                ->whereNull('caduca')
                ->get();
        return $array;
    } 
}