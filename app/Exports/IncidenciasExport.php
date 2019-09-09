<?php

namespace App\Exports;

use App\User;
use App\VistaIncidencias;
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
     * @var int
     */
    public $periodo;
    /**
     * @var int
     */
    public $estatus;

    /**
     * IncidenciasExport constructor.
     * @param $id
     * @param $area
     * @param int $periodo
     * @param string $estatus
     */
    public function __construct($id, $area, $periodo = 0, $estatus = 'TODAS')
    {
        $this->id   = $id;
        $this->area = $area;
        $this->periodo = $periodo;
        $this->estatus = $estatus;
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
        $models    = VistaIncidencias::query();
        $usuario   = auth()->user();
        if ($usuario->listarTodo == null){
            if ($usuario->getCoordinador){
                $this->recursivoEmpleados($usuario->id_usuario);
                $emps = array_values(array_unique($this->array));
                $models->whereIn('id_empleado', $emps);
            }
        }
        $models->select(
            'id',
            'emp_id',
            'empleado',
            'id_tipo',
	        'incidencia',
	        'tipo_incidencia',
	        'fecha_solicitud',
	        'fecha_inicio',
	        'fecha_fin',
	        'duracion',
	        'monto',
	        'motivo',
            'capital_id',
            'descripcion_razon',
            'id_empleado',
	        'solicitante',
	        'periodo_nombre'
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
        if ($this->periodo != 0)
            $models->where('id_periodo',$this->periodo);
        if ($this->estatus != 'TODAS')
            $models->where('estatus','=',$this->estatus);
        $models = $models->get();
        return collect($models);
    }

    public function headings(): array
    {
        $array = [
            'ID',
            'NUMERO EMPLEADO',
            'EMPLEADO',
            'ID INCIDENCIA',
            'INCIDENCIA',
            'TIPO INCIDENCIA',
            'FECHA DE SOLICITUD',
            'FECHA DE INICIO DE INCIDENCIA',
            'FECHA DE FIN DE INCIDENCIA',
            'DURACION',
            'MONTO',
            'MOTIVO',
            'ID RAZON SOCIAL',
            'RAZON SOCIAL',
            'ID EMPLEADO INCORE',
            'SOLICITANTE',
            'PERIODO'
        ];
        return $array;
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
