<?php

namespace App\Console;

use App\Console\Commands\IncidenciasCommand;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        IncidenciasCommand::class
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->command('queue:work')
            ->cron('* * * * *')
            ->withoutOverlapping(); /*Desactivado por que el server de pruebas esta muy limitado */
        /*$schedule->command('incidencias:cancelar')->cron('00 03 * * *'); //Cron para cancelar incidencias vencidas */
    }

    /**
     * Register the Closure based commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        require base_path('routes/console.php');
    }
}
