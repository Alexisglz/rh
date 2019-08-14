@extends('layouts.admin')

@section('contenido')
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
                                <th>Incidencia</th>
                                <th>Empleado</th>
                                <th>Proyecto</th>
                                <th>Solicitante</th>
                                <th>Vobo</th>
                                <th>Venta</th>
                                <th>RO</th>
                                <th>Monto</th>
                                <th>Fecha Inicio Falta</th>
                                <th>Duración</th>
                                <th>Fecha de solicitud</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @php
        $inc_c_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_c_v'])? 1:0;
        $inc_s_v = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_s_v'])? 1:0;
        $inc_ded = auth()->user()->can('access',[\App\User::class,'aut_cancel_inci_dec'])? 1:0;
    @endphp
    <script>
        var inc_c_v     = '<?php echo $inc_c_v ?>';
        var inc_s_v     = '<?php echo $inc_s_v ?>';
        var inc_ded     = '<?php echo $inc_ded ?>';
    </script>
    {!! Html::script('js/incidencias/directivo.js') !!}
    <style>
        .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 20px; }
        .toggle.ios .toggle-handle { border-radius: 20px; }
    </style>
@endsection
