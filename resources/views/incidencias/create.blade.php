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
                    <h3 class="card-title">
                        <i class="fa fa-plus"></i>
                        {{__('Solicitar incidencia')}}
                    </h3>
                </div>
                <div class="card-body form-group">
                    {!! Form::open(['route'=>'incidencias.store','method'=>'post','files'=>true,'enctype'=>"multipart/form-data"]) !!}

                    {!! Form::token() !!}

                    {!! Form::label('empleado', '*Empleado:', []) !!}
                    {!! Form::text('empleado', null, ['class'=>'form-control','id'=>'empleado','required']) !!}
                    {!! Form::hidden('id_empleado', null, ['id'=>'id_empleado']) !!}

                    {!! Form::label('tipo', '*Concepto de la incidencia:', []) !!}
                    <select name="tipo" class="custom-select tipo" id="tipo" required>
                        <option value="">{{__('Selecciona el concepto')}}</option>
                       <option value="PERCEPCION">{{__('Percepcion')}}</option>
                       <option value="DEDUCCION">{{__('Deduccion')}}</option>
                    </select>

                    <div id="div_esquema">
                        {!! Form::label('tipo', '*Tipo de esquema:', []) !!}
                        <select name="esquema" class="custom-select tipo" id="esquema" required>
                            <option value="">{{__('Selecciona el esquema')}}</option>
                            @if($tradicional == 1)
                                <option value="TRADICIONAL">{{__('Tradicional')}}</option>
                            @endif
                            @if($asimilado == 1)
                                <option value="ASIMILADOS">{{__('Asimilado')}}</option>
                            @endif
                        </select>
                    </div>

                    <div id="div_incidencia">
                        {!! Form::label('incidencia', '*Incidencia:', []) !!}
                        <select name="incidencia" class="custom-select tipo" id="incidencia" required>
                        </select>
                    </div>

                    <div id="div_risk" style="display:none;">
                        {!! Form::label('risk', '*Risk Order:', []) !!}
                        {!! Form::text('risk', null, ['class'=>'form-control','id'=>'risk']) !!}
                        {!! Form::hidden('id_risk', null, ['id'=>'id_risk']) !!}
                    </div>

                    {!! Form::hidden('tratamiento', null, ['class'=>'tratement']) !!}

                    {!! Form::label('motivo', '*Motivo', []) !!}
                    {!! Form::textarea('motivo', null, ['class'=>'form-control','required','rows' => '5']) !!}
                    <br>

                    {!! Form::label('vobo', 'Vo.Bo. Jefe: '); !!}
                    <br>
                    {!! Form::file('vobo') !!}

                    <br>
                    {!! Form::label('fecha_i', 'Fecha de inicio', ['class'=>'lapso']) !!}
                    {!! Form::date('fecha_i', \Carbon\Carbon::now(), ['class'=>'lapso form-control','required']) !!}

                    {!! Form::label('dias', 'Numero de dias', ['class'=>'dias']) !!}
                    {!! Form::number('dias', null, ['class'=>'dias form-control','min'=>'1']) !!}

                    {!! Form::label('monto', 'monto', ['class'=>'monto']) !!}
                    {!! Form::number('monto', 0, ['class'=>'monto form-control','required','step'=>"any"]) !!}
                    <br>

                    {!! Form::submit('Guardar', ['class'=>'btn btn-primary']) !!}
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>

    {!! Html::script('js/incidencias/nueva.js') !!}

@endsection