<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\CatalogoRazonRH
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatalogoRazonRH newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatalogoRazonRH newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatalogoRazonRH query()
 * @mixin \Eloquent
 */
class CatalogoRazonRH extends Model
{
    protected $connection            = 'incore';
    protected $table                 = 'catalogo_razonrh';
    protected $primaryKey            = 'razon_id';
    protected $connectionsToTransact = ['incore'];
    public $timestamps               = false;

    public function getRazonCapital(){
        return $this->hasOne(CatalogoRazonCapital::class, 'id', 'id_razon_capital');
    }
}
