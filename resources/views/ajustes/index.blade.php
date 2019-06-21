@extends('layouts.admin')


@section('contenido')

    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fa fa-plus"></i>
                {{__('LISTADO DE AJUSTES DE SUELDO')}}
            </h3>
            <br>
            <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">

            <div class="row mb-3 col-12">
                <a id="nuevo_ajuste" class="btn btn-primary ml-2 text-white">{{__('Nuevo Ajuste')}}</a>
                <div class="col-sm">
                    <a id="enviar_ajustes" class="btn btn-success ml-2 text-white pull-right">{{__('Enviar')}}</a>
                </div>
            </div>

            <div class="row mb-3 col-12">
                <div class="col-sm">
                    <div class="form-check check-todo pull-right">
                        <input type="checkbox" class="form-check-input" id="marcar">
                        <label class="form-check-label" for="marcar"><strong>{{__('Marcar Todos')}}</strong></label>
                    </div>
                </div>
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
                    <th data-priority="2">{{__('ENVIAR')}}</th>
                    <th data-priority="4">{{__('DOCUMENTO')}}</th>
                    <th data-priority="3">{{__('EMPLEADO')}}</th>
                    <th>{{__('NUMERO EMP')}}</th>
                    <th>{{__('TRADICIONAL')}}</th>
                    <th>{{__('ASIMILADO')}}</th>
                    <th>{{__('OBSERVACIONES')}}</th>
                    <th>{{__('FECHA SOLICITUD')}}</th>
                    <th data-priority="5">{{__('ACCIONES')}}</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
    @include('ajustes.modals.create')
    @include('ajustes.modals.edit')

    @php
    @endphp
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    {!! Html::script('js/validador.js') !!}
    {!! Html::script('js/ajustes/index.js') !!}
    {!! Form::close() !!}

@endsection