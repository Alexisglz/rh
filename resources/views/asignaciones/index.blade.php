{{-- 
    MOD:JOSE LUIS MODIFICACIONES CREADA  PARA ASIGANCIONES DE HERRAMIENTAS.
    10-11-18 SE AGREGA LA  DE USAURIOS TEMPORALMENTE.
    
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
                Asignación de herramientas
            </h3>
        </div>  
        <table class="table table-bordered" id="index-table">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>nombre</th>
                    <th>apaterno</th>
                    <th>amaterno</th>
                    <th>Herramientas</th>
        
                </tr>
            </thead>
        </table>
    </div>
</div>
{!! Html::script('js/asig_herra/index.js') !!}
@endsection