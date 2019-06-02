<?php

namespace App\Exports;

use App\User;
use App\VistaIncidencias;
use DB;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;

class IncidenciasExport implements FromCollection, WithHeadings, ShouldAutoSize
{
    use Exportable;
    public $area;
    public $id;
    public $array;

    /**
     * IncidenciasExport constructor.
     * @param $id
     * @param $area
     */
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
                    if ($item->getEmpleado == null )
                        continue;
                    if ($item->getEmpleado->empleado_id == null)
                        continue;
                    $this->array[] = $item->getEmpleado->empleado_id;
                    $user          = User::where('empleado_id', '=', $item->empleado_id)->first();
                    if ($user)
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
        $models = VistaIncidencias::query();
        $usuario   = auth()->user();
        if ($usuario->listarTodo == null){
            if ($usuario->getCoordinador){
                $this->recursivoEmpleados($usuario->id_usuario);
                $emps = array_values(array_unique($this->array));
                $models->whereIn('id_empleado', $emps);
            }
        }
        $models->select(
            'id','id_empleado','empleado','id_incidencia_tipo','nombre','fecha_solicitud',
            'fecha_inicio', 'fecha_fin','dias','monto','motivo','id_solicitante','solicitante','id_lote',
            'auth_rh','id_rh_auth','rh','auth_direccion','id_direccion_auth','dir','auth_capital',
            'id_capital_auth','capital','created_at','updated_at','deleted_at','status_auth'
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
            'ID','ID EMPLEADO','NOMBRE EMPLEADO','ID TIPO','NOMBRE TIPO','FECHA SOL','FECHA INICIO','FECHA FIN',
            'DIAS','MONTO','MOTIVO','ID SOLICITANTE','NOMBRE SOLICITANTE','ID LOTE','AUTH RH','ID AUTH RH',
            'NOMBRE RH','AUTH DIR','ID AUTH DIR','NOMBRE DIR','CAPITAL','ID AUTH CAPITAL','NOMBRE CAPITAL',
            'FECHA DE CREACION','FECHA DE MODIFICACION','FECHA DE ELIMINACION','ESTATUS'
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
