<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Coordinador
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Coordinador newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Coordinador newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Coordinador query()
 * @mixin \Eloquent
 */
class Coordinador extends Model
{
    protected $connection = 'incore';
    protected $table      = 'catalogo_coordinadores';
}
