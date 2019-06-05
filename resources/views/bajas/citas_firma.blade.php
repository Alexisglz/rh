{{-- 
    MOD:JOSE LUIS MODIFICACIONES CREADA  PARA LAS CITAS PARA FIRMAS.
    10-11-18 SE AGREGA LA  DE USAURIOS  PUESTO QUE AUN NO SE SABEN LOS DATOS REQUERIDOS.
    
--}}

@extends('layouts.admin')
@section('contenido')
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <div class="row">
    </div>
    <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">
    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fa fa-plus"></i>
                Cita para firmas
            </h3>
        </div>
        <div class="card-body">
            <table class="table table-active table-altas table-responsive" id="citas-firma-table" style="width: 100%">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Autorizar Empleado</th>
                    <th>WBS</th>
                    <th>Nombre</th>
                    <th>Coordinador</th>
                    <th>Auth dirección</th>
                    <th>Auth RH</th>
                    <th>Fecha de cita</th>
                    <th>Hora de cita</th>
                    <th>Estatus de cita</th>
                    <th>Correo de cita</th>
                    <th>Detalles de cita</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>



    <!--MODAL PARA LLENAR DATOS COMPLEMENTARIOS DE EMPLEADOS-->
    <div class="modal fade" id="ModalDataEmpleado" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="width: 100%;text-align: center;">DATOS EMPLEADO</h5>
                </div>
                <form method="POST" aria-required="true">
                    <div class="modal-body">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <label>DATOS PERSONALES</label>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Nombre(s)</label>
                                        <input type="text" name="" class="form-control upper" required id="nombre">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">A.Paterno</label>
                                        <input type="text" name="" class="form-control upper" required id="apaterno">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">A.Materno</label>
                                        <input type="text" name="" class="form-control upper" required id="amaterno">
                                    </div>
                                </div>
                                <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Calle</label>
                                        <input type="text" name="" class="form-control upper" required id="calle">
                                    </div>
                                    <div class="col col-md-2">
                                        <label class="modalLabel"># Ext.</label>
                                        <input type="text" name="" class="form-control" required id="num_ext">
                                    </div>
                                    <div class="col col-md-2">
                                        <label class="modalLabel"># Int.</label>
                                        <input type="text" name="" class="form-control" id="num_int">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Colonia</label>
                                        <input type="text" name="" class="form-control upper" required id="colonia">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Del./Municipio</label>
                                        <input type="text" name="" class="form-control upper" required id="municipio">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">CP</label>
                                        <input type="number" name="" class="form-control" required id="cp">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Estado</label>
                                        <select class="form-control" id="estado" required>
                                            <option value="" selected>{{__('--SELECCIONE--')}}</option>
                                            @foreach($estados as $estado)
                                                <option value="{{$estado->nombre}}">{{$estado->nombre}}</option>
                                            @endforeach
                                        </select>
                                        <!--input type="text" name="" class="form-control" required id="estado"-->
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">NSS</label>
                                        <input type="text" name="" class="form-control" required id="nss">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">RFC</label>
                                        <input type="text" name="" class="form-control upper" required id="rfc">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">CURP</label>
                                        <input type="text" name="" class="form-control upper" required id="curp">
                                    </div>
                                </div>
                                <div class="row text-center">
                                    <div class="col col-md-12">
                                        <label id="validation_label" class="modalLabel"></label>
                                        <div class="row text-center" id="autollenado"  style="display: none;">
                                            <table class="table table-autollenado">
                                                <thead>
                                                    <tr>
                                                        <th>{{__('ID')}}</th>
                                                        <th>{{__('NOMBRE')}}</th>
                                                        <th>{{__('NSS')}}</th>
                                                        <th>{{__('RFC')}}</th>
                                                        <th>{{__('CURP')}}</th>
                                                        <th>{{__('ACCIONES')}}</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td><span id="auto_id"></span></td>
                                                    <td><span id="auto_nombre"></span></td>
                                                    <td><span id="auto_nss"></span></td>
                                                    <td><span id="auto_rfc"></span></td>
                                                    <td><span id="auto_curp"></span></td>
                                                    <td><a id="btn_auto" class="btn btn-primary btn-sm" style="color: white">{{__('Autollenar')}}</a></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">E-mail</label>
                                        <input type="email" name="" class="form-control" required id="email">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Tél. 1</label>
                                        <input type="tel" name="" class="form-control" required id="telefono1">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Tél. 2</label>
                                        <input type="tel" name="" class="form-control" id="telefono2">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <label>DATOS EN LA EMPRESA</label>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-1"></div>
                                    <div class="col col-md-2">
                                        <label class="modalLabel">Cliente:</label>
                                        <label id="cliente"></label>
                                        <!--select class="form-control" id="cliente"></select-->
                                    </div>
                                    <div class="col col-md-2">
                                        <label class="modalLabel">Servicio:</label>
                                        <label id="servicio"></label>
                                        <!--select class="form-control" id="servicio"></select-->
                                    </div>
                                    <div class="col col-md-2">
                                        <label class="modalLabel">Región:</label>
                                        <label id="region"></label>
                                        <!--select class="form-control" id="region"></select-->
                                    </div>
                                    <div class="col col-md-2">
                                        <label class="modalLabel">Tecnología:</label>
                                        <label id="tecnologia"></label>
                                        <!--select class="form-control" id="tecnologia"></select-->
                                    </div>
                                    <div class="col col-md-2">
                                        <label class="modalLabel">Grupo:</label>
                                        <label id="grupo"></label>
                                        <!--select class="form-control" id="grupo"></select-->
                                    </div>
                                    <div class="col-md-1"></div>
                                </div>
                                <div class="row text-center">
                                    <div class="col col-md-12">
                                        <label id="empleado_label" class="modalLabel"></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Fecha ingreso</label>
                                        <input type="date" name="" class="form-control" required id="fecha_ingreso">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel"># Empleado</label>
                                        <input type="number" name="" class="form-control" required id="num_empleado">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Empresa</label>
                                        <select class="form-control" name="empresa" id="empresa" class="required"
                                                required="">
                                            <option value="">--SELECCIONE--</option>
                                            <option value="INDEPLO">INDEPLO</option>
                                            <option value="EXTERNO">EXTERNO</option>
                                        </select>
                                        <!--input type="text" class="form-control" required id="empresa"-->
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Localidad</label>
                                        <select class="form-control" id="localidad" required name="localidad">
                                            @foreach($localidades as $localidad)
                                                <option value="{{$localidad}}">{{$localidad}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Segmento</label>
                                        <!--input type="text" class="form-control" id="segmento"-->
                                        <select class="form-control" required id="segmento">
                                            <option value="ADMINISTRATIVO">Administrativo</option>
                                            <option value="OPERATIVO">Operativo</option>
                                        </select>
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Coordinador</label>
                                        <select name="" class="form-control" required id="coordinador">
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">IND Alcatel</label>
                                        <input type="number" name="" class="form-control" required id="ind_alcatel" readonly>
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Proveedor</label>
                                        <select class="form-control" name="proveedor" id="proveedor" class="form-select"
                                                required="">
                                            <option value="">{{__('--SELECCIONE--')}}</option>
                                            @foreach($proveedores as $proveedor)
                                                <option value="{{$proveedor->id}}">{{$proveedor->nombre}}</option>
                                            @endforeach
                                        </select>
                                        <!--input type="text" class="form-control" required id="proveedor"-->
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Razon Social</label>
                                        <select class="form-control" name="razon_social" id="razon_social" class="form-select"
                                                required="">
                                            <option value="">{{__('--SELECCIONE--')}}</option>
                                            @foreach($razones as $razon)
                                                <option value="{{$razon->razon_id}}">{{$razon->razon_nombre}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Puesto</label>
                                        <select class="form-control" id="puesto" required>
                                            <option value="">{{__('--SELECCIONE--')}}</option>
                                            @foreach($puestos as $puesto)
                                                <option value="{{$puesto->id}}">{{$puesto->nombre_puesto}}</option>
                                                @endforeach
                                        </select>
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Sueldo IMSS</label>
                                        <input type="number" name="" class="form-control" required id="sueldo_imss">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Sueldo Asimilado</label>
                                        <input type="number" name="" class="form-control" required id="sueldo_variable">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Esquema</label>
                                        <select class="form-control" name="esquema" id="esquema">
                                            <option value="TRADICIONAL">TRADICIONAL</option>
                                            <option value="ASIMILADO">ASIMILADO</option>
                                            <option value="EFECTIVO">EFECTIVO</option>
                                            <option value="VIATICOS">VIATICOS</option>
                                        </select>
                                        <!--input type="esquema" class="form-control" required id="esquema"-->
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Esquema viaticos</label>
                                        <select class="form-control" name="esquema_viaticos" id="esquema_viaticos">
                                            <option value="TRADICIONAL">TRADICIONAL</option>
                                            <option value="ASIMILADO">ASIMILADO</option>
                                            <option value="EFECTIVO">EFECTIVO</option>
                                            <option value="VIATICOS">VIATICOS</option>
                                        </select>
                                        <!--input type="text" class="form-control" required id="esquema_viaticos"-->
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel"># Monex</label>
                                        <input type="number" name="" class="form-control" required id="num_monex">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">No.Cuenta</label>
                                        <input type="number" name="" class="form-control" required id="num_cuenta">
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Banco</label>
                                        <select class="form-control" name="banco" id="banco">
                                            <option>SANTANDER</option>
                                            <option>BANCOMER</option>
                                            <option>BANAMEX</option>
                                            <option>HSBC</option>
                                            <option>INBURSA</option>
                                            <option>BANORTE</option>
                                            <option>SCOTIABANK</option>
                                            <option>BANCO AZTECA</option>
                                            <option>BANCOPPEL</option>
                                            <option>BANJIO</option>
                                            <option>BANREGIO</option>
                                        </select>
                                        <!--input type="text" name="" class="form-control" required id="banco"-->
                                    </div>
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Clabe</label>
                                        <input type="number" name="" class="form-control" required id="clabe">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-4">
                                        <label class="modalLabel">Area</label>
                                        <select class="form-control" id="area" required>
                                            <option value="">{{__('--SELECCIONE--')}}</option>
                                            @foreach($areas as $area)
                                                <option value="{{$area}}">{{$area}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Observaciones</label>
                                        <textarea class="form-control upper" id="observaciones"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">Cerrar</button>
                        <button type="button" href="#" class="btn btn-xs btn-primary btnEnviar" value="0" onClick="saveEmpleado()"
                                id="enviar">Enviar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <style>
        .table-autollenado{
            max-width: 90%;
            margin-left: auto;
            margin-right: auto;
            font-size: 14px;
            text-align: center;
        }
        .table-autollenado thead th {
            border-bottom: 1px solid #1f64a7;
            border-top: 1px solid #1f64a7;
        }
        #validation_label{
            margin-top: 10px;
            color: #1f64a7;
            font-size: 15px;
            margin-bottom: 10px;
        }
        #empleado_label{
            margin-top: 10px;
            color: red;
            font-size: 15px;
            margin-bottom: 10px;
        }
    </style>
    @php
        $auth_emp = auth()->user()->can('access',[\App\User::class,'autorizar_empleado'])? 1:0;
    @endphp
    <script>
        var auth_emp = '<?php echo $auth_emp ?>';
    </script>
    {!! Html::script('js/sol_altas/citas_firma.js') !!}
    {!! Html::script('js/sol_altas/autollenado.js') !!}
@endsection