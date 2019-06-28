<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

/**
 * App\CatalogoWbs
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoWbs newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoWbs newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\CatalogoWbs query()
 * @mixin \Eloquent
 */
class CatalogoWbs extends Model
{
    protected $connection = 'incore';
    protected $table = 'catalogo_wbs';

    public static function Clientes(){
    	$array = ProyectosClientes::where('activo', 1)->pluck('nombre','id');
    	return $array;
    }


    public static function Serv(){
    	$array = ProyectosServicios::where('status', 1)->pluck('nombre','id');
    	return $array;
    }

    public static function Region(){
    	$array = ProyectosRegiones::where('status', 1)->pluck('nombre','id');
    	return $array;
    }

    public static function Tecnologia(){
    	$array = ProyectosTecnologias::where('status', 1)->pluck('nombre','id');
    	return $array;
    }


    public static function Grupo(){
    	$array = ProyectosGrupo::where('status', 1)->pluck('nombre','id');
    	return $array;
    }




    public static function getSiguiente($a_buscar,$en_donde,$tabla,$cliente, $servicio, $region, $tecnologia, $grupo){
        $where   = array();
        $user    = auth()->user();
        $pd      = [];
        if ( !empty($cliente) ) {
            $where[] = ['wbs.cliente','=',$cliente];
            if ($user->listarTodo == null) {
                foreach ($user->getCoordPD as $item){
                    $pd[] = $item->servicio;
                }
            }
        }
        if ( !empty($servicio) ) {
            $where[] = ['wbs.servicio','=',$servicio];
        }
        if ( !empty($region) ) {
            $where[] = ['wbs.region','=',$region];
        }
        if ( !empty($tecnologia) ) { 
            $where[] = ['wbs.tecnologia','=',$tecnologia];
        }
        if ( !empty($grupo) ) {
            $where[] = ['wbs.grupo','=',$grupo];
        }
        $where[] = ['wbs.estatus','=','1'];

        $array = DB::table('incore.catalogo_wbs AS wbs')
                ->select(DB::raw("DISTINCT(ps.id) AS id"), 'ps.nombre AS nombre')
                ->join('incore.proyectos_'.$tabla.' AS ps','wbs.'.$en_donde,'=','ps.id')
                ->where($where);
        if ($user->getCoordinador){
            if($user->listarTodo == null){
                $pd = DB::table('incore.coordinadores_project_definition')
                    ->select(DB::raw("CONCAT(cliente,'-',servicio) AS pd"))
                    ->where('usuario_id',$user->id_usuario)->pluck('pd');
                $array->whereIn(DB::raw("CONCAT(wbs.cliente,'-',wbs.servicio)"),$pd->toArray());
            }
        }
        return $array->get();
    }
}