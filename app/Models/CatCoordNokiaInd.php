<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\CatCoordNokiaInd
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatCoordNokiaInd newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatCoordNokiaInd newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatCoordNokiaInd query()
 * @mixin \Eloquent
 */
class CatCoordNokiaInd extends Model
{
    protected $connection = 'incore';
    protected $table      = 'catalogo_coordinadores_nokia_indeplo';
    public $timestamps    = false;
}
