<?php

namespace App\Exports;

use App\User;
use App\VistaIncidencias;
use App\VistaIncidenciasLote;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;

class IncidenciasLoteExport implements FromCollection, WithHeadings, ShouldAutoSize
{
    use Exportable;

    public function __construct($id, $area)
    {
        $this->id   = $id;
        $this->area = $area;
    }

    /** Funcion recursiva para obtener el arbol de empleados
     * @param int $id
     * @return bool
     */
    public function recursivoEmpleados(int $id){
        if ($id == null)
            return true;
        else{
            $usuario  = User::find($id);
            if ($usuario->getCoordinador){
                $movs = $usuario->getCoordinador->getMovimientos;
                foreach ($movs as $item){
                    if ($item->getEmpleado->empleado_id == null)
                        continue;
                    $this->array[] = $item->getEmpleado->empleado_id;
                    $user          = User::where('empleado_id', '=', $item->empleado_id)->first();
                    $this->recursivoEmpleados($user->id_usuario);
                }
            }
            else{
                return true;
            }
        }
    }

    public function collection()
    {
        $models = VistaIncidenciasLote::query();
        $usuario   = auth()->user();
        if ($usuario->listarTodo == null){
            if ($usuario->getCoordinador){
                $this->recursivoEmpleados($usuario->id_usuario);
                $emps = array_values(array_unique($this->array));
                $models->whereIn('id_empleado', $emps);
            }
        }
        $models->select(
            'id','empleado','tipo_incidencia','fecha_solicitud','fecha_inicio','fecha_fin','duracion',
            'monto','motivo','solicitante','Autorizado_RH','Autorizado_DIR','Autorizado_Capital','id_lote'
        );
        switch ($this->area){
            case 'ESP':
                break;
            case 'RH':
                $models->where('solicitante','<>','Especial');
                break;
            case 'DIR':
                $models->where('solicitante','<>','Especial');
                break;
            case 'ADMIN':
                break;
            case 'ENTR':
                $models->where('solicitante','<>','Especial');
                break;
            default:
                $models->where('id_solicitante','=',auth()->user()->id_usuario);
                break;
        }
        $models = $models->get();
        return collect($models);
    }

    public function headings(): array
    {
        return [
            'ID','EMPLEADO','TIPO INCIDENCIA','FECHA SOLICITUD','FECHA INICIO','FECHA FIN','DURACION',
            'MONTO','MOTIVO','SOLICITANTE','AUTH RH','AUTH DIRECCION','AUTH CAPITAL','LOTE'
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
