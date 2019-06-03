@extends('layouts.admin')
@section('contenido')
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.all.min.js"></script>
    <div class="container-fluid">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fa fa-plus"></i>
                    {{__('LISTADO DE BAJAS')}}
                    <a class="btn btn-primary btn-sm pull-right btn-circle" title="Informacion de los checks" onclick="$('#infoCheck').modal('toggle')"><i class="fa fa-info"></i></a>
                </h3>
            </div>
            <div class="table-responsive">
                <table class="table table-active table-altas" width="100%" id="darbaja-table">
                    <thead>
                    <tr>
                        <th>{{__('ID')}}</th>
                        <th>{{__('CANCELAR')}}</th>
                        <th>{{__('INFO')}}</th>
                        <th>{{__('BAJA DEFINITIVA')}}</th>
                        <th>{{__('RECURSO')}}</th>
                        <th>{{__('WBS')}}</th>
                        <th>{{__('FECHA CITA')}}</th>
                        <th>{{__('BAJA COMPUTO')}}</th>
                        <th>{{__('BAJA CELULAR')}}</th>
                        <th>{{__('BAJA AUTO')}}</th>
                        <th>{{__('BAJA ALMACEN')}}</th>
                        <th>{{__('BAJA CREDENCIAL')}}</th>
                        <th>{{__('PAGO FINIQUITO LIQUIDACION')}}</th>
                        <th>{{__('BAJA DEFINITIVA')}}</th>
                        <th>{{__('COORDINADOR')}}</th>
                        <th>{{__('COORDINADOR NOKIA INDEPLO')}}</th>
                        <th>{{__('SOLICITANTE')}}</th>
                        <th>{{__('FECHA DE EMISION')}}</th>
                        <th>{{__('FECHA BAJA (SOLICITANTE)')}}</th>
                        <th>{{__('FECHA BAJA NOMINA')}}</th>
                        <th>{{__('TIEMPO DE RETRASO')}}</th>
                        <th>{{__('VOBO')}}</th>
                    </tr>
                    </thead>
                </table>
            </div>
            @php
                $area = Auth::user()->area;
            @endphp
            <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">
            <div class="modal fade" id="AutorizarcionesHerramientas" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Fechas y herramientas</h5>
                            <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
                            <!-- <span aria-hidden="true">&times;</span> -->
                            <!--/button-->
                        </div>
                        <div class="modal-body">
                            <div class="card-block">
                                <input id="id_comment" type="hidden" name="id_baja" value="0">
                                @if($area == "Recursos Humanos" || $area == "Proveedor" || $area == "ADMINISTRADOR")
                                    <div class="row">
                                        <legend>Datos importantes</legend>
                                        <div class="col-md-6">
                                            <label for="message-text" class="col-form-label">Fecha de
                                                emision:</label>
                                            <input type="date" class="form-control" name="fechaemi" id="fechaemi">

                                        </div>

                                        <hr>
                                        <div class="col-md-6">
                                            <label for="message-text" class="col-form-label">Fecha baja
                                                nomina:</label>
                                            <input type="date" class="form-control" name="fechabaj" id="fechabaj">
                                        </div>
                                        <hr>
                                        <div class="col-md-6">
                                            <label for="message-text" class="col-form-label">Fecha baja
                                                solicitud:</label>
                                            <input type="date" class="form-control" name="fechabajsol"
                                                   id="fechabajsol">
                                        </div>

                                        <hr>
                                        <div class="col-md-6">
                                            <label for="message-text" class="col-form-label">Fecha de cita:</label>
                                            <input type="date" class="form-control" name="fechacita" id="fechacita">
                                        </div>
                                    </div>
                                @endif
                                <hr>
                                <div class="row">
                                    <legend>Entrega de herramientas</legend>
                                    @if($area == "Soporte IT" || $area == "ADMINISTRADOR")
                                        <div class="col-md-2">
                                            {!! Form::label('computadora', 'Computadora: ',['style'=>'width:130px;']) !!}
                                            {!! Form::checkbox('computadora', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
                                        </div>

                                        <div class="col-md-2">
                                            <div class="row hide" id="computadora">
                                                <div class="col-md-11">
                                                {!! Form::label('desc_computadora', 'Descripcion de la computadora (OPCIONAL): ') !!}
                                                <!--
                                                {!! Form::textarea('desc_computadora', null, ['class' => 'form-control','rows'=>'3','style'=>'overflow: hidden; resize: none;']) !!}
                                                        -->
                                                    <textarea id="desc_computadora" class="form-control"></textarea>
                                                </div>
                                                <div class="col-md-2 hide" id="computadora_codigos">
                                                    {!! Form::label('codigo_computadora', 'Codigo de computadora: ') !!}
                                                    {!! Form::text('codigo_computadora', null, ['class' => 'form-control','id'=>'codigo_computadora']) !!}
                                                    <p>Venta:<span id="venta_computadora_label"></span>, Costo:<span
                                                                id="costo_computadora_label"></span></p>
                                                </div>
                                            </div>
                                        </div>
                                    @endif

                                    @if($area == "Soporte Auto" || $area == "ADMINISTRADOR")
                                        <div class="col-md-2">
                                            {!! Form::label('auto', 'Auto: ',['style'=>'width:130px;']) !!}
                                            {!! Form::checkbox('auto', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
                                        </div>
                                        <div class="col-md-2">
                                            <div class="row hide" id="auto">
                                            </div>
                                        </div>
                                    @endif

                                    @if($area == "Soporte Celular" || $area == "ADMINISTRADOR")
                                        <div class="col-md-2">
                                            {!! Form::label('celular', 'Celular: ',['style'=>'width:130px;']) !!}
                                            {!! Form::checkbox('celular', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
                                        </div>
                                        <div class="col-md-2">
                                            <div class="row hide" id="celular">
                                            </div>
                                        </div>
                                    @endif

                                    @if($area == "Soporte Almacen" || $area == "ADMINISTRADOR")
                                        <div class="col-md-2">
                                            {!! Form::label('almacen', 'Almacen: ',['style'=>'width:130px;']) !!}
                                            {!! Form::checkbox('almacen', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
                                        </div>
                                        <div class="col-md-2">
                                            <div class="row hide" id="almacen">
                                                <div class="col-md-11">
                                                {!! Form::label('desc_almacen', 'Descripcion del almacen (OPCIONAL): ') !!}
                                                <!--{!! Form::textarea('desc_almacen', null, ['class' => 'form-control','rows'=>'3','style'=>'overflow: hidden; resize: none;']) !!}-->
                                                    <textarea class="form-control" id="desc_almacen"></textarea>
                                                </div>
                                                <div class="col-md-2 hide" id="almacen_codigos">
                                                    {!! Form::label('codigo_almacen', 'Codigo de almacen: ') !!}
                                                    {!! Form::text('codigo_almacen', null, ['class' => 'form-control','id'=>'codigo_almacen']) !!}
                                                    <p>Venta:<span id="venta_almacen_label"></span>, Costo:<span
                                                                id="costo_almacen_label"></span></p>
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                    @if($area == "Recursos Humanos" || $area == "ADMINISTRADOR")
                                        <div class="col-md-2">
                                            {!! Form::label('credencial', 'Credencial: ',['style'=>'width:130px;']) !!}
                                            {!! Form::checkbox('credencial', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
                                        </div>
                                        <div class="col-md-2">
                                            <div class="row hide" id="credencial">
                                            </div>
                                        </div>
                                    @endif

                                    @if($area == "Recursos Humanos" || $area == "ADMINISTRADOR")
                                        <div class="col-md-2">
                                            {!! Form::label('pago_finiquito', 'Pago finiquito: ',['style'=>'width:130px;']) !!}
                                            {!! Form::checkbox('pago_finiquito', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
                                        </div>
                                        <div class="col-md-2">
                                            <div class="row hide" id="pago_finiquito">
                                                <div class="col-md-11">
                                                    {!! Form::label('pago_finiquito_select', 'Plan: ') !!} <label
                                                            id="pago_finiquito"></label>
                                                    <br>
                                                    @php
                                                        $pago_finiquito_array = [

                                                    ];
                                                    @endphp

                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="recipient-name" class="col-form-label">Adeudos:</label>
                                            <input type="text" class="form-control" name="adeudos" id="adeudos">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="recipient-name" class="col-form-label">Tiempo de
                                                retraso:</label>
                                            <input type="text" class="form-control" name="retraso" id="retraso">
                                        </div>

                                        <br>
                                        <div class="col-md-12">
                                            <label for="herramientas_observacion" class="col-form-label">Observaciones:</label>
                                            <textarea class="form-control" id="herramientas_observacion"
                                                      placeholder="Comentarios de las herramientas entregadas "
                                                      style="height: 150px"></textarea>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">
                                            Cerrar
                                        </button>
                                        <button type="button" class="btn btn-xs btn-primary" id="enviar"
                                                onClick="guardarHerramientas()">Enviar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="modal fade" id="ModalBitacora" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
              <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLongTitle">BITACORA DE SOLICITUD DE BAJA</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <div class="card-body">
                      <table class="table table-active" style="font-size:12px" id="BITACORAS">
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
            </div> -->
            <div class="modal fade" id="myModzal" role="dialog">
            <!--  {!! Form::open(['id'=>'form_edit_empleado','route'=>'usuarios.store','method'=>'POST','files'=>true,'enctype'=>"multipart/form-data"]) !!} -->
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="titulomodal">Baja Definitiva</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-12">
                                        <form id="form_edit_empleado" method="post" action="">
                                                <textarea class="form-control" id="observaciones"
                                                          placeholder="Comentarios adicionales,lugar de cita,etc"
                                                          style="height: 150px"></textarea>
                                            <label for="message-text" class="col-form-label">Fecha de Baja:</label>
                                            <input type="date" class="form-control" name="fehabaja" id="fehabaja">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div align="right">
                                <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">Cerrar
                                </button>
                                <button type="button" class="btn btn-xs btn-danger" onClick="funBajadefinitiva()">
                                    Enviar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @include('bajas.modals.cita_firma')
            @include('bajas.modals.baja_compu')
            @include('bajas.modals.baja_celular')
            @include('bajas.modals.baja_auto')
            @include('bajas.modals.baja_herra')
            @include('bajas.modals.baja_creden')
            @include('bajas.modals.pago_fin')
            @include('bajas.modals.info_check')
        </div>
    </div>
    <style type="text/css">
        .main-sidebar {
            z-index: 5px;
        }
        .common{
            min-width: 45px !important;
            max-width: 55px !important;
        }
        .id, .info{
            max-width: 30px !important;
        }
    </style>
    @php
        $cancel_baja = auth()->user()->can('access',[\App\User::class,'cancelar_bajas'])? 1:0;
        $cita_baja   = auth()->user()->can('access',[\App\User::class,'cita_baja'])? 1:0;
        $baja_compu  = auth()->user()->can('access',[\App\User::class,'baja_computo'])? 1:0;
        $baja_coche  = auth()->user()->can('access',[\App\User::class,'baja_coche'])? 1:0;
        $baja_cel    = auth()->user()->can('access',[\App\User::class,'baja_celular'])? 1:0;
        $baja_herra  = auth()->user()->can('access',[\App\User::class,'baja_herramientas'])? 1:0;
        $baja_crede  = auth()->user()->can('access',[\App\User::class,'baja_credencial'])? 1:0;
        $baja_rh     = auth()->user()->can('access',[\App\User::class,'baja_rh'])? 1:0;
        $baja_def    = auth()->user()->can('access',[\App\User::class,'baja_definitiva'])? 1:0;
        $ver_checks  = auth()->user()->can('access',[\App\User::class,'ver_autorizaciones'])? 1:0;
    @endphp
    <script>
        var cancel_baja = '<?php echo $cancel_baja ?>';
        var cita_baja   = '<?php echo $cita_baja ?>';
        var baja_compu  = '<?php echo $baja_compu ?>';
        var baja_coche  = '<?php echo $baja_coche ?>';
        var baja_cel    = '<?php echo $baja_cel   ?>';
        var baja_herra  = '<?php echo $baja_herra ?>';
        var baja_crede  = '<?php echo $baja_crede ?>';
        var baja_rh     = '<?php echo $baja_rh ?>';
        var baja_def    = '<?php echo $baja_def ?>';
        var area        = '<?php echo auth()->user()->getRol->Rol ?>';
        var ver_checks  = '<?php echo $ver_checks?>';
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
    {!! Html::script('js/empl_bajas/index.js') !!}
@endsection
