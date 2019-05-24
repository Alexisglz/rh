<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\WBS
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\WBS newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\WBS newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\WBS query()
 * @mixin \Eloquent
 */
class WBS extends Model
{
    protected $connection = 'incore';
    protected $table      = 'catalogo_wbs';
}
