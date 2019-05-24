<?php

namespace App\Policies;

use App\Permiso;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class UserPolicy
{
    use HandlesAuthorization;

    public function access(User $user, $permiso){
        try{
            $has = Permiso::where('codigo','=', $permiso)->first();
            foreach ($user->getPermisos as $permit){
                if (intval($permit->id_permiso) === intval($has->id)) return true;
            }
            return false;
        }catch (\Exception $e){
            return false;
        }
    }
}
