<?php

namespace App\Exports;

use App\VistaIncidencias;
use DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;

class IncidenciasFinExport implements FromCollection, WithHeadings, ShouldAutoSize, WithEvents
{

    public $sql;

    /**
     * IncidenciasFinExport constructor.
     * @param $sql
     */
    public function __construct($sql)
    {
        $this->sql = $sql;
    }

    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        $query = DB::select(DB::raw(strval($this->sql)));
        return collect($query);
    }

    /**
     * @return array
     */
    public function registerEvents(): array
    {
        return [];
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        $columns = new VistaIncidencias();
        $columns = $columns->getTableColumns();
        $headings = [];
        foreach ($columns as $column){
            if ($column == 'emp_id')
                $column = 'numero_empleado';
            $text = strtoupper($column);
            $text = str_replace('_',' ',$text);
            $headings[] = $text;
        }
        return $headings;
    }
}
