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
                    Envio de Incidencias
                </h3>
                <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">
                @can('access',[\App\User::class,'export_lote_incidencias'])
                    <form class="form-inline">
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
                <div class="col-12">
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-md-8">
                                    @can('access',[\App\User::class,'enviar_lote'])
                                        <button id="Enviar" type="button" onclick="EjecutarLote();" class="btn btn-success">
                                            {{__('Enviar')}}
                                        </button>
                                    @endcan
                                </div>
                                <div class="col-md-4">
                                    <div class="form-check check-todo pull-right">
                                        <input type="checkbox" class="form-check-input" id="marcar">
                                        <label class="form-check-label" for="marcar"><strong>{{__('Marcar Todos')}}</strong></label>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-active"
                                   style="font-size:12px;text-align: center; width: 100%" id="Incidencias_Enviar-table">
                                <thead>
                                <tr>
                                    <th>{{__('Id')}}</th>
                                    <th>{{__('Enviar')}}</th>
                                    <th>{{__('Vobo Venta')}}</th>
                                    <th>{{__('Empleado')}}</th>
                                    <th>{{__('Empleado id')}}</th>
                                    <th>{{__('Incidencia')}}</th>
                                    <th>{{__('Tipo de incidencia')}}</th>
                                    <th>{{__('Solicitante')}}</th>
                                    <th>{{__('Duracion(Días)')}}</th>
                                    <th>{{__('Fecha de solicitud')}}</th>
                                    <th>{{__('Fecha de inicio')}}</th>
                                    <th>{{__('Motivo')}}</th>
                                    <th>{{__('Lote')}}</th>
                                </tr>
                                </thead>
                            </table>
                            <!--button id="Enviar1" type="button" onclick="validaBoton();" class="btn btn-secondary">
                                Arreglo
                            </button-->
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
    <style>
        .check-todo{
            margin-left: 2%;
            margin-bottom: 2%;
            z-index: 1;
        }
    </style>
    @include('envio_incidencias.modals.subir_vobo')

    {!! Html::script('js/incidencias/envio.js') !!}
@endsection 