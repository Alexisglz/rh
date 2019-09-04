@extends('layouts.admin')

@section('contenido')
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <!-- interactive chart -->
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fa fa-list"></i>
                            Incidencias-estatus
                        </h3>
                        @can('access',[\App\User::class,'exportar_incidencias'])
                            <button id="excel" type="button" class="btn btn-success" data-toggle="modal" data-target="#exp_incidencias">
                                {{__('Exportar a Excel')}}
                            </button>
                        @endcan

                        <a class="btn btn-primary pull-right text-white" href="/files/Manuales/Manual_Crear_Incidencias.pdf" >
                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
                            {{__('Manual')}}
                        </a>

                    </div>
                    <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="form-inline" style="padding-top: 10px;border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                        <div class="form-group mb-1 col-sm-1">
                            <input id="search_id" name="search_id" class="form-control col-sm-12" value="{{$id == 0 ? null:$id}}" placeholder="ID" title="Buscar incidencia por ID" autocomplete="off">
                        </div>
                        <div class="form-group mb-2 col-sm-2">
                            <input id="search_nombre" name="search_nombre" class="form-control col-sm-12" placeholder="EMPLEADO" title="Buscar por el nombre del empleado" autocomplete="off">
                        </div>
                        <div class="form-group mb-2 col-sm-1">
                            <select id="search_tipo" name="search" class="form-control col-sm-12" title="Filtrar incidencias por tipo">
                                <option value="">{{__('TIPO')}}</option>
                                <option value="PERCEPCION">{{__('PERCEPCION')}}</option>
                                <option value="DEDUCCION">{{__('DEDUCCION')}}</option>
                            </select>
                        </div>
                        <div class="form-group mb-2 col-sm-3">
                            <select id="search_periodo" name="search_periodo" class="form-control col-sm-12" title="Filtrar incidencias por periodo">
                                <option value="">{{__('PERIODO')}}</option>
                                @foreach($periodos as $periodo)
                                    <option value="{{$periodo->id}}">{{strtoupper($periodo->periodo_nombre)}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-sm">
                            <a id="reset" class="btn btn-primary btn-md pull-right" title="Reiniciar Filtros" style="color: white">
                                <i class="fa fa-refresh"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-active text-center" id="incidencias-table" style="width: 100%">
                            <thead>
                            <tr>
                                <th data-priority="1">{{__('Id')}}</th>
                                <th>{{__('Bitacora')}}</th>
                                <th>{{__('Vobo Jefe')}}</th>
                                <th>{{__('Evidencia')}}</th>
                                <th data-priority="2">{{__('Empleado')}}</th>
                                <th data-priority="3">{{__('Incidencia')}}</th>
                                <th data-priority="4">{{__('Tipo de incidencia')}}</th>
                                <th data-priority="9">{{__('Fecha de solicitud')}}</th>
                                <th data-priority="5">{{__('Fecha inicio')}}</th>
                                <th data-priority="6">{{__('Duracion (Días)')}}</th>
                                <th data-priority="7">{{__('Monto')}}</th>
                                <th data-priority="9">{{__('Periodo')}}</th>
                                <th>{{__('RO')}}</th>
                                <th>{{__('Solicitante')}}</th>
                                <th>{{__('Motivo')}}</th>
                                <th>{{__('Lote')}}</th>
                                <th data-priority="8">{{__('Acciones')}}</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
    @include('incidencias.modals.editar')
    @include('incidencias.modals.exportar')
    <script>
        var id_post     = '{{$id}}';
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    {!! Html::script('js/MensajesJS.js?v='.time()) !!}
    {!! Html::script('js/validador.js?v='.time()) !!}
    {!! Html::script('js/incidencias/index.js?v='.time()) !!}
@endsection