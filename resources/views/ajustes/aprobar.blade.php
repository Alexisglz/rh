@extends('layouts.admin')

@section('contenido')
    <div class="card border-primary text-center">
        <div class="card-header bg-transparent border-primary">
            <h4 class="card-title text-primary">{{__('Aprobar o Rechazar Incidencia')}}</h4>
        </div>
        @if($ajuste->estatus == 'solicitado')
            <div class="card-body">
                <form method="post" action="{{route('ajuste.save_aprobar',['id' => $ajuste->id])}}">
                    @csrf
                    <button id="accion" name="accion" value="autorizar"
                            class="card-link btn btn-success">{{__('AUTORIZAR')}}</button>
                    <button id="accion" name="accion" value="rechazar"
                            class="card-link btn btn-danger">{{__('RECHAZAR')}}</button>
                </form>
            </div>
            <table class="table table-striped">
                <tbody>
                <tr>
                    <td class="bold">{{__('Empleado:')}}</td>
                    <td>{{$ajuste->nombre}}</td>
                </tr>
                @if($ajuste->tradicional > 0)
                    <tr>
                        <td class="bold">{{__('Sueldo Tradicional:')}}</td>
                        <td>{{$ajuste->tradicional}}</td>
                    </tr>
                @endif
                @if($ajuste->asimilado > 0)
                    <tr>
                        <td class="bold">{{__('Sueldo Asimilado:')}}</td>
                        <td>{{$ajuste->asimilado}}</td>
                    </tr>
                @endif
                <tr>
                    <td class="bold">{{__('Risk Order:')}}</td>
                    <td>{{$ajuste->pedido}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Venta:')}}</td>
                    <td>{{$ajuste->monto}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Fecha de Solicitud:')}}</td>
                    <td>{{$ajuste->fecha}}</td>
                </tr>
                @if($ajuste->observaciones != "")
                    <tr>
                        <td class="bold">{{__('Observaciones:')}}</td>
                        <td>{{$ajuste->observaciones}}</td>
                    </tr>
                @endif
                </tbody>
            </table>
        @elseif($ajuste->estatus == 'rechazado' || $ajuste->estatus == 'cancelado')
            <div class="card-body text-danger">
                <h3>Esta solicitud ya fue rechazada</h3>
            </div>
        @elseif($ajuste->estatus == 'autorizado' || $ajuste->estatus == 'enviado')
            <div class="card-body text-success">

                <h3>Esta solicitud ya fue autorizada</h3>
            </div>
        @endif
    </div>
    <style>
        .bold {
            font-weight: bold;
        }
    </style>
@endsection