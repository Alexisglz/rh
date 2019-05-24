<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->increments('id_usuario');
            $table->string('nombre')->nullable();
            $table->string('apellido')->nullable();
            $table->string('usuario')->unique();
            $table->string('password')->unique();
            $table->enum('perfil',['ADMIN', 'STAFF']);
            $table->enum('area',['RH','DESARROLLO']);
            $table->string('correo');
            $table->integer('empleado_id')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });

        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->nullable();
            $table->string('email')->nullable();
            $table->string('password')->unique();
            $table->integer('id_area');
            $table->string('edit_pass')->nullable();
            $table->date('fecha_creacion');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usuarios');
        Schema::dropIfExists('users');
    }
}
