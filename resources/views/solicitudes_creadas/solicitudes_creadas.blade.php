{{-- 
    MOD:Ercik Diaz modificacion creada  para la solicitud crada.
    --}}
@extends('layouts.admin')

@section('contenido')

<div class="container-fluid">
    <div class="row">
    </div>
    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">
            <i class="fa fa-plus"></i>
            Solicitudes Creadas
            </h3>
        </div>  
        <table class="table table-bordered" id="index-table">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>nombre</th>
                    <th>apaterno</th>
                    <th>amaterno</th>
                    <th>fecha_inicio</th>
                    <th>puesto</th>
                    <th>Acciones</th>
        
                </tr>
            </thead>
        </table>
    </div>
</div>
{!! Html::script('js/sol_altas/index.js') !!}
@endsection 