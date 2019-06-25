<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');*/

/****USUARIOS CON ROLES****/
	// Ruta para borrar usuario
	Route::post('/eliminarUsuario/{id}', 'UsuariosController@darBaja');
	// Ruta para obtener usuario
	Route::post('/getUsuario/{id}', 'UsuariosController@getUsuario');
	// Ruta para actualizar usuario
	Route::post('/updateUsuario/{id}', 'UsuariosController@updateUsuario');

/****/

/****SOLICITUDES DE ALTA****/
	// Ruta para eliminar alta
	Route::post('/darBajaCliente/{id}', 'AltasController@darBaja');
	// Ruta para obener id solicitud
	Route::post('/getSolicitud/{id}', 'AltasController@getSolicitud');
	// Ruta para actualizar solicitud
	Route::post('/updateSolicitud/{id}', 'AltasController@updateSolicitud');
	// Ruta para darle check de autorizacion solicitud
	Route::post('/autorizarCheckSolicitud', 'AltasController@AutorizarSolicitud');
	// Ruta para colocar cita a una solicitud de alta
	Route::post('/agendarcita', 'AltasController@AgendarCitaFirma');
/****/


/****EMPLEADOS****/
	// Ruta para obtener id empleado
	Route::post('/getEmpleado', 'EmpleadosController@getEmpleado');
	// Ruta para obtener un empleado
	Route::get('/getEmpleadoData/{id}', 'EmpleadosController@getEmpleadoData');
	// Ruta para actualizar datos del empleado
	Route::post('/updateEmpleado/{id}', 'EmpleadosController@updateEmpleado');
	// Ruta para dar de baja datos del empleado
	Route::post('/bajaempleado', 'EmpleadosController@bajaEmpleado');
	// Ruta para obtener los planes
	Route::get('/empleados_planes', 'EmpleadosController@getPlanes');
	// Ruta para obtener las herramientas de un emplleado
	Route::get('/empleados_herramientas/{id}', 'EmpleadosController@getHerramientasEmpleado');
	// Ruta para actualizar las herramientas de un emplleado
	Route::post('/updateherramientas', 'EmpleadosController@updateHerramientasEmpleado');
	// Ruta para obtener la lista de coordinadores
	Route::get('/getCoordinadores', 'EmpleadosController@getCoordinadores');
	// Ruta para crear un empleado
	Route::post('/createEmpleado', 'EmpleadosController@createEmpleado');
/****/

	/****Solicitudes de baja****/
	// Ruta para eliminar baja
	Route::post('/getDatabajas/{id}', 'BajasController@getDatabajas');
	// Ruta para eliminar solicitud baja
	Route::post('/EliminarSolicitud/{id}', 'BajasController@EliminarSolicitud');
	// Ruta para obtener id baja definifita
	Route::post('/getEmpleadoBaja', 'BajasController@getEmpleadoBaja');
	



	Route::post('/getBitacoraIncidentes/{id}','AutorizarController@getBitacoraIncidentes');
	Route::post('/AutIncidencia','AutorizarController@AuthIncidencia');
	Route::post('/mail','MailController@store');
	Route::post('/citaFirma','MailController@citaFirma');


	 
     Route::post('/EnvioIncidencias', 'EnvioIncidenciasController@InsertLote');
	Route::post('/UpdateIncidenciaLote', 'EnvioIncidenciasController@UpdateIncidenciaLote');

	


	//Route::post('/mail', 'MailController' , ['only' => ['index','store','edit','update','destroy']]);
	// Ruta para obtener los planes
	Route::post('/solicitudbaja', 'BajasController@solicitudBaja');
	// Ruta para traer los datos de view baja
	Route::post('/getSolBaja/{id}', 'BajasController@getSolBaja');


	
	Route::post('/bajaDefNom', 'BajasController@bajaDefNom');
	
	Route::post('/funcionCodigos', 'ConfiguracionController@funcionCodigos');
	Route::post('/FuncionesCodigos', 'ConfiguracionController@FuncionesCodigos');
	Route::post('/funcionProyectosWBS', 'ConfiguracionController@funcionProyectosWBS');
	Route::post('/notificacion', 'UsuariosController@updateNotificaciones');

	Route::post('/getEmpleadoBaja', 'EmpleadosController@getEmpleadoBaja');
	Route::post('/ReingresarEmpleado', 'EmpleadosController@ReingresarEmpleado');



	
