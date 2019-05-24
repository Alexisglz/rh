<?php

namespace App\Helpers;

use File;
use Storage;

class Upload{

    /*
     * Clase para subir archivos
     * @int     dir     Carpeta donde se guardaran los archivos
     * @string  key     Nombre del parametro que se recibe de la peticion GET,POST, ETC...
     * @array   model   Modelo que se esta utilizando
     * @string  name    Nombre del archivo que se va a guardar si no se recibe se crea uno genericamente
     */
    public static function uploadFile(string $dir, string $key, $model = [], string $name = null){
        if ($dir == null || $key == null || $dir == "" || $key == "")
            return abort(500, 'Las variables dir y key son obligatorias y no pueden ser nulas');
        if (!File::exists($dir)){
            Storage::makeDirectory($dir, 0775, true);
        }
        if (empty($model))
            $id  = 1;
        else
            $id = $model->id;
        $ext  = request()->file($key)->getClientOriginalExtension();
        if ($name != null)
            $file = $name. "." . $ext;
        else
            $file = $key."_" . $id . "." . $ext;
        $path = request()->file($key)->storeas('public/'.$dir, $file);
        $real_path = str_replace("public/", "", $path);
        return $real_path;
    }
}