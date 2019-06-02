@extends('layouts.admin')
@section('contenido')

    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!--link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"-->
    <style type="text/css">
        ul.ui-autocomplete {
            z-index: 1100;
        }
    </style>
    <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">
    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fa fa-plus"></i>
                {{__('LISTADO DE EMPLEADOS')}}
            </h3>

            <br>
            @can('access',[\App\User::class,'autorizar_empleado'])
                <div class="row" style="margin-left: 0">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mdialTamanio">{{__('Agregar')}}</button>
                </div>
            @endcan
            <br>
            @can('access',[\App\User::class,'exportar_empleados'])
                <div class="row" style="padding-top: 5px;border-top: 1px solid lightgrey;">
                    <form class="form-inline" style="margin-top: 5px;">
                        <div class="form-group mb-2">
                            <label for="FInicio" class="sr-only">{{__('Fecha Inicio')}}</label>
                            <input type="date" class="form-control" id="FInicio">
                        </div>
                        <div class="form-group mx-sm-3 mb-2">
                            <label for="FFIn" class="sr-only">{{__('Fecha Fin')}}</label>
                            <input type="date" class="form-control" id="FFIn">
                        </div>
                        <button id="excel" type="button" onclick="ExcelEmpleados();" class="btn btn-success pull-right">{{__('Exportar')}}
                        </button>
                    </form>
                </div>
            @endcan
            <div class="form-inline" style="padding-top: 10px;border-top: 1px solid lightgrey;">
                <div class="form-group mb-2">
                    <input class="form-control input-sm" title="Buscar por id" id="search_id" name="search_id" placeholder="ID">
                </div>
                <div class="form-group mb-2">
                    <input class="form-control input-sm" title="Buscar por numero de empleado" id="num_emp" name="num_emp" placeholder="No. Emp">
                </div>
                <div class="form-group mb-2">
                    <input class="form-control input-sm" title="Buscar por nombre" id="search_nombre" name="search_nombre" placeholder="NOMBRE">
                </div>
                <div class="form-group mb-2">
                    <input class="form-control input-sm" title="Buscar por coordinador" id="search_coord" name="search_coord" placeholder="COORDINADOR">
                </div>
                <div class="form-group mb-2">
                    <input class="form-control input-sm" title="Buscar por project definition" id="search_pd" name="search_pd" placeholder="PD">
                </div>
                <div class="col-sm">
                    <a id="reset" class="btn btn-primary btn-md pull-right" title="Reiniciar Filtros" style="color: white">
                        <i class="fa fa-refresh"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-active" id="empleados-table"
                   style="text-align: center;font-size: 12px;width: 100%">
                <thead>
                <tr>
                    <th>{{__('Id')}}</th>
                    <th>{{__('Info')}}</th>
                    <th>{{__('Editar')}}</th>
                    <th>{{__('Solicitar baja')}}</th>
                    <th>{{__('')}}</th>
                    <th>{{__('No.Empleado')}}</th>
                    <th>{{__('Nombre')}}</th>
                    <th>{{__('Coordinador')}}</th>
                    <th>{{__('PD')}}</th>
                    <th>{{__('Puesto')}}</th>
                    <th>{{__('Segmento')}}</th>
                    <th>{{__('Sueldo IMSS')}}</th>
                    <th>{{__('Sueldo Asimilado')}}</th>
                    <th>{{__('Estatus')}}</th>
                    <th>{{__('Fecha alta')}}</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
    @include('empleados.modals.editar_empleado')
    @include('empleados.modals.baja_empleado')
    <script>
        $(function () {
            $('#recurso_check').bootstrapToggle();
        })
    </script>

    <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header" style="height: 60px;">
                    <h4 class="modal-title" id="exampleModalLongTitle">Modal title</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div id="info-body" class="modal-body body-permisos">
                </div>
                <div class="modal-footer" style="height: 60px !important;">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    @include('empleados.modals.nuevo_empleado')
    @include('empleados.modals.cambio_proyecto')

    @php
        $edit_emple = auth()->user()->can('access',[\App\User::class,'editar_empleado'])? 1:0;
        $baja_emple = auth()->user()->can('access',[\App\User::class,'baja_empleado'])? 1:0;
        $ver_sueldo = auth()->user()->can('access',[\App\User::class,'ver_sueldo'])? 1:0;
        $camb_pro   = auth()->user()->can('access',[\App\User::class,'cambio_proyecto'])? 1:0;
    @endphp
    <script>
        var edit_emple = '<?php echo $edit_emple ?>';
        var baja_emple = '<?php echo $baja_emple ?>';
        var ver_sueldo = '<?php echo $ver_sueldo ?>';
        var camb_pro   = '<?php echo $camb_pro ?>';
        $(function () {
            $("#celular").bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
            $('#alta_check').bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
            $('#carro_check').bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
            $('#herramientas_check').bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
            $('#solicitante_check').bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
            $('#contrato_check').bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
        })
    </script>
    <style>
        .table-responsive{
            overflow-x: initial !important;
        }
    </style>
    <style>
        .table-autollenado{
            max-width: 90%;
            margin-left: auto;
            margin-right: auto;
            font-size: 14px;
            text-align: center;
        }
        .table-autollenado thead th {
            border-bottom: 1px solid #1f64a7;
            border-top: 1px solid #1f64a7;
        }
        #validation_label{
            margin-top: 10px;
            color: #1f64a7;
            font-size: 15px;
            margin-bottom: 10px;
        }
        #empleado_label{
            margin-top: 10px;
            color: red;
            font-size: 15px;
            margin-bottom: 10px;
        }
    </style>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    {!! Html::script('js/empleados/index.js') !!}
    {!! Html::script('js/empleados/buscar_emp.js?v='.time()) !!}
    {!! Html::script('js/validador.js?v='.time()) !!}

    {!! Html::script('js/sol_altas/search_wbs.js?v='.time()) !!}
    {!! Html::script('js/sol_altas/common.js?v='.time()) !!}



@endsection
