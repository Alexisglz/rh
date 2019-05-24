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
                        <table class="table table-active" id="incidencias-table" style="width: 100%">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Bitacora</th>
                                <th>Vobo Jefe</th>
                                <th>Empleado</th>
                                <th>Tipo de incidencia</th>
                                <th>Fecha de solicitud</th>
                                <th>Fecha inicio</th>
                                <th>Fecha fin</th>
                                <th>Duracion</th>
                                <th>Monto</th>
                                <th>RO</th>
                                <th>Solicitante</th>
                                <th>Motivo</th>
                                <th>Lote</th>
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