@extends('layouts.admin')


@section('contenido')

    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fa fa-plus"></i>
                {{__('LISTADO DE AJUSTES DE SUELDO')}}
            </h3>
            <a class="btn btn-primary btn-sm pull-right btn-circle" title="Informacion de los checks" onclick="$('#infoCheck').modal('toggle')"><i class="fa fa-info"></i></a>
            <br>
            <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">

            <div class="row mb-3">
                <a id="nuevo_ajuste" class="btn btn-primary ml-2 text-white">{{__('Nuevo Ajuste')}}</a>
            </div>

            @can('access',[\App\User::class,'exportar_solicitudes1'])
                <form class="form-inline">
                    <div class="form-group mb-2">
                        <label for="FInicio" class="sr-only">{{__('Fecha Inicio')}}</label>
                        <input type="date" class="form-control" id="FInicio">
                    </div>
                    <div class="form-group mx-sm-3 mb-2">
                        <label for="FFIn" class="sr-only">{{__('Fecha Fin')}}</label>
                        <input type="date" class="form-control" id="FFIn">
                    </div>
                    <button id="excel" type="button" onclick="ExcelAltas();"
                            class="btn btn-success">{{__('Exportar')}}</button>
                </form>
            @endcan

        </div>
        <div class="card-body">
            <input type="text" name="" value="{{auth()->user()->id_usuario}}" id="index_user" hidden="true">
            <br>
            <table class="table table-active table-altas" width="100%" id="table_ajustes">
                <thead>
                <tr>
                    <th data-priority="1">{{__('ID')}}</th>
                    <th data-priority="3">{{__('DOCUMENTO')}}</th>
                    <th data-priority="2">{{__('EMPLEADO')}}</th>
                    <th>{{__('NUMERO EMP')}}</th>
                    <th>{{__('TRADICIONAL')}}</th>
                    <th>{{__('ASIMILADO')}}</th>
                    <th>{{__('OBSERVACIONES')}}</th>
                    <th>{{__('FECHA SOLICITUD')}}</th>
                    <th data-priority="4">{{__('ACCIONES')}}</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
    @include('ajustes.modals.create')

    @php
    @endphp
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    {!! Html::script('js/validador.js') !!}
    {!! Html::script('js/ajustes/index.js') !!}
    {!! Form::close() !!}

@endsection