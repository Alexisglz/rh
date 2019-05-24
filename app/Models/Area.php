<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Area
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Area newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Area newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Area query()
 * @mixin \Eloquent
 */
class Area extends Model
{
    protected $connection = 'incore';
    protected $table      = 'catalogo_areas';
    public $timestamps    = false;
}
