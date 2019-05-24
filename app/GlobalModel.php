<?php

namespace App;

use DB;

class GlobalModel
{

    public static function SetBitacoras($tipo, $id_tabla, $id_usuario_login, $id_empleado, $mensaje, $opc)
    {
        try{
            DB::beginTransaction();
            $bitacora                   = new Bitacoras();
            $bitacora->tipo             = $tipo;
            $bitacora->id_tabla         = $id_tabla;
            $bitacora->id_usuario_login = $id_usuario_login;
            $bitacora->id_empleado      = $id_empleado;
            $bitacora->mensaje          = $mensaje;
            $bitacora->fecha            = date('Y-m-d H:i:s');
            $bitacora->hora             = date('H:i:s');
            $bitacora->status_auth      = $opc;
            $bitacora->save();
            DB::commit();
            return true;
        }catch (\Exception $e){
            DB::rollBack();
            return false;
        }
    }

}

