@extends('layouts.admin')

@section('contenido')


{!! Form::model($solicitud_temp, ['id'=>'formulario_solicitud_update','route'=>['altas.update', $solicitud_temp->id],'method'=>'PUT','files'=>true,'enctype'=>"multipart/form-data"]) !!}

@foreach( $costos AS $costo )
	@php
		$tipo = "";
		$valor = "";
		foreach( $costo AS $key => $value ) {
			if ( $key == "tipo" ) {
				$tipo = $value;
			} else if ( $key == "costo" ) {
				$valor = $value;
			}
		}
	@endphp
	{!! Form::hidden('costo_'.$tipo.'_incore', $valor, ['class' => 'form-control','id'=>'costo_'.$tipo.'_incore']) !!}
@endforeach




<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			@if ( $errors->any() )
				<div class="alert alert-danger text-center" role="alert">
					@foreach ( $errors->all() as $error ) 
					<strong>{{ $error }}</strong><br>
					@endforeach
				</div>
			@endif
			<input type="number" name="id_user" value="{{auth()->user()->id_usuario}}" id="id_user" hidden="true">
 <input type="number" class="form-control" hidden="true" name="id_solicitud" value="{{$solicitud_temp->id}}" id="id_solicitud"  style="width: 50px;display: inline-block;text-align: center;">

			<!-- interactive chart -->
			<p class="h4">Solicitud de alta</p>
			<div class="card card-primary card-outline">
				<div class="card-header">
					<h3 class="card-title">
					<i class="fa fa-plus"></i>
					WBS
					</h3>
				</div>
				<div class="card-body">
					<div class="form-inline" id="c_wbs">
						{!! Form::token() !!}
						<div class="col-md-1 hidden-sm hidden-xs">
						</div>
						<div class="col-md-2 text-center" style="text-align: center;">
							<input type="text" class="form-control" style="text-align: center;" disabled="true" name="cliente" value="{{$solicitud_temp->cliente}}" id="cliente">
						
					
						</div>
						<div class="col-md-2 text-center" style="text-align: center;">
							<input type="text" class="form-control" style="text-align: center;" disabled="true" name="servicio" value="{{$solicitud_temp->servicio}}" id="servicio">
						</div>
						<div class="col-md-2 text-center" style="text-align: center;">
							<input type="text" class="form-control" style="text-align: center;" disabled="true" name="region" value="{{$solicitud_temp->region}}" id="region">
						</div>
						<div class="col-md-2 text-center" style="text-align: center;">
							<input type="text" class="form-control" style="text-align: center;" disabled="true" name="tecnologia" value="{{$solicitud_temp->tecnologia}}" id="tecnologia">
						</div>
						<div class="col-md-2 text-center" style="text-align: center;">
							<input type="text" class="form-control" style="text-align: center;" disabled="true" name="grupo" value="{{$solicitud_temp->grupo}}" id="grupo">
						</div>
					</div>
					<hr>
						<div id="wbs_completa" class="h3 text-center"></div>
					<hr>
				</div>
			</div>

			<div class="card card-primary card-outline">
				<div class="card-header">
					<h3 class="card-title">
					<i class="fa fa-plus"></i>
					Datos
					</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							{!! Form::label('nombre', 'Nombre: ') !!}
    						{!! Form::text('nombre', null, ['class' => 'form-control req_common']) !!}

    						{!! Form::label('apaterno', 'Apellido paterno: ') !!}
    						{!! Form::text('apaterno', null, ['class' => 'form-control req_common']) !!}

    						{!! Form::label('amaterno', 'Apellido materno: ') !!}
    						{!! Form::text('amaterno', null, ['class' => 'form-control req_common']) !!}

    						{!! Form::label('cv', 'C.V. recurso: '); !!}
    						<br>
    						{!! Form::file('cv') !!}
						</div>
						<div class="col-md-6">
							
							<!--{!! Form::label('puesto', 'Puesto: ') !!}
    						{!! Form::text('puesto', null, ['class' => 'form-control req_common']) !!}-->
							
							{!! Form::label('puesto', 'Puesto') !!}
				            {!! Form::select('puesto',$puestos,null,['class'=>'form-control req_nok','id'=>'puesto','style'=>'width: 100%;','value'=>$solicitud_temp->puesto]) !!}

							{!! Form::label('area', 'Area') !!}
							{!! Form::select('area',$areas,null,['class'=>'form-control req_nok','id'=>'area','style'=>'width: 100%;','value'=>$solicitud_temp->area]) !!}

    						{!! Form::label('fecha_inicio', 'Fecha de inicio:') !!}
    						{!! Form::text('fecha_inicio', $solicitud_temp->fecha_inicio, ['class' => 'form-control req_common']) !!}

    						
    							@php
									$esquemas = [
										'0'=>'SELECCIONE',
										'1'=>'NORMAL',
										'2'=>'TASK BASED',
										'3'=>'RENTA FIJA',
										'4'=>'ETL',
										'6'=>'POLIZA',
										'7'=>'RENTA FIJA',
									];
								@endphp
								{!! Form::label('esquemas', 'Esquema: ') !!}
								{!! Form::select('esquemas',$esquemas, $solicitud_temp->tipo_proyecto,['class'=>'form-control req_nok','id'=>'esquemas','style'=>'width: 100%;']) !!}
    							
    						<!--div id="temporalidad_contrato_div">
								
								@php 
									$temps_contrato = [
										'0'=>'SELECCIONE',
										'1'=>'1 MES',
										'2'=>'3 MESES',
										'3'=>'1 AÑO',
										'4'=>'3 AÑOS'
									];
								@endphp
								{!! Form::label('temporalidad_contrato', 'Temporalidad de contrato: ') !!}
								{!! Form::select('temporalidad_contrato',$temps_contrato,null,['class'=>'form-control req_nok','id'=>'temporalidades_contrato','style'=>'width: 100%;']) !!}
								
    			        	</div-->		
						
						</div>
						
					</div>
				</div>
			</div>

			<div class="card card-primary card-outline  " id="venta_esperada_div" >
				<div class="card-header">
					<h3 class="card-title">
					<i class="fa fa-plus"></i>
					Venta esperada
					</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<div id="esq_task" class=" ">
								{!! Form::label('sueldo_venta', 'Monto de venta: ') !!}
	    						{!! Form::text('sueldo_venta', $solicitud_temp->sueldo_venta, ['class' => 'form-control req_nok' ,'id'=>'sueldo_venta']) !!}
	    					</div>
	    					<div id="esq_poliza" class=" ">
		    					<div class="row">
		    						<div class="col-md-6">
		    							{!! Form::label('codigo_poliza', 'Codigo Póliza: ') !!}
		    						</div>
		    						<div class="col-md-6">
		    							{!! Form::text('codigo_poliza',$solicitud_temp->sueldo_venta , ['class' => 'form-control','id'=>'codigo_poliza']) !!}
		    						</div>
		    					</div>
		    					<br>
								<div class="row">
		    						<div class="col-md-6">
		    							{!! Form::label('sueldo_venta', 'Monto de venta: ') !!}
		    						</div>
		    						<div class="col-md-6" id="sueldo_venta_div">
			    						@php
			    							/*{!! Form::text('sueldo_venta', null, ['class' => 'form-control','id'=>'sueldo_venta']) !!}*/
			    						@endphp
		    						</div>
		    					</div>
		    					<br>
								<div class="row">
		    						<div class="col-md-6">
		    							{!! Form::label('Venta de la poliza: ') !!}
		    						</div>
		    						<div class="col-md-6">
		    							{!! Form::label('','',['id'=>'costo_pol']) !!}
		    						</div>
		    					</div>
		    					@php
		    					/*
		    					<div class="row">
		    						<div class="col-md-6">
		    							{!! Form::label('Cantidad actual de recursos dentro de la poliza: ') !!}
		    						</div>
		    						<div class="col-md-6">
		    							{!! Form::label('','',['id'=>'cantidad_pol']) !!}
		    						</div>
		    					</div>
		    					*/
		    					@endphp
		    					<div class="row">
		    						<div class="col-md-6">
		    							{!! Form::label('Cantidad de recursos asignada a esta póliza: ') !!}
		    						</div>
		    						<div class="col-md-6">
		    							{!! Form::label('','',['id'=>'cantidad_pol_inc']) !!}
		    						</div>
		    					</div>
	    						
	    					</div>
						</div>
					</div>
				</div>
			</div>

			<div class="card card-primary card-outline">
				<div class="card-header">
					<h3 class="card-title">
					<i class="fa fa-plus"></i>
					Sueldo
					</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							@php
								$esquema_sueldos = [
									'TRADICIONAL'=>'TRADICIONAL',
									'ASIMILADO'=>'ASIMILADO',
									'EFECTIVO'=>'EFECTIVO',
									'VIATICOS'=>'VIATICOS',
								];
							@endphp
							{!! Form::label('esquema', 'Esquema de contratación: ') !!}
							{!! Form::select('esquema', $esquema_sueldos, null,['class'=>'form-control select_esquema req_common','id'=>'esquema','placeholder'=>'SELECCIONE','style'=>'width: 100%;']) !!}
							
						</div>

						<div class="col-md-6">
							@php
								$trabajo_riesgo = [
									'1'=>'RIESGO 1',
									'2'=>'RIESGO 2',
									'3'=>'RIESGO 3',
									'4'=>'RIESGO 4',
									'5'=>'RIESGO 5',
								];
							@endphp
							{!! Form::label('riesgo', 'Trabajo de riesgo: ') !!}
							{!! Form::select('riesgo',$trabajo_riesgo, null,['class'=>'form-control req_common','id'=>'riesgo','placeholder'=>'SELECCIONE','style'=>'width: 100%;']) !!}
							
						</div>
						<div class="clearfix"></div>
						<div id="codigo_sueldo_div" class="  col-md-6">
							{!! Form::label('codigo_sueldo', 'Código Facturación de Salario Venta: ') !!}
    						{!! Form::text('codigo_sueldo', null, ['class' => 'form-control','id'=>'codigo_sueldo']) !!}
						</div>

						<div id="sueldo_venta_c_div" class="  col-md-6">
							{!! Form::label('sueldo_venta_c', 'Total Facturación de Salario Venta: ') !!}
    						{!! Form::text('sueldo_venta_c', null, ['class' => 'form-control','id'=>'sueldo_venta_c']) !!}
						</div>
						<div class="clearfix"></div>
						<div id="v_imss" class="  col-md-6">
							{!! Form::label('sueldo_imss', 'Sueldo IMSS: ') !!}
    						{!! Form::text('sueldo_imss', null, ['class' => 'form-control req_common']) !!}
						</div>

						<div id="v_variable" class="  col-md-6">
							{!! Form::label('sueldo_variable', 'Sueldo Variable: ') !!}
    						{!! Form::text('sueldo_variable', null, ['class' => 'form-control']) !!}
						</div>
						<br>
						<div class="clearfix"></div>
						<br>
						<div class="col-md-6  " id="costo_nomina_div">
							{!! Form::label('costo_nomina', 'Costo nomina: ') !!}
	    					{!! Form::text('costo_nomina', null, ['class' => 'form-control','id'=>'costo_nomina']) !!}
						</div>
						
					</div>
				</div>
			</div>

			<div class="card card-primary card-outline">
				<div class="card-header">
					<h3 class="card-title">
					<i class="fa fa-plus"></i>
					Motivo de contratación
					</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							{!! Form::label('motivo', 'Motivo: ') !!}
    						{!! Form::textarea('motivo', null, ['class' => 'form-control','maxlength'=>'250','rows'=>'4','style'=>'overflow: hidden; resize: none;']) !!}

    						{!! Form::label('vobo', 'Vo.Bo. Cliente: '); !!}
    						<br>
    						{!! Form::file('vobo') !!}
						</div>
					</div>
				</div>
			</div>


			<div class="card card-primary card-outline">
				<div class="card-header">
					<h3 class="card-title">
					<i class="fa fa-plus"></i>
					Uniforme y Equipamiento
					
					</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-3">
							{!! Form::label('celular', 'Celular con plan: ',['style'=>'width:130px;']) !!}
    						{!! Form::checkbox('celular', 'value', $solicitud_temp->celular,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
						</div>
						<div class="col-md-9">
							<div class="row" id="celular_opciones">
								<div class="col-md-6">
									{!! Form::label('plan_celular_select', 'Plan: ') !!}
									<br>
									{!! Form::select('plan_celular_select',$planes,$solicitud_temp->plan_linea,['class'=>'form-control','id'=>'plan_celular_select','style'=>'width: 100%;']) !!}
								</div>
								<div class="col-md-6  " id="celular_codigos">
									{!! Form::label('codigo_celular', 'Codigo de celular: ') !!}
    								{!! Form::text('codigo_celular', null, ['class' => 'form-control','id'=>'codigo_celular']) !!}
    								<p>Venta:<span id="venta_celular_label"></span>, Costo:<span id="costo_celular_label"></span></p>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							{!! Form::label('computadora', 'Computadora: ',['style'=>'width:130px;']) !!}
    						{!! Form::checkbox('computadora', 'value', $solicitud_temp->computadora,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
						</div>
						<div class="col-md-9">

							<div class="row" id="computadora_opciones">
								<div class="col-md-6">
									{!! Form::label('desc_computadora', 'Descripcion de la computadora (OPCIONAL): ') !!}
    								{!! Form::textarea('desc_computadora', null, ['class' => 'form-control','rows'=>'3','style'=>'overflow: hidden; resize: none;']) !!}
								</div>
								<div class="col-md-6  " id="computadora_codigos">
									{!! Form::label('codigo_computadora', 'Codigo de computadora: ') !!}
    								{!! Form::text('codigo_computadora', null, ['class' => 'form-control','id'=>'codigo_computadora']) !!}
    								<p>Venta:<span id="venta_computadora_label"></span>, Costo:<span id="costo_computadora_label"></span></p>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							{!! Form::label('software', 'Software: ',['style'=>'width:130px;']) !!}
    						{!! Form::checkbox('software', 'value', $solicitud_temp->software,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
						</div>
						<div class="col-md-9">
							<div class="row" id="software_opciones">
								<div class="col-md-6">
									{!! Form::label('desc_software', 'Descripcion del software (OPCIONAL): ') !!}
    								{!! Form::textarea('desc_software', null, ['class' => 'form-control','rows'=>'3','style'=>'overflow: hidden; resize: none;']) !!}
								</div>
								<div class="col-md-6  " id="software_codigos">
									{!! Form::label('codigo_software', 'Codigo de software: ') !!}
    								{!! Form::text('codigo_software', null, ['class' => 'form-control','id'=>'codigo_software']) !!}
    								<p>Venta:<span id="venta_software_label"></span>, Costo:<span id="costo_software_label"></span></p>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							{!! Form::label('correo', 'Correo: ',['style'=>'width:130px;']) !!}
    						{!! Form::checkbox('correo', 'value', $solicitud_temp->tipo_correo,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
						</div>
						<div class="col-md-9">
							<div class="row" id="correo_opciones">
								<div class="col-md-12">
									@php
										$correo_array = [
											'INDEPLO'=>'INDEPLO',
											'NAE'=>'NAE',
										];
									@endphp
									{!! Form::label('tipo_correo', 'Tipo de correo: ') !!}
									{!! Form::select('tipo_correo',$correo_array,$solicitud_temp->tipo_correo,['class'=>'form-control','id'=>'riesgo','placeholder'=>'SELECCIONE','style'=>'width: 100%;']) !!}
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							{!! Form::label('bam', 'BAM: ',['style'=>'width:130px;']) !!}
    						{!! Form::checkbox('bam', 'value', $solicitud_temp->bam,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
						</div>
						<div class="col-md-9">
							<div class="row" id="bam_opciones">
								<div class="col-md-6">
									{!! Form::label('plan_bam_select', 'Plan: ') !!}
									<br>
									{!! Form::select('plan_bam_select',$planes,$solicitud_temp->codigo_bam,['class'=>'form-control','id'=>'plan_bam_select','style'=>'width: 100%;']) !!}
								</div>
								<div class="col-md-6  " id="bam_codigos">
									{!! Form::label('codigo_bam', 'Codigo de BAM: ') !!}
    								{!! Form::text('codigo_bam', null, ['class' => 'form-control','id'=>'codigo_bam']) !!}
    								<p>Venta:<span id="venta_bam_label"></span>, Costo:<span id="costo_bam_label"></span></p>
								</div>
							</div>
						</div>
					</div>
					<hr><hr>
					<div class="row">
						<div class="col-md-3">
							{!! Form::label('auto', 'Auto: ',['style'=>'width:130px;']) !!}
    						{!! Form::checkbox('auto', 'value', $solicitud_temp->auto,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
						</div>
						<div class="col-md-9">
							<div class="row" id="auto_opciones">
								<div class="col-md-12  " id="auto_codigos">
									{!! Form::label('codigo_auto', 'Codigo de Auto: ') !!}
    								{!! Form::text('codigo_auto', null, ['class' => 'form-control','id'=>'codigo_auto']) !!}
    								<p>Venta:<span id="venta_auto_label"></span>, Costo:<span id="costo_auto_label"></span></p>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							{!! Form::label('botas', 'Botas seguridad: ',['style'=>'width:130px;']) !!}
    						{!! Form::checkbox('botas', 'value', $solicitud_temp->botas,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
						</div>
						<div class="col-md-9">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							{!! Form::label('playera', 'Playeras con logo: ',['style'=>'width:130px;']) !!}
    						{!! Form::checkbox('playera', 'value', $solicitud_temp->playera,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
						</div>
						<div class="col-md-9">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-12">
							{!! Form::textarea('herramientas_almacen', null, ['class' => 'form-control','rows'=>'5','maxlength'=>'250','style'=>'overflow: hidden; resize: none;','placeholder'=>'Detalle de las herramientas de almacen necesitadas']) !!}
						</div>
					</div>
				</div>
			</div>

			<div class="card card-primary card-outline">
				<div class="card-header">
					<h3 class="card-title">
					<i class="fa fa-plus"></i>
					Actividades y lugar de trabajo
					</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							{!! Form::label('actividad', 'Actividades: ') !!}
    						{!! Form::textarea('actividad', null, ['class' => 'form-control req_common','maxlength'=>'150','rows'=>'2','style'=>'overflow: hidden; resize: none;']) !!}
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							{!! Form::label('coordinador_id', 'Coordinador: ') !!}
							<div class="ui-widget">
    							{!! Form::select('coordinador_id',$coordinadores,null,['class'=>'form-control req_common','id'=>'coordinador_id','style'=>'width: 100%;']) !!}
    						</div>
						</div>
						<div class="col-md-6  " id="coord_nuevo_div">
							<!--{!! Form::label('coord_nuevo', 'Coordinador Nuevo: ',['style'=>' margin-top:27px;']) !!}
    						{!! Form::checkbox('coord_nuevo', 'value', false,['id'=>'coord_nuevo','data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}-->
						</div>
					</div>

					<div class="row" id="datos_coord_nuevo_div" hidden="true">
						<div class="col-xs-10 col-md-10" >
							{!! Form::label('nombre_coor', 'Nombre de nuevo coordinador: ') !!}
    						{!! Form::text('nombre_coor', null, ['class' => 'form-control','id'=>'nombre_coor']) !!}
						</div>
						<div class="col-xs-2 col-md-2 text-center" style="padding-top:35px;" id="retro_nuevo_coor">
							
						</div>
						<div class="clearfix"></div>
						<div class="col-xs-10 col-md-10" >
							{!! Form::label('correo_coor', 'Correo de nuevo coordinador: ') !!}
    						{!! Form::email('correo_coor', null, ['class' => 'form-control','id'=>'correo_coor']) !!}
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							{!! Form::label('lugar_trabajo', 'Lugar de trabajo: ') !!}
    						{!! Form::select('lugar_trabajo',$estados, $solicitud_temp->lugar_trabajo,['class'=>'form-control req_common','id'=>'lugar_trabajo','style'=>'width: 100%;']) !!}
						</div>
						<div class="col-md-6">
							{!! Form::label('pm', 'PM: ') !!}
	    					{!! Form::text('pm', null, ['class' => 'form-control req_common','id'=>'pm']) !!}
						</div>
					</div> 
					<div class="row">
						<div class="col-md-12">
							{!! Form::label('direccion', 'Direccion: ') !!}
    						{!! Form::textarea('direccion', null, ['class' => 'form-control req_common','rows'=>'2','style'=>'overflow: hidden; resize: none;','id'=>'direccion']) !!}
						</div>
					</div>
				</div>
			</div>

			<div class="card card-primary card-outline hide  " id="venta_calculada_div">
				<div class="card-body">
					<div class="row">
						<div class="col-md-4 text-center">
							<p class="h5">Venta calculada: <span id="venta_calculada_span">  </span></p>
							{!! Form::hidden('venta_calculada', null, ['class' => 'form-control','id'=>'venta_calculada']) !!}	
						</div>
						<div class="col-md-4 text-center">
							<p class="h5">Costo estimado: <span id="costo_estimado_span">  </span></p>
							{!! Form::hidden('costo_estimado', null, ['class' => 'form-control','id'=>'costo_estimado']) !!}
						</div>
						<div class="col-md-4 text-center">
							<p class="h5">Margen: <span id="margen_span">  </span></p>
						</div>
					</div>
				</div>
			</div>

			<div class="card card-primary card-outline hide " id="caso_negocio_div">
				<div class="card-body">
					<div class="row">
						<div class="col-md-12 text-center">
							{!! Form::label('caso_negocio', 'Caso de negocio: '); !!}
    						{!! Form::file('caso_negocio') !!}	
    						<br><br>
    						{!! Form::label('cotizacion', 'Cotización: '); !!}
    						{!! Form::file('cotizacion') !!}
						</div>
					</div>
				</div>
			</div>

			<div class="card card-primary">
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							{!! Form::button('Actualizar',['class'=>'btn btn-primary btn-lg btn-block','id'=>'actualiza_info']) !!}
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- /.row -->
</div><!-- /.container-fluid --> 
{!! Form::close() !!}
{!! Html::script('js/sol_altas/search_wbs.js?v='.time()) !!}
{!! Html::script('js/sol_altas/common.js?v='.time()) !!}
{!! Html::script('js/sol_altas/update.js')!!}
@endsection 