@extends('layouts.admin')
@section('contenido')
    @php
        $p_noti  = auth()->user()->can('access',[\App\User::class,'notificaciones_usuarios'])? 1:0;
        $p_edit  = auth()->user()->can('access',[\App\User::class,'editar_usuarios'])? 1:0;
        $p_elim  = auth()->user()->can('access',[\App\User::class,'baja_usuarios'])? 1:0;
    @endphp
    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fa fa-plus"></i>
                {{__('LISTADO DE USUARIOS')}}
            </h3>
            @can('access',[\App\User::class,'exportar_usuarios'])
                <button id="excel" type="button" onclick="ExcelUsuarios();"
                        class="btn btn-success">{{__('Exportar')}}</button>
            @endcan
        </div>
        <div class="card-body">
            <table class="table table-bordered" style="width: 100%" id="index-table">
                <thead>
                <tr>
                    <th>{{__('Id')}}</th>
                    <th>{{__('Info')}}</th>
                    <th>{{__('Nombre')}}</th>
                    <th>{{__('Usuario')}}</th>
                    <th>{{__('Correo eléctronico')}}</th>
                    <th>{{__('Estatus')}}</th>
                    <th>{{__('Área')}}</th>
                    <th>{{__('Rol')}}</th>
                    <th>{{__('Acciones')}}</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>

    @include('usuarios.modals.editar')
    @include('usuarios.modals.notificaciones')
    @include('usuarios.modals.permisos')
    @include('usuarios.modals.info')

    <style type="">
        .table{
            font-size: 15px;
        }
        .alert-warning {
            text-align: center;
            padding: 4px;
            background-color: #9e9acc !important
        }

        .checkbox .checkbox-circle label::before {
            border-radius: 50% !important;
        }

        .checkbox-info input[type="checkbox"]:checked + label::before {
            background-color: #5bc0de !important;
            border-color: #5bc0de !important;
        }
    </style>


    @push('scripts')
        <script>
            var p_noti = '<?php echo $p_noti?>';
            var p_edit = '<?php echo $p_edit?>';
            var p_elim = '<?php echo $p_elim?>';
        </script>
    @endpush
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    {!! Html::script('js/validador.js?v='.time()) !!}
    {!! Html::script('js/usuarios/index.js?v='.time()) !!}
@endsection
