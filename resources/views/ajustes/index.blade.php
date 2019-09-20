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

            <div class="col-sm mb-5">
                <a class="btn btn-primary pull-left text-white" href="/files/Manuales/Manual_Ajuste_Sueldo.pdf" >
                    <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
                    {{__('Manual Ajuste Sueldo')}}
                </a>
            </div>


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
                        <option value="solicitado">{{__('Pendientes')}}</option>
                        <option value="autorizado">{{__('Autorizadas')}}</option>
                        <option value="cancelado">{{__('Canceladas')}}</option>
                        <option value="enviado">{{__('Enviadas')}}</option>
                    </select>
                </div>
                <div class="col-sm">
                    <a id="reset" class="btn btn-primary btn-md pull-right" title="Reiniciar Filtros" style="color: white">
                        <i class="fa fa-refresh"></i>
                    </a>
                </div>
            </div>
            @can('access',[\App\User::class,'exportar_solicitudes'])
                <div class="mt-2 form-inline" style="border-top: 1px solid #dfdfdf;padding-top: 10px;">
                    <div class="form-group col-sm-2">
                        <label for="exp_inicio" class="sr-only">{{__('Fecha Inicio')}}</label>
                        <input type="date" class="form-control col-sm-12" id="exp_inicio">
                    </div>
                    <div class="form-group col-sm-2">
                        <label for="exp_fin" class="sr-only">{{__('Fecha Fin')}}</label>
                        <input type="date" class="form-control col-sm-12" id="exp_fin">
                    </div>
                    <div class="form-group col-sm-2">
                        <select id="exp_estatus" name="exp_estatus" class="form-control col-sm-12" placeholder="Estatus" title="Buscar por estatus">
                            <option value="">{{__('Todos')}}</option>
                            <option value="solicitado">{{__('Solicitado')}}</option>
                            <option value="autorizado">{{__('Autorizados')}}</option>
                            <option value="rechazado">{{__('Cancelados')}}</option>
                            <option value="enviado">{{__('Enviados')}}</option>
                        </select>
                    </div>
                    <div class="col-sm">
                        <button id="excel" type="button" onclick="ExcelAjustes();"
                                class="btn btn-success pull-right">{{__('Exportar')}}</button>
                    </div>
                </div>
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
                    <th data-priority="4">{{__('EVIDENCIA')}}</th>
                    <th data-priority="3">{{__('EMPLEADO')}}</th>
                    <th>{{__('NUMERO EMP')}}</th>
                    <th data-priority="5">{{__('TRADICIONAL')}}</th>
                    <th data-priority="6">{{__('ASIMILADO')}}</th>
                    <th data-priority="7">{{__('RO')}}</th>
                    <th data-priority="8">{{__('Venta')}}</th>
                    <th>{{__('FECHA INICIO SUELDO')}}</th>
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
    {!! Html::script('js/validador.js?v='.time()) !!}
    {!! Html::script('js/ajustes/index.js?v='.time()) !!}
    {!! Form::close() !!}

@endsection