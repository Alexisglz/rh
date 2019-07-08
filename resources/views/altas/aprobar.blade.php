@extends('layouts.admin')

@section('contenido')
    <div class="card border-primary text-center">
        <div class="card-header bg-transparent border-primary">
            <h4 class="card-title text-primary">{{__('Aprobar o Rechazar Solicitud')}}</h4>
        </div>
        @if($solicitud['cita'] == null && $solicitud['Auth direccion'] == 'x')
            <div class="card-body">
                <form method="POST" action="{{route('altas.aprobar_dir',['id' => $solicitud->id])}}">
                    @csrf
                    <button id="tipo" name="tipo" value="autorizar"
                            class="card-link btn btn-success">{{__('AUTORIZAR')}}</button>
                    <button id="tipo" name="tipo" value="rechazar"
                            class="card-link btn btn-danger">{{__('CANCELAR')}}</button>
                </form>
            </div>
            <table class="table table-striped">
                <tbody>
                <tr>
                    <td class="bold">{{__('Recurso')}}:</td>
                    <td>{{$solicitud->Nombre}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('WBS')}}:</td>
                    <td>{{$solicitud->WBS}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Solicitante')}}:</td>
                    <td>{{$solicitud->Solicitante}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Sueldo Tradicional')}}:</td>
                    <td>{{'$ '.$solicitud['imss']}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Sueldo asimilado')}}:</td>
                    <td>{{'$ '.$solicitud['variable']}}</td>
                </tr>
                @if($solicitud->servicio == 'RREC' || $solicitud->servicio == 'POLZ' || $solicitud->servicio == 'TKBS' || $solicitud->servicio == 'SERV')
                    <tr>
                        <td class="bold">{{__('Venta')}}:</td>
                        <td>{{'$ '.$solicitud['venta']}}</td>
                    </tr>
                    <tr>
                        <td class="bold">{{__('Margen')}}:</td>
                        <td>{{$solicitud['margen'].'%'}}</td>
                    </tr>
                @endif
                <tr>
                    <td class="bold">{{__('Coordinador')}}:</td>
                    <td>{{$solicitud['coordinador']}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Puesto')}}:</td>
                    <td>{{$puesto->nombre_puesto}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Lugar de Trabajo')}}:</td>
                    <td>{{$estado->nombre}}</td>
                </tr>
                <tr>
                    <td class="bold">{{__('Motivo')}}:</td>
                    <td>{{$solicitud['motivo']}}</td>
                </tr>
                @if($solicitud->Computadora == 'SOLICITADO')
                <tr>
                    <td class="bold">{{__('Computadora')}}:</td>
                    <td>{{$solicitud['Computadora']}}</td>
                </tr>
                @endif
                @if($solicitud->Celular == 'SOLICITADO')
                <tr>
                    <td class="bold">{{__('Celular')}}:</td>
                    <td>{{$solicitud['Celular']}}</td>
                </tr>
                @endif
                @if($solicitud->Coche == 'SOLICITADO')
                <tr>
                    <td class="bold">{{__('Coche')}}:</td>
                    <td>{{$solicitud['Coche']}}</td>
                </tr>
                @endif
                @if($solicitud->Herramientas == 'SOLICITADO')
                <tr>
                    <td class="bold">{{__('Herramientas')}}:</td>
                    <td>{{$solicitud['Herramientas']}}</td>
                </tr>
                @endif
                <tr>
                    <td class="bold">{{__('Fecha de Solicitud')}}:</td>
                    <td>{{$solicitud['fecha solicitud']}}</td>
                </tr>
                @if($solicitud['curriculum_url'] != null)
                <tr>
                    <td class="bold">{{__('Curriculum:')}}</td>
                    <td>
                            <a href="/files/{{$solicitud['curriculum_url']}}" title="Descargar"><i
                                        class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>
                    </td>
                </tr>
                @endif
                @if($solicitud['vobo_url'] != null)
                <tr>
                    <td class="bold">{{__('Vo.Bo')}}:</td>
                    <td>
                        <a href="/files/{{$solicitud['vobo_url']}}" title="Descargar"><i class="fa fa-download"
                                                                                         style="color:#007bffcc;font-size:20px"></i></a>
                    </td>
                </tr>
                @endif
                @if($solicitud->servicio == 'RREC' || $solicitud->servicio == 'POLZ' || $solicitud->servicio == 'TKBS' || $solicitud->servicio == 'SERV')
                    <tr>
                        <td class="bold">{{__('Cotización')}}:</td>
                        <td>
                            @if($solicitud['cotizacion_url'] != null)
                                <a href="/files/{{$solicitud['cotizacion_url']}}" title="Descargar"><i
                                            class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">{{__('Caso de negocio')}}:</td>
                        <td>
                            @if($solicitud['caso_negocio_url'] != null)
                                <a href="/files/{{$solicitud['caso_negocio_url']}}" title="Descargar"><i
                                            class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>
                            @endif
                        </td>
                    </tr>
                @endif
                </tbody>
            </table>
        @else
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