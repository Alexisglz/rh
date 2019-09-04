@extends('layouts.admin')


@section('contenido')

    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fa fa-plus"></i>
                {{__('AUTORIZAR AJUSTES DE SUELDO')}}
            </h3>
            <br>
            <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">

            <div class="form-inline" style="border-top: 1px solid #dfdfdf; padding-top: 10px;">
                <div class="form-group col-sm-1">
                    <input id="search_id" name="search_id" class="form-control col-sm-12" placeholder="ID" title="Buscar por ID">
                </div>
                <div class="form-group col-sm-2">
                    <input id="search_emp" name="search_emp" class="form-control col-sm-12" placeholder="Empleado" title="Buscar por Empleado">
                </div>
                <div class="form-group col-sm-2">
                    <select id="search_est" name="search_est" class="form-control col-sm-12" placeholder="Estatus" title="Buscar por estatus">
                        <option value="">{{__('Seleccione')}}</option>
                        <option value="SI">{{__('Enviado')}}</option>
                        <option value="NO">{{__('No enviado')}}</option>
                    </select>
                </div>
                <div class="col-sm">
                    <a id="reset" class="btn btn-primary btn-md pull-right" title="Reiniciar Filtros" style="color: white">
                        <i class="fa fa-refresh"></i>
                    </a>
                </div>
            </div>

        </div>
        <div class="card-body">
            <br>
            <table class="table table-active table-altas" width="100%" id="table_ajustes">
                <thead>
                <tr>
                    <th data-priority="1">{{__('ID')}}</th>
                    <th data-priority="2">{{__('AUTORIZAR')}}</th>
                    <th data-priority="3">{{__('EMPLEADO')}}</th>
                    <th>{{__('NUMERO EMP')}}</th>
                    <th>{{__('TRADICIONAL')}}</th>
                    <th>{{__('ASIMILADO')}}</th>
                    <th>{{__('FECHA INICIO SUELDO')}}</th>
                    <th>{{__('OBSERVACIONES')}}</th>
                    <th>{{__('FECHA SOLICITUD')}}</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>

    @php
        $validar = auth()->user()->can('access',[\App\User::class,'validar_ajuste_s'])? 1:0;
    @endphp
    <script>
        var validar = '{{ $validar }}';
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    {!! Html::script('js/validador.js') !!}
    {!! Html::script('js/ajustes/autorizar.js') !!}
    {!! Form::close() !!}

@endsection