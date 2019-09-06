<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\VistaIncidenciasLote
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\VistaIncidencias newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\VistaIncidencias newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\VistaIncidencias query()
 * @mixin \Eloquent
 */
class VistaIncidencias extends Model
{
    protected $table = 'vista_incidencias';

    public function getTableColumns() {
        return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
    }
}
