<?php

Route::get('/', 'AltasController@index')->name('index.index');

/*
 * Rutas para cada uno de los controladores mantenerlas separadas y con un prefijo para una mejor gestion e identificacion.
 */

// Agrupar rutas para las altas y verificar la autenticación
Route::group(["prefix" => "altas", "middleware" => ["auth"]], function() {
    Route::get('/', 'AltasController@index')->name('altas.index');
    Route::get('/create', 'AltasController@create')->name('altas.create');
    Route::get('/dar_baja', 'AltasController@darBaja')->name('altas.dar_baja');
    Route::post('/get_solicitud', 'AltasController@getSolicitud')->name('altas.get_solicitud');
    Route::post('/store', 'AltasController@store')->name('altas.store');
    Route::post('/autorizar_solicitud', 'AltasController@AutorizarSolicitud')->name('altas.autorizar_solicitud');
    Route::get('/get_bitacora_alta', 'AltasController@getBitacoraAlta')->name('altas.get_bitacora_alta');
    Route::get('/edit', 'AltasController@edit')->name('altas.edit');
    Route::put('/update', 'AltasController@update')->name('altas.update');
    Route::get('/update_solicitud/{id}', 'AltasController@updateSolicitud')->name('altas.update_solicitud');
    Route::post('/agendar_cita_firma', 'AltasController@AgendarCitaFirma')->name('altas.agendar_cita_firma');
    Route::get('/get_coordinadores', 'AltasController@getCoordinadores')->name('altas.get_coordinadores');
    Route::get('/aprobar', 'AltasController@aprobar')->name('altas.aprobar');
    Route::post('/aprobar_dir', 'AltasController@autorizarDireccion')->name('altas.aprobar_dir');
});

Route::group(["prefix" => "ajuste", "middleware" => ["auth"]], function() {
    Route::get('/', 'AjustesController@index')->name('ajuste.index');
    Route::post('/save', 'AjustesController@save')->name('ajuste.save');
    Route::post('/edit', 'AjustesController@edit')->name('ajuste.edit');
    Route::post('/delete', 'AjustesController@delete')->name('ajuste.delete');
    Route::post('/send', 'AjustesController@send')->name('ajuste.send');
    Route::get('/autorizar', 'AjustesController@autorizar')->name('ajuste.autorizar');
    Route::get('/validar', 'AjustesController@validar')->name('ajuste.validar');
    Route::post('/save_aprobar', 'AjustesController@saveAprobar')->name('ajuste.save_aprobar');
    Route::post('/validar_ajuste', 'AjustesController@validarAjuste')->name('autorizar.validar_ajuste');
});

Route::group(["prefix" => "asignacion", "middleware" => ["auth"]], function() {
    Route::get('/', 'AsignacionHerramientasController@index')->name('asignacion.index');
    Route::get('/computo', 'AsignacionHerramientasController@getComputo')->name('asignacion.computo');
    Route::get('/cel_lineas', 'AsignacionHerramientasController@getCelularesLineas')->name('asignacion.cel_lineas');
    Route::get('/auto', 'AsignacionHerramientasController@getAutos')->name('asignacion.auto');
    Route::get('/herramientas', 'AsignacionHerramientasController@getHerramientas')->name('asignacion.herramientas ');
});

Route::group(["prefix" => "autorizacion", "middleware" => ["auth"]], function() {
    Route::get('/', 'AutorizacionesController@index')->name('autorizacion.index');
});

Route::group(["prefix" => "autorizar", "middleware" => ["auth"]], function() {
    Route::get('/', 'AutorizarController@index')->name('autorizar.index');
    Route::get('/get_incidencias_lote', 'AutorizarController@getIncidenciasLote')->name('autorizar.get_incidencias_lote');
    Route::get('/get_bitacora_incidentes', 'AutorizarController@getBitacoraIncidentes')->name('autorizar.get_bitacora_incidentes');
    Route::post('/auth_incidencia', 'AutorizarController@AuthIncidencia')->name('autorizar.auth_incidencia');
    Route::post('/vobo_final', 'AutorizarController@voboFinal')->name('autorizar.vobo_final');
    Route::get('/finalizadas', 'AutorizarController@finalizadas')->name('envio_incidencias.finalizadas');
});

Route::group(["prefix" => "bajas", "middleware" => ["auth"]], function() {
    Route::get('/', 'BajasController@index')->name('bajas.index');
    Route::get('/get_data_bajas', 'BajasController@getDataBajas')->name('bajas.get_data_bajas');
    Route::post('/eliminar_solicitud/{id}', 'BajasController@EliminarSolicitud')->name('bajas.eliminar_solicitud');
    Route::post('/baja_def_nom', 'BajasController@bajaDefNom')->name('bajas.baja_def_nom');
    Route::get('/get_bitacora_baja', 'BajasController@getBitacoraBaja')->name('bajas.get_bitacora_baja');
    Route::get('/autorizar_solicitud', 'BajasController@AutorizarSolicitud')->name('bajas.autorizar_solicitud');
    Route::post('/solicitud_baja', 'BajasController@solicitudBaja')->name('bajas.solicitud_baja');
    Route::get('/get_sol_baja', 'BajasController@getSolBaja')->name('bajas.get_sol_baja');
    Route::get('/get_estatus_baja', 'BajasController@getEstatusBaja')->name('bajas.get_estatus_baja');
    Route::post('/get_baja', 'BajasController@getBaja')->name('bajas.get_baja');
    Route::post('/save_cita', 'BajasController@saveFechaCita')->name('bajas.save_cita');
    Route::post('/baja_compu', 'BajasController@bajaComputo')->name('bajas.baja_compu');
    Route::post('/baja_celu', 'BajasController@bajaCel')->name('bajas.baja_celu');
    Route::post('/baja_auto', 'BajasController@bajaAuto')->name('bajas.baja_auto');
    Route::post('/baja_herra', 'BajasController@bajaHerra')->name('bajas.baja_herra');
    Route::post('/baja_cred', 'BajasController@bajaCred')->name('bajas.baja_cred');
    Route::post('/pago_fin', 'BajasController@pagoFin')->name('bajas.pago_fin');
});

Route::group(["prefix" => "incidentes", "middleware" => ["auth"]], function() {
    Route::get('/', 'CatalogoIncidentesControler@index')->name('incidentes.index');
    Route::get('/create', 'CatalogoIncidentesControler@create')->name('incidentes.create');
    Route::get('/store', 'CatalogoIncidentesControler@store')->name('incidentes.store');
});

Route::group(["prefix" => "configuracion", "middleware" => ["auth"]], function() {
    Route::get('/', 'ConfiguracionController@index')->name('configuracion.index');
    Route::post('/funcion_codigos', 'ConfiguracionController@funcionCodigos')->name('configuracion.funcion_codigos');
    Route::post('/funciones_codigos', 'ConfiguracionController@FuncionesCodigos')->name('configuracion.funciones_codigos');
    Route::post('/funcion_proyectos_wbs', 'ConfiguracionController@funcionProyectosWBS')->name('configuracion.funcion_proyectos_wbs');
});

Route::group(["prefix" => "configuracion", "middleware" => ["auth"]], function() {
    Route::get('/', 'ConfiguracionController@index')->name('configuracion.index');
    Route::get('/funcion_codigos', 'ConfiguracionController@funcionCodigos')->name('configuracion.funcion_codigos');
    Route::get('/funciones_codigos', 'ConfiguracionController@FuncionesCodigos')->name('configuracion.funciones_codigos');
    Route::get('/funcion_proyectos_wbs', 'ConfiguracionController@funcionProyectosWBS')->name('configuracion.funcion_proyectos_wbs');
});

Route::group(["prefix" => "datatables", "middleware" => ["auth"]], function() {
    Route::get('/get_data_altas', 'DatatablesController@getDataAltas')->name('datatables.get_data_altas');
    Route::get('/get_bajas_nom', 'DatatablesController@getBajasNom')->name('datatables.get_bajas_nom');
    Route::get('/get_catalogo_codigos', 'DatatablesController@getCatalogoCodigos')->name('datatables.get_catalogo_codigos');
    Route::get('/get_catalogo_proyectos', 'DatatablesController@getCatalogoProyectos')->name('datatables.get_catalogo_proyectos');
    Route::get('/get_citas_firma', 'DatatablesController@getCitasFirma')->name('datatables.get_citas_firma');
    Route::get('/get_catalogo_coordinador', 'DatatablesController@getCatalogoCoordinador')->name('datatables.get_catalogo_coordinador');
    Route::get('/get_catalogo_planes', 'DatatablesController@getCatalogoPlanes')->name('datatables.get_catalogo_planes');
    Route::get('/get_empleados_criterio', 'DatatablesController@getEmpleadosCriterio')->name('datatables.get_empleados_criterio');
    Route::get('/get_catalogo_wbs', 'DatatablesController@getCatalogoWBS')->name('datatables.get_catalogo_wbs');
    Route::get('/get_data_bajas', 'DatatablesController@getDataBajas')->name('datatables.get_data_bajas');
    Route::get('/get_data_herramientas', 'DatatablesController@getDataHerramientas')->name('datatables.get_data_herramientas');
    Route::get('/get_data_empleados', 'DatatablesController@getDataEmpleados')->name('datatables.get_data_empleados');
    Route::get('/get_data_usuarios', 'DatatablesController@getDataUsuarios')->name('datatables.get_data_usuarios');
    Route::get('/get_incidencias', 'DatatablesController@getIncidencias')->name('datatables.get_incidencias');
    Route::get('/get_incidencias_auth', 'DatatablesController@getIncidenciasAuth')->name('datatables.get_incidencias_auth');
    Route::get('/get_incidencias_finalizadas', 'DatatablesController@getIncidenciasFinalizadas')->name('autorizar.get_incidencias_finalizadas');
    Route::get('/get_incidencias_periodo', 'DatatablesController@getIncidenciasPeriodo')->name('autorizar.get_incidencias_periodo');
    Route::get('/get_data_ajustes', 'DatatablesController@getDataAjustes')->name('autorizar.get_data_ajustes');
    Route::get('/get_vali_ajustes', 'DatatablesController@getValiAjustes')->name('autorizar.get_vali_ajustes');
});

Route::group(["prefix" => "empleados", "middleware" => ["auth"]], function() {
    Route::get('/', 'EmpleadosController@index')->name('empleados.index');
    Route::get('/obtener_empleado', 'EmpleadosController@obtenerEmpleado')->name('empleados.obtener_empleado');
    Route::get('/get_empleado_baja', 'EmpleadosController@getEmpleadoBaja')->name('empleados.get_empleado_baja');
    Route::get('/reingresar_empleado', 'EmpleadosController@ReingresarEmpleado')->name('empleados.reingresar_empleado');
    Route::get('/create', 'EmpleadosController@create')->name('empleados.create');
    Route::post('/get_empleado', 'EmpleadosController@getEmpleado')->name('empleados.get_empleado');
    Route::get('/get_empleado_data/{id}', 'EmpleadosController@getEmpleadoData')->name('empleados.get_empleado_data');
    Route::get('/get_coordinadores', 'EmpleadosController@getCoordinadores')->name('empleados.get_coordinadores');
    Route::get('/get_herramientas_empleado', 'EmpleadosController@getHerramientasEmpleado')->name('empleados.get_herramientas_empleado');
    Route::get('/update_herramientas_empleado', 'EmpleadosController@updateHerramientasEmpleado')->name('empleados.update_herramientas_empleado');
    Route::post('/update_empleado', 'EmpleadosController@updateEmpleado')->name('empleados.update_empleado');
    Route::get('/store', 'EmpleadosController@store')->name('empleados.store');
    Route::post('/baja_empleado', 'EmpleadosController@bajaEmpleado')->name('empleados.baja_empleado');
    Route::get('/get_planes', 'EmpleadosController@getPlanes')->name('empleados.get_planes');
    Route::post('/create_empleado', 'EmpleadosController@createEmpleado')->name('empleados.create_empleado');
    Route::post('/create_sin_sol', 'EmpleadosController@createSinSolicitud')->name('empleados.create_sin_sol');
    Route::get('/exist', 'EmpleadosController@exist')->name('empleados.exist');
    Route::get('/search_empleado', 'EmpleadosController@searchEmpleado')->name('empleados.search_empleado');
    Route::post('/cambio_coord', 'EmpleadosController@cambioCoord')->name('empleados.cambio_coord');
    Route::post('/cambio_sueldo', 'EmpleadosController@cambioSueldo')->name('empleados.cambio_sueldo');
});

Route::group(["prefix" => "envio_incidencias", "middleware" => ["auth"]], function() {
    Route::get('/', 'EnvioIncidenciasController@index')->name('envio_incidencias.index');
    Route::post('/insert_lote', 'EnvioIncidenciasController@InsertLote')->name('envio_incidencias.insert_lote');
    Route::post('/editar', 'EnvioIncidenciasController@editar')->name('envio_incidencias.editar');
    Route::get('/update_incidencia_lote', 'EnvioIncidenciasController@UpdateIncidenciaLote')->name('envio_incidencias.update_incidencia_lote');
});

Route::group(["prefix" => "excel", "middleware" => ["auth"]], function() {
    Route::get('/export_incidencias', 'ExcelController@exportIncidencias')->name('excel.export_incidencias');
    Route::get('/export_incidencias_lote', 'ExcelController@ExportIncidenciasLote')->name('excel.export_incidencias_lote');
    Route::get('/get_incidencia', 'ExcelController@getIncidencia')->name('excel.get_incidencia');
    Route::get('/export_altas/{inicio}/{fin}', 'ExcelController@ExportAltas')->name('excel.export_altas');
    Route::get('/export_empleados/{inicio}/{fin}', 'ExcelController@ExportEmpleados')->name('excel.export_empleados');
    Route::get('/get_empleado', 'ExcelController@getEmpleado')->name('excel.get_empleado');
    Route::get('/get_sol_altas', 'ExcelController@getSolAltas')->name('excel.get_sol_altas');
    Route::get('/excel_usuarios', 'ExcelController@ExcelUsuarios')->name('excel.excel_usuarios');
    Route::get('/excel_incidencias_fin/', 'ExcelController@ExportIncidenciasFin')->name('excel.excel_incidencias_fin');
});

Route::group(["prefix" => "firma_cita", "middleware" => ["auth"]], function() {
    Route::get('/', 'FirmaCitasController@index')->name('firma_cita.index');
    Route::get('/show', 'FirmaCitasController@show')->name('firma_cita.show');
});

Route::group(["prefix" => "emails", "middleware" => ["auth"]], function() {
    Route::get('/contacto', 'FrontController@contacto')->name('firma_cita.contacto');
});

Route::group(["prefix" => "home", "middleware" => ["auth"]], function() {
    Route::get('/', 'HomeController@index')->name('home.index');
});

Route::group(["prefix" => "incidencias", "middleware" => ["auth"]], function() {
    Route::get('/', 'IncidenciasController@index')->name('incidencias.index');
    Route::get('/create', 'IncidenciasController@create')->name('incidencias.create');
    Route::post('/store', 'IncidenciasController@store')->name('incidencias.store');
    Route::get('/get_empleados', 'IncidenciasController@getEmpleados')->name('incidencias.get_empleados');
    Route::get('/get_solicitante', 'IncidenciasController@getSolicitante')->name('incidencias.get_solicitante');
    Route::get('/get_user', 'IncidenciasController@GetUser')->name('incidencias.get_user');
    Route::get('/filtro', 'IncidenciasController@catalogoFiltro')->name('incidencias.filtro');
    Route::get('/get_risk', 'IncidenciasController@getRisk')->name('incidencias.get_risk');
    Route::get('/aprobar', 'IncidenciasController@aprobar')->name('incidencias.aprobar');
    Route::post('/save_aprobar', 'IncidenciasController@saveAprobar')->name('incidencias.save_aprobar');
    Route::post('/delete', 'IncidenciasController@delete')->name('incidencias.delete');
});

Route::group(["prefix" => "mail", "middleware" => ["auth"]], function() {
    Route::get('/store', 'MailController@store')->name('mail.store');
    Route::get('/cita_firma', 'MailController@citaFirma')->name('mail.cita_firma');
    Route::get('/cita_firma', 'MailController@citaFirma')->name('mail.cita_firma');
});

Route::group(["prefix" => "nuevas", "middleware" => ["auth"]], function() {
    Route::get('/', 'NuevasController@index')->name('nuevas.index');
    Route::get('/create', 'NuevasController@create')->name('nuevas.create');
    Route::get('/get_empleados', 'NuevasController@getEmpleados')->name('nuevas.get_empleados');
});

Route::group(["prefix" => "pet_sol", "middleware" => ["auth"]], function() {
    Route::get('/get_planes', 'PeticionesSolicitudesController@getPlanes')->name('pet_sol.get_planes');
    Route::get('/get_codigos_celular', 'PeticionesSolicitudesController@getCodigosCelular')->name('pet_sol.get_codigos_celular');
    Route::get('/get_codigos_celular_dato', 'PeticionesSolicitudesController@getCodigosCelularDato')->name('pet_sol.get_codigos_celular_dato');
    Route::get('/get_codigos_computadora', 'PeticionesSolicitudesController@getCodigosComputadora')->name('pet_sol.get_codigos_computadora');
    Route::get('/get_codigos_software', 'PeticionesSolicitudesController@getCodigosSoftware')->name('pet_sol.get_codigos_software');
    Route::get('/get_codigos_bam', 'PeticionesSolicitudesController@getCodigosBam')->name('pet_sol.get_codigos_bam');
    Route::get('/get_codigos_auto', 'PeticionesSolicitudesController@getCodigosAuto')->name('pet_sol.get_codigos_auto');
    Route::get('/get_codigos_poliza', 'PeticionesSolicitudesController@getCodigosPoliza')->name('pet_sol.get_codigos_poliza');
    Route::get('/get_codigos_sueldo', 'PeticionesSolicitudesController@getCodigosSueldo')->name('pet_sol.get_codigos_sueldo');
    Route::post('/get_coord', 'PeticionesSolicitudesController@getCoord')->name('pet_sol.get_coord');
    Route::post('/calcular_costos_recuros', 'PeticionesSolicitudesController@calcularCostosRecuros')->name('pet_sol.calcular_costos_recuros');
    Route::post('/get_costo_plan', 'PeticionesSolicitudesController@getCostoPlan')->name('pet_sol.get_costo_plan');
});

Route::group(["prefix" => "usuarios", "middleware" => ["auth"]], function() {
    Route::get('/', 'UsuariosController@index')->name('usuarios.index');
    Route::get('/create', 'UsuariosController@create')->name('usuarios.create');
    Route::post('/store', 'UsuariosController@store')->name('usuarios.store');
    Route::post('/dar_baja', 'UsuariosController@darBaja')->name('usuarios.dar_baja');
    Route::get('/get_usuario', 'UsuariosController@getUsuario')->name('usuarios.get_usuario');
    Route::get('/get_permisos', 'UsuariosController@getPermisos')->name('usuarios.get_permisos');
    Route::get('/get_permisos_usuario', 'UsuariosController@getPermisosUsuario')->name('usuarios.get_permisos_usuario');
    Route::post('/guardar_permisos', 'UsuariosController@guardarPermisos')->name('usuarios.guardar_permisos');
    Route::post('/update_usuario', 'UsuariosController@updateUsuario')->name('usuarios.update_usuario');
    Route::get('/get_notificaciones', 'UsuariosController@getNotificaciones')->name('usuarios.get_notificaciones');
    Route::get('/get_notifi_usuario', 'UsuariosController@getNotifiUsuario')->name('usuarios.get_notifi_usuario');
    Route::post('/update_notificaciones', 'UsuariosController@updatenotificaciones')->name('usuarios.update_notificaciones');
    Route::get('/exist_user', 'UsuariosController@existUser')->name('usuarios.exist_user');
});

Route::group(["prefix" => "wbs", "middleware" => ["auth"]], function() {
    Route::post('/get_wbs', 'WbsController@getWbs')->name('wbs.get_wbs');
});

Route::group(["prefix" => "pass", "middleware" => []], function() {
    Route::get('/', 'NewPasswordController@index')->name('pass.index');
    Route::post('/update', 'NewPasswordController@update')->name('pass.update');
});

Route::get('/files/{path}/{folder}/{file}', 'FileController@export')->name('file.export');

Route::get('/ExcelUsuarios', 'ExcelController@ExcelUsuarios');

//DATATABLES ALTAS.INDEX
/*Route::get('/getDataUsuarios','DatatablesController@getDataUsuarios')->name('datatables.data');*/
Route::get('/getDataAltas','DatatablesController@getDataAltas')->name('datatables.data');
Route::get('/getDataEmpleados','DatatablesController@getDataEmpleados')->name('datatables.data');
Route::get('/getDataBajas','DatatablesController@getDataBajas')->name('datatables.data');
Route::get('/getDataHerra','DatatablesController@getDataHerramientas')->name('datatables.data');

Route::get('/getEmpleadosCriterio/{id}','DatatablesController@getEmpleadosCriterio')->name('datatables.data');

Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');

Route::resource('mail', 'MailController' , ['only' => ['index','store','edit','update','destroy']]);
Route::get('/emails','FrontController@contacto');


Route::get('/obtener_empleado/{id}','EmpleadosController@obtenerEmpleado');
Route::get('/exist_empleado','EmpleadosController@exist');
Route::get('/exist_baja','BajasController@getEstatusBaja');

Route::group(["prefix" => "capital", "middleware" => ["auth"]], function (){
    Route::get('/actualizar_empleados','WebServicesController@actualizarEmpleados')->name('capital.empleados');
    Route::get('/consultar_empleados','WebServicesController@getEmpleados')->name('capital.consultar');
    Route::get('/especifico','WebServicesController@getEspecifico')->name('capital.especifico');
    Route::get('/get_lote','WebServicesController@getLote')->name('capital.get_lote');
});

/* URL's de prueba para crear risk orders estan harcodeados los datos en el controlador */
Route::get('/task_based','WbsController@taskBased')->name('wbs.task_based');
Route::get('/renta_etl','WbsController@rentaEtl')->name('wbs.renta_etl');
Route::get('/poliza','WbsController@poliza')->name('wbs.poliza');
Route::get('/venta_ro','WbsController@calcularVentaRo')->name('wbs.venta_ro');
Route::get('/enviar_alta','WbsController@enviarAlta')->name('wbs.enviar_alta');

Route::group(["prefix" => "imper"], function (){
    Route::get('/get_users', 'ImpersonateController@getUsers')->name('imper.get_users');
    Route::get('/impersonate', 'ImpersonateController@impersonate')->name('imper.create');
    Route::get('/stop', 'ImpersonateController@stopImpersonate')->name('imper.invalidate');
});