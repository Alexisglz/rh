<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\DirectorArea
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\DirectorArea newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\DirectorArea newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\DirectorArea query()
 * @mixin \Eloquent
 */
class DirectorArea extends Model
{
    protected $connection = 'mysql';
    protected $table = 'directores_areas';
}
