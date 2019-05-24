<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\PlanesLineas
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\PlanesLineas newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\PlanesLineas newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\PlanesLineas query()
 * @mixin \Eloquent
 */
class PlanesLineas extends Model
{
    protected $connection = 'incore';
    protected $table      = 'catalogo_planes_lineas';
}
