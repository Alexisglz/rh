@extends('layouts.admin')

@section('contenido')
    {!! Html::style('plugins/bootstrap-toggle/css/bootstrap-toggle.min.css') !!}
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title text-center">
                            <i class="fa fa-check"></i>
                            {{__('Validar Incidencias')}}
                            <div class="pull-right">
                                <button class="btn btn-success" onclick="save()">{{__('Guardar')}}</button>
                            </div>
                        </h3>
                    </div>
                    <div class="card-body table-responsive" style="max-height: 80vh;overflow: auto;">
                        <table id="table_dir" class="table table-active" style="font-size:12px;text-align: center; width: 100%;">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Autorizar</th>
                                <th>Empleado</th>
                                <th>Incidencia</th>
                                <th>Solicitante</th>
                                <th>Vobo</th>
                                <th>Venta</th>
                                <th>RO</th>
                                <th>Fecha de solicitud</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {!! Html::script('js/incidencias/directivo.js') !!}
    <style>
        .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 20px; }
        .toggle.ios .toggle-handle { border-radius: 20px; }
    </style>
@endsection
