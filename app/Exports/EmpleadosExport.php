<?php

namespace App\Exports;

use App\Models\VistaEmpleadosExcel;
use App\User;
use DB;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;

class EmpleadosExport implements FromCollection, WithHeadings, ShouldAutoSize, WithEvents
{
    use Exportable;
    public $ini;
    public $fin;
    public $array;

    /**
     * EmpleadosExport constructor.
     * @param $ini
     * @param $fin
     */
    public function __construct($ini, $fin)
    {
        $this->ini = $ini;
        $this->fin = $fin;
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

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function(AfterSheet $event) {
                $cellRange = 'A1:W1';
                /*$event->sheet->getStyle($cellRange)->getFill()
                    ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                    ->getStartColor()->setARGB('FFFFFFFF');*/
            },
        ];
    }

    public function collection()
    {
        $usuario = auth()->user();
        $models  = VistaEmpleadosExcel::query();
        if ($usuario->listarTodo == null){
            if ($usuario->getCoordinador){
                $this->recursivoEmpleados($usuario->id_usuario);
                $emps = array_values(array_unique($this->array));
                $models->whereIn('id', $emps);
            }
        }
        $models->select(
                'id','empresa','empleado_apaterno','empleado_amaterno','empleado_nombre','municipio','curp','rfc',
                'calle','num_exterior','num_interior','cp','colonia','mun','estado','telefono','telefono2','mail',
                'nss','fecha_ingreso','zona','tipo_contrato','puesto','area'
            );
        $models->whereBetween('fecha_ingreso',[$this->ini, $this->fin]);
        $models = $models->get();
        return collect($models);
    }

    public function headings(): array
    {
        return [
            'ID','EMPRESA', 'PATERNO', 'MATERNO', 'NOMBRE', 'LUGAR_NACIMIENTO',
            'CURP', 'RFC', 'CALLE', 'NUMEROEXTERIOR', 'NUMEROINTERIOR', 'CP', 'COLONIA', 'DELEGACION_MUNICIPIO',
            'ENTIDAD_FEDERATIVA', 'TELEFONO', 'CELULAR', 'EMAIL', 'NSS',
            'FECHA_INGRESO', 'ZONA', 'TIPO_CONTRATO', 'PUESTO_TRADICIONAL', 'AREA'
        ];
    }
}
