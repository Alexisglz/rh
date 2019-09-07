@extends('layouts.admin')

@section('contenido')
    <div class="card border-primary text-center">
        <div class="card-header bg-transparent border-primary">
            <h4 class="card-title text-primary">{{__('Aprobar o Rechazar Incidencia')}}</h4>
        </div>
        @if($incidencia->estatus == 'SOLICITADO')
            <div class="card-body">
                <form method="post" action="{{route('incidencias.save_aprobar',['id' => $incidencia->id])}}">
                    @csrf
                    <button id="tipo" name="tipo" value="autorizar"
                            class="card-link btn btn-success">{{__('AUTORIZAR')}}</button>
                    <button id="tipo" name="tipo" value="rechazar"
                            class="card-link btn btn-danger">{{__('RECHAZAR')}}</button>
                </form>
            </div>
            <table class="table table-striped">
                <tbody>
                <tr>
                    <td class="bold">{{__('Empleado:')}}</td>
                    <td>{{$incidencia->empleado}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Incidencia:')}}</td>
                    <td>{{$incidencia->incidencia}}</td>
                </tr>
                @if($incidencia->monto != null)
                    <tr>
                        <td class="bold">{{__('Monto:')}}</td>
                        <td>{{$incidencia->monto}}</td>
                    </tr>
                @endif
                @if($incidencia->fecha_inicio != null)
                    <tr>
                        <td class="bold">{{__('Fecha Inicio:')}}</td>
                        <td>{{$incidencia->fecha_inicio}}</td>
                    </tr>
                @endif
                @if($incidencia->duracion != null)
                    <tr>
                        <td class="bold">{{__('Dias:')}}</td>
                        <td>{{$incidencia->duracion}}</td>
                    </tr>
                @endif
                <tr>
                    <td class="bold">{{__('Motivo:')}}</td>
                    <td>{{$incidencia->motivo}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Tipo de Incidencia:')}}</td>
                    <td>{{$incidencia->tipo_incidencia}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Venta:')}}</td>
                    <td>{{$incidencia->venta}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Solicitante:')}}</td>
                    <td>{{$incidencia->solicitante}}</td>
                </tr>
                @if($incidencia->evidencia != null)
                <tr>
                    <td class="bold">{{__('Evidencia:')}}</td>
                    <td><a class="btn" href="/files/{{$incidencia->evidencia}}"><i class="fa fa-download"></i></a></td>
                </tr>
                @endif
                @if($incidencia->pedido != null)
                <tr>
                    <td class="bold">{{__('Risk Order:')}}</td>
                    <td>{{$incidencia->pedido}}</td>
                </tr>
                @endif
                @if($incidencia->proyecto != null)
                <tr>
                    <td class="bold">{{__('WBS:')}}</td>
                    <td>{{$incidencia->proyecto}}</td>
                </tr>
                @endif
                </tbody>
            </table>
        @elseif($incidencia->estatus == 'CANCELAR')
            <div class="card-body text-danger">
                <h3>Esta Incidencia ya fue rechazada</h3>
            </div>
        @else
            <div class="card-body text-success">

                <h3>Esta Incidencia ya fue autorizada</h3>
            </div>
        @endif
    </div>
    <style>
        .bold {
            font-weight: bold;
        }
    </style>
@endsection