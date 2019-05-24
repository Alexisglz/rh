<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Localidad
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Localidad newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Localidad newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Localidad query()
 * @mixin \Eloquent
 */
class Localidad extends Model
{
    protected $connection = 'incore';
    protected $table      = 'catalogo_localidades';
    public $timestamps    = false;
}
