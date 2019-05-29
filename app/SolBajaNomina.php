<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * App\SolBajaNomina
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\SolBajaNomina newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\SolBajaNomina newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\SolBajaNomina query()
 * @mixin \Eloquent
 * @method static bool|null forceDelete()
 * @method static \Illuminate\Database\Query\Builder|\App\SolBajaNomina onlyTrashed()
 * @method static bool|null restore()
 * @method static \Illuminate\Database\Query\Builder|\App\SolBajaNomina withTrashed()
 * @method static \Illuminate\Database\Query\Builder|\App\SolBajaNomina withoutTrashed()
 */
class SolBajaNomina extends Model
{
    use SoftDeletes;
    protected $table = 'solicitudes_baja_nomina';
    protected $dateFormat = 'Y-m-d H:i:s';
}
