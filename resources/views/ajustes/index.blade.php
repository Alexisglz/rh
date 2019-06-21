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
                @can('access',[\App\User::class,'nuevo_ajuste_s'])
                    <a id="nuevo_ajuste" class="btn btn-primary ml-2 text-white">{{__('Nuevo Ajuste')}}</a>
                @endcan
                @can('access',[\App\User::class,'enviar_ajuste_s'])
                    <div class="col-sm">
                        <a id="enviar_ajustes" class="btn btn-success ml-2 text-white pull-right">{{__('Enviar')}}</a>
                    </div>
                @endcan
            </div>

            @can('access',[\App\User::class,'enviar_ajuste_s'])
                <div class="row mb-3 col-12">
                    <div class="col-sm">
                        <div class="form-check check-todo pull-right">
                            <input type="checkbox" class="form-check-input" id="marcar">
                            <label class="form-check-label" for="marcar"><strong>{{__('Marcar Todos')}}</strong></label>
                        </div>
                    </div>
                </div>
            @endcan

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

            <div class="form-inline" style="border-top: 1px solid #dfdfdf; padding-top: 10px;">
                <div class="form-group col-sm-1">
                    <input id="search_id" name="search_id" class="form-control col-sm-12" placeholder="ID" title="Buscar por ID">
                </div>
                <div class="form-group col-sm-2">
                    <input id="search_emp" name="search_emp" class="form-control col-sm-12" placeholder="Empleado" title="Buscar por Empleado">
                </div>
                <div class="form-group col-sm-2">
                    <select id="search_est" name="search_est" class="form-control col-sm-12" placeholder="Estatus" title="Buscar por estatus">
                        <option value="">{{__('Seleccione')}}</option>
                        <option value="SI">{{__('Enviado')}}</option>
                        <option value="NO">{{__('No enviado')}}</option>
                    </select>
                </div>
                <div class="col-sm">
                    <a id="reset" class="btn btn-primary btn-md pull-right" title="Reiniciar Filtros" style="color: white">
                        <i class="fa fa-refresh"></i>
                    </a>
                </div>
            </div>

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
        $nuevo_ajuste_s    = auth()->user()->can('access',[\App\User::class,'nuevo_ajuste_s'])? 1:0;
        $editar_ajustes_s  = auth()->user()->can('access',[\App\User::class,'editar_ajustes_s'])? 1:0;
        $eliminar_ajuste_s = auth()->user()->can('access',[\App\User::class,'eliminar_ajuste_s'])? 1:0;
        $enviar_ajuste_s   = auth()->user()->can('access',[\App\User::class,'enviar_ajuste_s'])? 1:0;
    @endphp
    <script>
        var nuevo_ajuste_s    = '{{ $nuevo_ajuste_s }}';
        var editar_ajustes_s  = '{{ $editar_ajustes_s }}';
        var eliminar_ajuste_s = '{{ $eliminar_ajuste_s }}';
        var enviar_ajuste_s   = '{{ $enviar_ajuste_s }}';
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    {!! Html::script('js/validador.js') !!}
    {!! Html::script('js/ajustes/index.js') !!}
    {!! Form::close() !!}

@endsection