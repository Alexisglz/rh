@extends('layouts.admin')


@section('contenido')
    @if(Auth::check())
        {!! Form::hidden('IdUser',Auth::id(), ['class'=>'form-control' ,'id'=>'IdUser']) !!}
    @endif

    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fa fa-plus"></i>
                {{__('LISTADO DE SOLICITUDES DE ALTA')}}
            </h3>
            <a class="btn btn-primary btn-sm pull-right btn-circle" title="Informacion de los checks" onclick="$('#infoCheck').modal('toggle')"><i class="fa fa-info"></i></a>
            <br>
            <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">

            @can('access',[\App\User::class,'exportar_solicitudes'])
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
            <div class="form-inline">
                <div class="form-group mb-2 col-sm-1">
                    <input id="search_id" name="search_id" class="form-control col-sm-12" placeholder="ID" title="Buscar por ID" value="{{ $id == 0 ? null : $id}}">
                </div>
                <div class="form-group mb-2 col-sm-2">
                    <input id="search_nombre" name="search_nombre" class="form-control col-sm-12" placeholder="Nombre" title="Buscar por el nombre">
                </div>
                <div class="form-group mb-2 col-sm-2">
                    <input id="search_wbs" name="search_wbs" class="form-control col-sm-12" placeholder="WBS" title="Buscar por el WBS">
                </div>
                <div class="form-group mb-2 col-sm-2">
                    <input id="search_coord" name="search_coord" class="form-control col-sm-12" placeholder="Coordinador" title="Buscar por el coordinador">
                </div>
                <div class="col-sm">
                    <a id="reset" class="btn btn-primary btn-md pull-right" title="Reiniciar Filtros" style="color: white">
                        <i class="fa fa-refresh"></i>
                    </a>
                </div>
            </div>
            <div class="form-inline" style="display: none;">
                <div class="form-group mb-2">
                    <button id="auth" title="Solicitudes Autorizadas" class="btn btn-success btn-sm" style="color: white; font-size: 13px;">{{__('DIR')}}<br>{{__('Autorizadas')}}</button>
                </div>
                <div class="form-group mb-2">
                    <button id="no_auth" title="Solicitudes Autorizadas" class="btn btn-warning btn-sm" style="color: white; font-size: 13px;">{{__('DIR')}}<br>{{__('Sin Autorizar')}}</button>
                </div>
                <div class="form-group mb-2">
                    <button id="rh_auth" title="Solicitudes Autorizadas" class="btn btn-primary btn-sm" style="color: white; font-size: 13px;">{{__('RH')}}<br>{{__('Autorizadas')}}</button>
                </div>
                <div class="form-group mb-2">
                    <button id="rh_no_auth" title="Solicitudes Autorizadas" class="btn btn-orange btn-sm" style="color: white; font-size: 13px;">{{__('RH')}}<br>{{__('Sin Autorizar')}}</button>
                </div>
                <div class="col-sm">
                    <a id="reset" class="btn btn-primary btn-md pull-right" title="Reiniciar Filtros" style="color: white">
                        <i class="fa fa-refresh"></i>
                    </a>
                </div>
            </div>
            <br>
            <table class="table table-active table-altas" width="100%" id="altas-table">
                <thead>
                <tr>
                    <th>{{__('ID')}}</th>
                    <th>{{__('INFO')}}</th>
                    <th>{{__('EDITAR')}}</th>
                    <th>{{__('BITACORA')}}</th>
                    <th>{{__('WBS')}}</th>
                    <th>{{__('RECURSO')}}</th>
                    <th>{{__('FECHA SOL')}}</th>
                    <th>{{__('CREACION')}}</th>
                    <th>{{__('COORDINADOR')}}</th>
                    <th>{{__('AUTORIZAR DIRECCION')}}</th>
                    <th>{{__('AUTORIZAR RH')}}</th>
                    <th>{{__('AUTH COMPUTO')}}</th>
                    <th>{{__('AUTH CELULAR')}}</th>
                    <th>{{__('AUTH AUTO')}}</th>
                    <th>{{__('AUTH ALMACEN')}}</th>
                    <th>{{__('CONTRATO FIRMADO')}}</th>
                    <th>{{__('COR-NOKIA-INDE')}}</th>
                    <th>{{__('PM')}}</th>
                    <th>{{__('IMSS')}}</th>
                    <th>{{__('VARIABLE')}}</th>
                    <th>{{__('ASIMILADO')}}</th>
                    <th>{{__('COSTO')}}</th>
                    <th>{{__('VENTA')}}</th>
                    <th>{{__('MARGEN')}}</th>
                    <th>{{__('ALTA')}}</th>
                    <th>{{__('SOLICITANTE')}}</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>

    <!-- Modal informacion-->
    @include('altas.modals.info')

    <!-- Modal editar *buscar si se utliza-->
    @include('altas.modals.editar_solicitud')

    <!-- Modal autorizar *buscar si se utliza-->
    @include('altas.modals.autorizar')

    <!--Modal para cita de firmas -->
    @include('altas.modals.cita')

    <!--Modal para autorizar computo -->
    @include('altas.modals.computo')

    <!--Modal para autorizar auto -->
    @include('altas.modals.auto')

    <!--Modal para autorizar celular -->
    @include('altas.modals.celular')

    <!--Modal para autorizar almacen -->
    @include('altas.modals.almacen')

    <!--Modal para info checks -->
    @include('altas.modals.check')

    <style type="text/css">
        .main-sidebar {
            z-index: 5px;
        }
        .auths{
            max-width: 55px !important;
        }
        .width-auto{
            max-width: 60px; !important;
        }
        .id{
            max-width: 40px !important;
        }
        .editar_v{
            max-width: 40px !important;
        }
        .dire_v{
            max-width: 61px !important;
        }

    </style>
    @php
        $edit              = auth()->user()->can('access',[\App\User::class,'editar_solicitudes'])? 1:0;
        $auth_sol          = auth()->user()->can('access',[\App\User::class,'autorizar_solicitudes'])? 1:0;
        $cita              = auth()->user()->can('access',[\App\User::class,'agendar_cita'])? 1:0;
        $auth_computadora  = auth()->user()->can('access',[\App\User::class,'autorizar_computadora'])? 1:0;
        $auth_celular      = auth()->user()->can('access',[\App\User::class,'autorizar_celular'])? 1:0;
        $auth_coche        = auth()->user()->can('access',[\App\User::class,'autorizar_coche'])? 1:0;
        $auth_herramientas = auth()->user()->can('access',[\App\User::class,'autorizar_herramientas'])? 1:0;
        $ver_checks        = auth()->user()->can('access',[\App\User::class,'ver_autorizaciones'])? 1:0;
        $cont_firm         = auth()->user()->can('access',[\App\User::class,'contrato_firmado'])? 1:0;
    @endphp
    <script>
        var edit              = '<?php echo $edit?>';
        var auth_sol          = '<?php echo $auth_sol?>';
        var cita              = '<?php echo $cita?>';
        var auth_computadora  = '<?php echo $auth_computadora?>';
        var auth_celular      = '<?php echo $auth_celular?>';
        var auth_coche        = '<?php echo $auth_coche?>';
        var auth_herramientas = '<?php echo $auth_herramientas?>';
        var ver_checks        = '<?php echo $ver_checks?>';
        var cont_firm         = '<?php echo $cont_firm?>';
        var id_post           = '{{$id}}';
        $(function () {
            $("#computadora_check").bootstrapToggle({
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    {!! Html::script('js/sol_altas/index.js') !!}
    {!! Html::script('js/validador.js') !!}

    {!! Form::close() !!}


@endsection