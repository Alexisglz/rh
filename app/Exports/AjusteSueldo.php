<?php

namespace App\Exports;

use App\Models\VistaAjusteSueldo;
use DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;

class AjusteSueldo implements FromCollection, WithHeadings, ShouldAutoSize
{

    private $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    public function collection()
    {
        $models  = VistaAjusteSueldo::select('id','nombre','num_empleado','tradicional','asimilado','observaciones','fecha')
            ->where('id','=',$this->id)
            ->get();
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
