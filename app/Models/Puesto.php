<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Puesto
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Puesto newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Puesto newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Puesto query()
 * @mixin \Eloquent
 */
class Puesto extends Model
{
    protected $connection = 'incore';
    protected $table      = 'catalogo_puesto';
    public $timestamps    = false;
}
