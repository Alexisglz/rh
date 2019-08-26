<?php

namespace App\Http\Controllers;

use File;
use Illuminate\Http\Request;
use Storage;

class FileController extends Controller
{
    /*  ------------------------------------------
     *  Funcion para descargar archivos
     *  ------------------------------------------
     *  @string path    Directorio principal
     *  @string folder  Subdirectorio
     *  @string file    Archivo a descargar
     *  ------------------------------------------
     */
    public function export(Request $request){
        $path   = $request->path;
        $folder = $request->folder;
        $name   = $request->file;
        $exist  = sprintf('storage/%s/%s/%s',$path, $folder, $name);
        if(File::exists($exist)){
            return response()->download($exist);
        }
        else{
            return back();
        }
    }

    public function getManual(Request $request){

        //dd($request->path);
        $folder = $request->path;
        $file   = $request->file;
        $url    = sprintf('%s/%s', $folder, $file);
        $exists = Storage::disk('public')->exists($url);
        if ($exists)
        {
            return Storage::disk('public')->download($url);
        }

    }
}
