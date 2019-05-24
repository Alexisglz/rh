{{-- 
    MOD:JOSE LUIS MODIFICACIONES CREADA  PARA AUTORIZACIONES.
    10-11-18 SE AGREGA EL TEMPLATE TEMPORAL DE 'INCIDENCIAS AUTORIZAR' DE EJEMPLO.
    
--}}
@extends('layouts.admin')

@section('contenido')

<div class="container-fluid">
	<div class="row">
		<div class="col-12">
		<!-- interactive chart -->
			
			<div class="card card-primary card-outline">
				<div class="card-header">
					<h3 class="card-title">
					<i class="fa fa-check"></i>
					Autorizaciones
					</h3>
				</div>
				<div class="card-body">
					<table class="table table-bordered" id="incidencias-table">
					    <thead>
					        <tr>
					            <th>Id</th>
					            <th>Empleado</th>
					            <th>Info</th>
					            <th>Tipo de incidencia</th>
					            <th>Fecha de solicitud</th>
					            <th>Solicitante</th>
					            <th>Bitacora</th>
					            <th>Autorizar</th>
					        </tr>
					    </thead>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</div>
<!--modal-->
<!-- Modal -->
<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLongTitle">Modal title</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        
      </div>
    </div>
  </div>
</div>
{!! Html::script('js/incidencias/autorizar.js') !!}
@endsection