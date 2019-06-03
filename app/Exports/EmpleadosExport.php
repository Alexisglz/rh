<?php

namespace App\Exports;

use App\Models\VistaEmpleadosActivos;
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
     * @var int
     */
    public $ver_sueldo;

    /**
     * EmpleadosExport constructor.
     * @param $ini
     * @param $fin
     */
    public function __construct($ini, $fin)
    {
        $this->ini = $ini;
        $this->fin = $fin;
        $this->ver_sueldo = auth()->user()->can('access',[\App\User::class,'ver_sueldo'])? 1:0;
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
        $usuario    = auth()->user();
        $models     = VistaEmpleadosActivos::query();
        if ($usuario->listarTodo == null){
            if ($usuario->getCoordinador){
                $this->recursivoEmpleados($usuario->id_usuario);
                $emps = array_values(array_unique($this->array));
                $models->whereIn('id', $emps);
            }
        }
        $campos = [
            'id','empleado_num','empleado_apaterno','empleado_amaterno','empleado_nombre','proyecto','pd','calle','num_exterior','num_interior',
            'colonia','municipio','cp','estado','nss','curp','rfc','mail','telefono','telefono2','empresa','coordinador','puesto',
            'segmento','esquema','num_cuenta','clabe','banco','esquema_viaticos'
        ];
        if ($this->ver_sueldo == 1){
            $campos[] = 'sueldo_imss';
            $campos[] = 'sueldo_asimilado';
        }
        $models->select($campos);
        $models->whereBetween('fecha_ingreso',[$this->ini, $this->fin]);
        $models = $models->get();
        return collect($models);
    }

    public function headings(): array
    {
        $headers = [
            'ID','NUMERO EMPLEADO', 'PATERNO', 'MATERNO', 'NOMBRE', 'PROYECTO','PD','CALLE','NUM EXTERIOR','NUM INTERIOR',
            'COLONIA','MUNICIPIO','CP','ESTADO','NSS','CURP','RFC','MAIL','TELEFONO','TELEFONO 2','EMPRESA','COORDINADOR','PUESTO'
            ,'SEGEMENTO','ESQUEMA','NO. CUENTA', 'CLABE','BANCO','ESQUEMA VIATICOS'
        ];
        if ($this->ver_sueldo == 1){
            $headers[] = 'SUELDO IMSS';
            $headers[] = 'SUELDO ASIMILADO';
        }
        return $headers;
    }
}
