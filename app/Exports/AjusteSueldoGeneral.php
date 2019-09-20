<?php

namespace App\Exports;

use App\Models\VistaAjusteSueldo;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;

class AjusteSueldoGeneral implements FromCollection,WithHeadings,ShouldAutoSize
{

    /**
     * @var string
     */
    private $inicio;
    /**
     * @var string
     */
    private $fin;
    /**
     * @var string
     */
    private $estatus;

    /**
     * AjusteSueldoGeneral constructor.
     * @param string $inicio
     * @param string $fin
     * @param string $estatus
     */
    public function __construct($inicio = '', $fin = '', $estatus = "TODAS")
    {
        $this->inicio  = $inicio;
        $this->fin     = $fin;
        $this->estatus = $estatus;
    }

    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        $models  = VistaAjusteSueldo::query();
        $models->select('id','nombre','num_empleado','tradicional','asimilado','pedido','fecha_inicio','observaciones','fecha');
        if ($this->inicio != '' && $this->fin != '')
            $models->whereBetween('fecha',[$this->inicio.' 00:00:00',$this->fin.' 23:59:59']);
        if ($this->inicio != '' && $this->fin == '')
            $models->where('fecha','>=', $this->inicio.' 00:00:00');
        if ($this->inicio == '' && $this->fin != '')
            $models->where('fecha','<=', $this->fin.' 23:59:59');
        if ($this->estatus != "TODAS")
            $models->where('estatus',$this->estatus);
        $models = $models->get();
        return collect($models);
    }

    public function headings(): array
    {
        return [
            'ID',
            'EMPLEADO',
            'NUMERO EMPLEADO',
            'TRADICIONAL',
            'ASIMILADO',
            'PEDIDO',
            'FECHA INICIO DE SUELDO',
            'OBSERVACIONES',
            'FECHA DE SOLICITUD'
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
