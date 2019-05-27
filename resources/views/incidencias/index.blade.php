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
                            <button id="excel" type="button" onclick="ExcelIncidencias();" class="btn btn-success">
                                {{__('Exportar a Excel')}}
                            </button>
                        @endcan
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-active text-center" id="incidencias-table" style="width: 100%">
                            <thead>
                            <tr>
                                <th>{{__('Id')}}</th>
                                <th>{{__('Bitacora')}}</th>
                                <th>{{__('Vobo Jefe')}}</th>
                                <th>{{__('Empleado')}}</th>
                                <th>{{__('Tipo de incidencia')}}</th>
                                <th>{{__('Fecha de solicitud')}}</th>
                                <th>{{__('Fecha inicio')}}</th>
                                <th>{{__('Duracion (Días)')}}</th>
                                <th>{{__('Monto')}}</th>
                                <th>{{__('RO')}}</th>
                                <th>{{__('Solicitante')}}</th>
                                <th>{{__('Motivo')}}</th>
                                <th>{{__('Lote')}}</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    {!! Html::script('js/MensajesJS.js') !!}
    {!! Html::script('js/incidencias/index.js') !!}
@endsection