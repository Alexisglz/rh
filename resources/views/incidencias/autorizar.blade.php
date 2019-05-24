@extends('layouts.admin')

@section('contenido')
    @if(Auth::check())

    @endif
    {!! Html::style('plugins/bootstrap-toggle/css/bootstrap-toggle.min.css') !!}
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">
                <!-- interactive chart -->

                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fa fa-check"></i>
                            Incidencias-autorizar
                        </h3>
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-active" style="font-size:12px;text-align: center; width: 100%;"
                               id="incidencias-table">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Info</th>
                                <th>Bitacora</th>
                                <th>Vobo</th>
                                <th>Autorizar</th>
                                <th>Autorizar</th>
                                <th>Autorizar</th>
                                <th>Empleado</th>
                                <th>Incidencia</th>
                                <th>Solicitante</th>
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
    <!--modal-->
    <!-- Modal -->
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
                <div class="modal-body body-permisos">
                    <div class="card-body">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <style>
    </style>
    @php
        $auth_cancel = auth()->user()->can('access',[\App\User::class,'aut_cancel_incidencia'])? 1:0;
        $inc_c_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_c_v'])? 1:0;
        $inc_s_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_s_v'])? 1:0;
        $inc_ded = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_dec'])? 1:0;
    @endphp
    <script>
        var auth_cancel = '<?php echo $auth_cancel ?>';
        var inc_c_v     = '<?php echo $inc_c_v ?>';
        var inc_s_v     = '<?php echo $inc_s_v ?>';
        var inc_ded     = '<?php echo $inc_ded ?>';
        var area        = '<?php echo auth()->user()->getRol->Rol ?>';
    </script>
    <style>
        .iconInfo{
            font-size: 15px;
        }
        .iconBitacora{
            font-size: 16px;
        }
    </style>
    {!! Html::script('js/incidencias/autorizar.js') !!}
@endsection