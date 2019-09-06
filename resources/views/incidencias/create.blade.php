@extends('layouts.admin')

@section('contenido')
    @php
        if (count($errors) > 0){
            alert()->warning('¡Atencion!',$errors)->showConfirmButton('Aceptar', '#3085d6');;
        }
        $tradicional = auth()->user()->can('access',[\App\User::class,'ver_tradicional_inci'])? 1:0;
        $asimilado   = auth()->user()->can('access',[\App\User::class,'ver_asimilados_inci'])? 1:0;
    @endphp
    <div class="row">
        <div class="col-12">
            <div class="card card-primary card-outline">
                <div class="card-header">

                    <table class="table">
                        <tr>
                            <th><h3 class="card-title">
                                    <i class="fa fa-plus"></i>
                                    {{__('Solicitar incidencia')}}
                                </h3></th>
                            <th>
                                <button title="Calendario de Incidencias" type="button" class="btn btn-primary pull-right" id="abrir_cal" data-toggle="modal"
                                        data-target="#modal_calendario" name="abrir_cal"><i class="fa fa-calendar"></i>
                                </button>
                            </th>
                        </tr>
                    </table>


                </div>
                <div class="card-body form-group">
                <!--div class="form-row">
                        <h5 class="text-danger">{{__('El proceso para el periodo de incidencias del 06-06-2019 al 17-07-2019 se va a
                        realizar como hasta el momento se hace por cuestiones de coordinacion de informacion con el sistema de Capital.')}}</h5>
                        <br><h5 class="text-danger">{{__('*TODAS LAS INCIDENCIAS QUE SE SUBAN AL SISTEMA SERAN CONSIDERADAS COMO PRUEBA*')}}</h5>
                    </div-->
                    @if($periodo == null)
                        <div class="row text-center">
                            <h3 style="color: red;">{{__('El dia de hoy no se reciben incidencias')}}</h3>
                        </div>
                    @endif
                    {!! Form::open(['id'=>'form_incidencia','route'=>'incidencias.store','method'=>'post','files'=>true,'enctype'=>"multipart/form-data"]) !!}

                    {!! Form::token() !!}
                    <div id="div_inc">
                        {!! Form::label('empleado', '*Empleado:', []) !!}
                        {!! Form::text('empleado', null, ['class'=>'form-control upper','id'=>'empleado','required']) !!}
                        {!! Form::hidden('id_empleado', null, ['id'=>'id_empleado']) !!}

                        {!! Form::label('tipo', '*Concepto de la incidencia:', []) !!}
                        <select name="tipo" class="custom-select tipo" id="tipo" required>
                            <option value="">{{__('Selecciona el concepto')}}</option>
                            <option value="PERCEPCION">{{__('Percepcion')}}</option>
                            <option value="DEDUCCION">{{__('Deduccion')}}</option>
                        </select>

                        <div id="div_incidencia">
                            {!! Form::label('incidencia', '*Incidencia:', []) !!}
                            <select name="incidencia" class="custom-select tipo" id="incidencia" required>
                            </select>
                        </div>

                        <div id="div_risk" style="display:none;">
                            {!! Form::label('risk', '*Risk Order:', []) !!}
                            {!! Form::text('risk', null, ['class'=>'form-control','id'=>'risk','autocomplete' => 'off']) !!}
                            {!! Form::hidden('id_risk', null, ['id'=>'id_risk']) !!}
                        </div>

                        {!! Form::hidden('tratamiento', null, ['class'=>'tratement']) !!}

                        {!! Form::label('motivo', '*Motivo', []) !!}
                        {!! Form::textarea('motivo', null, ['class'=>'form-control upper','required','rows' => '5']) !!}
                        <br>
                        {!! Form::label('evidencia', 'Evidencia'); !!}
                        <br>
                        {!! Form::file('evidencia') !!}
                        <br>

                        {!! Form::label('fecha_i', 'Fecha de inicio', ['class'=>'lapso']) !!}
                        {!! Form::date('fecha_i', \Carbon\Carbon::now(), ['id'=>'fecha_i','class'=>'lapso form-control','required']) !!}

                        {!! Form::label('dias', 'Numero de dias', ['class'=>'dias']) !!}
                        {!! Form::number('dias', null, ['id'=>'dias','class'=>'dias form-control','min'=>'1']) !!}

                        <!--div id="div_monto">
                            <label for="tipo_monto">Tipo de cantidad</label>
                            <select id="tipo_monto" class="custom-select" name="tipo_monto">
                                <option value="">Seleccione</option>
                                <option value="monto">Monto</option>
                                <option value="horas">Horas</option>
                            </select>
                        </div-->
                        {!! Form::label('monto', 'Monto', ['class'=>'monto']) !!}
                        {!! Form::number('monto', null, ['id'=>'monto','class'=>'monto form-control','required','min'=>0,'step'=>"any"]) !!}
                        <!--{!! Form::label('horas', 'Horas', ['class'=>'horas']) !!}
                        {!! Form::number('horas', null, ['id'=>'horas','class'=>'horas form-control','required','min'=>0]) !!}-->
                        <br>

                        <br>
                    </div>
                    @if($periodo != null)
                        {!! Form::submit('Guardar', ['class'=>'btn btn-primary', 'style'=>'margin-top: 3%;', 'id'=> 'save_inci']) !!}
                    @endif
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
    @include('incidencias.modals.calendario')
    {!! Html::script('js/validador.js?v='.time()) !!}
    {!! Html::script('js/incidencias/nueva.js') !!}

@endsection
