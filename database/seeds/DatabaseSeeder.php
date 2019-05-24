<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        $this->call(CatalogosWBS::class);
        $this->call(incidenciasTipos::class);
        factory(\App\User::class,1)->create([
            'name'           => 'ADMIN',
            'email'          => 'admin@admin.com',
            'password'       => bcrypt('123123'),
            'id_area'        => 1,
            'edit_pass'      => 'ADMIN',
            'fecha_creacion' => date('Y-m-d'),
        ]);
    }
}
