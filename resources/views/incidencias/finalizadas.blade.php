@extends('layouts.admin')

@section('contenido')
    {!! Html::script('https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.js') !!}
    {!! Html::style('https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css') !!}

    <link rel="stylesheet" type="text/css" href="css/style.css">
    <div class="container-fluid">
        <div class="row">
        </div>
        <input hidden value="envio" id="envio">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fa fa-plus"></i>
                    Incidencias Finalizadas
                </h3>
                <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">
                @can('access',[\App\User::class,'export_lote_incidencias'])
                    <form class="form-inline" style="display: none;">
                        <div class="form-group mx-sm-3 mb-2">
                            <label for="FInicio" class="sr-only">Fecha Inicio</label>
                            <input type="date" name="FInicio" class="form-control" id="FInicio">
                        </div>
                        <div class="form-group mx-sm-3 mb-2">
                            <label for="FFIn" class="sr-only">Fecha Fin</label>
                            <input type="date" name="FFIn" class="form-control" id="FFIn">
                        </div>
                        <div class="form-group mx-sm-3 mb-2">
                            <button id="excel" type="button" onclick="ExportExcel();" class="btn btn-success">Exportar
                            </button>
                        </div>
                    </form>
                @endcan
                <div class="form-inline" style="padding-top: 10px;border-top: 1px solid lightgrey;border-bottom: 1px solid lightgrey;margin-bottom: 5px;">
                    <div class="form-group mb-2 col-sm-1">
                        <input id="search_id" name="search_id" class="form-control col-sm-12" placeholder="ID" title="Buscar por el id de la incidencia">
                    </div>
                    <div class="form-group mb-2 col-sm-2">
                        <input id="search_nombre" name="search_nombre" class="form-control col-sm-12" placeholder="EMPLEADO" title="Buscar por el nombre del empleado">
                    </div>
                    <div class="form-group mb-2 col-sm-1">
                        <input id="search_num" name="search_num" class="form-control col-sm-12" placeholder="NUM EMP" title="Buscar por el numero del empleado">
                    </div>
                    <div class="form-group mb-2 col-sm-2">
                        <input id="search_inci" name="search_inci" class="form-control col-sm-12" placeholder="INCIDENCIA" title="Buscar por el nombre de la incidencia">
                    </div>
                    <div class="form-group mb-2 col-sm-2">
                        <input id="search_sol" name="search_sol" class="form-control col-sm-12" placeholder="SOLICITANTE" title="Buscar por el nombre solicitante">
                    </div>
                    <div class="form-group mb-2">
                        <select id="search_esta" name="search" class="form-control col-sm-12" title="Filtrar incidencias por estatus">
                            <option value="">{{__('ESTATUS')}}</option>
                            <option value="CANCELAR">{{__('CANCELADA')}}</option>
                            <option value="ENVIADO">{{__('ENVIADA')}}</option>
                        </select>
                    </div>
                    <div class="form-group mb-2 col-sm-1">
                        <select id="search_tipo" name="search" class="form-control col-sm-12" title="Filtrar incidencias por tipo">
                            <option value="">{{__('TIPO')}}</option>
                            <option value="PERCEPCION">{{__('PERCEPCION')}}</option>
                            <option value="DEDUCCION">{{__('DEDUCCION')}}</option>
                        </select>
                    </div>
                    <div class="col-sm">
                        <a id="reset" class="btn btn-primary btn-md pull-right" title="Reiniciar Filtros" style="color: white">
                            <i class="fa fa-refresh"></i>
                        </a>
                    </div>
                </div>
                <div class="col-12">
                    <div class="row">
                        <div class="col-12">
                            <table class="table table-active"
                                   style="font-size:12px;text-align: center; width: 100%" id="Incidencias_Enviar-table">
                                <thead>
                                <tr>
                                    <th>{{__('Id')}}</th>
                                    <th>{{__('Enviada')}}</th>
                                    <th>{{__('Empleado')}}</th>
                                    <th>{{__('Empleado Num')}}</th>
                                    <th>{{__('Incidencia')}}</th>
                                    <th>{{__('Tipo de incidencia')}}</th>
                                    <th>{{__('Solicitante')}}</th>
                                    <th>{{__('Lote')}}</th>
                                    <th>{{__('Estatus')}}</th>
                                    <th>{{__('Duracion(Días)')}}</th>
                                    <th>{{__('Fecha de solicitud')}}</th>
                                    <th>{{__('Fecha de inicio')}}</th>
                                    <th>{{__('Motivo')}}</th>
                                </tr>
                                </thead>
                            </table>
                            <!--button id="Enviar1" type="button" onclick="validaBoton();" class="btn btn-secondary">
                                Arreglo
                            </button-->
                            @can('access',[\App\User::class,'enviar_lote'])
                                <button id="Enviar" type="button" onclick="EjecutarLote();" class="btn btn-success">
                                    {{__('Enviar')}}
                                </button>
                            @endcan
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLongTitle">Modal title</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card-body">
                        <table class="table table-active" style="font-size:12px;text-align: center;" id="BITACORAS">
                            <thead>
                            <tr>
                                <th>CLAVE</th>
                                <th>USUARIO</th>
                                <th>EMPLEADO</th>
                                <th>DETALLES</th>
                                <th>FECHA</th>
                                <th>HORA</th>
                                <th>AUTORIZACION</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

                </div>
            </div>
        </div>
    </div>
    @include('envio_incidencias.modals.subir_vobo')

    {!! Html::script('js/incidencias/finalizadas.js') !!}
@endsection
