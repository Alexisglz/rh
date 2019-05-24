<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\CatalogoNokiaCodigo
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatalogoNokiaCodigo newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatalogoNokiaCodigo newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CatalogoNokiaCodigo query()
 * @mixin \Eloquent
 */
class CatalogoNokiaCodigo extends Model
{
    protected $connection = 'incore';
    protected $table      = 'catalogo_nokia_codigos';
    public $timestamps    = false;
}
