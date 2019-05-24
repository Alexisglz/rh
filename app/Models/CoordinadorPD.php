<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\CoordinadorPD
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CoordinadorPD newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CoordinadorPD newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\CoordinadorPD query()
 * @mixin \Eloquent
 */
class CoordinadorPD extends Model
{
    protected $connection = 'incore';
    protected $table      = 'coordinadores_project_definition';
    public $timestamps    = false;
}
