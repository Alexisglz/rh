<?php

namespace App\Providers;

use Illuminate\Support\Facades\Event;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        \App\Events\AltaEvents::class => [
            \App\Listeners\EnviarCorreos::class,
        ],
        \App\Events\IncidenciasEvents::class => [
            \App\Listeners\EnviarCorreosInci::class,
        ],
        \App\Events\EmpleadosEvents::class => [
            \App\Listeners\EnviarCorreosEmp::class,
        ],
        \App\Events\BajasEvents::class => [
            \App\Listeners\EnviarCorreosBajas::class,
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }
}
