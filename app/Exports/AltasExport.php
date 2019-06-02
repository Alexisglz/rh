<?php

namespace App\Exports;

use App\Models\CatalogoCoordinadores;
use App\Models\VistaSolAltas;
use App\User;
use DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;

class AltasExport implements FromCollection, WithHeadings, ShouldAutoSize
{

    public function __construct($ini, $fin)
    {
        $this->ini = $ini;
        $this->fin = $fin;
    }

    /** Funcion recursiva para obtener el arbol de coordinadores
     * @param int $id
     * @return bool
     */
    public function recursivoCoordinadores(int $id){
        if ($id == null)
            return true;
        else{
            $usuario  = User::find($id);
            if ($usuario->getCoordinador){
                $movs = $usuario->getCoordinador->getMovimientos;
                foreach ($movs as $item){
                    if ($item->getEmpleado == null)
                        continue;
                    if ($item->getEmpleado->empleado_id == null)
                        continue;
                    $user = User::where('empleado_id', '=', $item->empleado_id)->first();
                    if ($user == null){
                        continue;
                    }
                    $coord = CatalogoCoordinadores::where('user_id', '=', $user->id_usuario)->first();
                    if ($coord)
                        $this->coords[] = $coord->id;
                    $this->recursivoCoordinadores($user->id_usuario);
                }
            }
            else{
                return true;
            }
        }
    }

    public function collection()
    {
        $models  = VistaSolAltas::query();
        $usuario = auth()->user();
        if ($usuario->listarTodo == null) {
            if ($usuario->getCoordinador) {
                $this->recursivoCoordinadores($usuario->id_usuario);
                $this->coords[] = $usuario->getCoordinador->id;
                $coords         = array_values(array_unique($this->coords));
                $models->whereIn('coordinador_id', $coords);
            }
        }
        $models->select(
            'fecha solicitud','cita','WBS','Nombre','coordinador','coordinadornokia',
            'pm','imss','variable','asimilado','costo','venta','margen','Solicitante');
        $models->whereBetween('fecha solicitud',[$this->ini, $this->fin]);
        $models = $models->get();
        return collect($models);
    }

    public function headings(): array
    {
        return [
            'Fecha Solicitud',
            'Cita',
            'WBS',
            'Nombre',
            'Coordinador',
            'Coordinador Nokia',
            'PM',
            'IMSS',
            'Variable',
            'Asimilado',
            'Costo',
            'Venta',
            'Margen',
            'Solicitante'
        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function(AfterSheet $event) {
                $cellRange = 'A1:W1';
                $event->sheet->getDelegate()->getStyle($cellRange)->getFont()->setSize(14);
            },
        ];
    }
}
