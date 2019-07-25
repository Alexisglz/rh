<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{__('Editar Empleado')}}</h5>
            </div>
            <form id="editar_emp">
                <div class="modal-body body-permisos">
                    <legend>{{__('Datos personales')}}</legend>
                    <div class="form-row">
                        <div id="e_id" class="form-group col-md-4">
                            <label for="eid">{{__('ID')}}</label>
                            <input class="form-control" name="eid" type="text" id="eid"
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="enombre">{{__('Nombre(s):')}}</label>
                            <input class="form-control" name="enombre" type="text" id="enombre"
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="eapaterno">{{__('A. Paterno:')}}</label>
                            <input class="form-control" name="eapaterno" type="text" id="eapaterno"
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="eamaterno">{{__('A. Materno:')}}</label>
                            <input class="form-control" class="validar" name="eamaterno" type="text" id="eamaterno"
                                    maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="ecalle">{{__('Calle:')}}</label>
                            <input class="form-control" name="ecalle" type="text" id="ecalle"
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="eno_exterior">{{__('# Ext:')}}</label>
                            <input class="form-control" name="eno_exterior" type="text" min="0" maxlength="20"
                                   size="20" id="eno_exterior"  maxlength="200" size="6" value="">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="ecalle">{{__('# Int:')}}</label>
                            <input class="form-control" name="eno_interior" type="text" min="0" maxlength="20"
                                   size="20" id="eno_interior" maxlength="200" size="6" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="ecolonia">{{__('Colonia:')}}</label>
                            <input class="form-control" name="rcolonia" type="text" id="ecolonia"
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="emunicipio">{{__('Del./Municipio:')}}</label>
                            <input class="form-control" name="emunicipio" type="text" id="emunicipio"
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="ecp">{{__('CP:')}}</label>
                            <input class="form-control" name="ecp" type="number" id="ecp"  maxlength="200"
                                   size="10" value="">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="eestado">{{__('Estado:')}}</label>
                            <select class="form-control" id="eestado" name="eestado">
                                @foreach($estados as $estado)
                                    <option value="{{strval($estado)}}">{{$estado}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-md-12">
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col col-md-2">
                                    <label class="modalLabel">{{__('Cliente:')}}</label>
                                    <label id="lcliente"></label>
                                </div>
                                <div class="col col-md-2">
                                    <label class="modalLabel">{{__('Servicio:')}}</label>
                                    <label id="lservicio"></label>
                                </div>
                                <div class="col col-md-2">
                                    <label class="modalLabel">{{__('Región:')}}</label>
                                    <label id="lregion"></label>
                                </div>
                                <div class="col col-md-2">
                                    <label class="modalLabel">{{__('Tecnología:')}}</label>
                                    <label id="ltecnologia"></label>
                                </div>
                                <div class="col col-md-2">
                                    <label class="modalLabel">{{__('Grupo:')}}</label>
                                    <label id="lgrupo"></label>
                                </div>
                                <div class="col-md-1"></div>
                            </div>
                        </div>
                        <div class="border border-info form-group col-md-12">
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="enss">{{__('NSS:')}}</label>
                                    <input class="form-control" name="enss" type="text" id="enss"
                                           class="validar nueva"  maxlength="200" size="20" value="">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="erfc">{{__('RFC:')}}</label>
                                    <input class="form-control" name="erfc" type="text" id="erfc"
                                           class="nueva"  maxlength="200" size="20" value="">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="ecurp">{{__('CURP:')}}</label>
                                    <input class="form-control" name="ecurp" type="text" id="ecurp"
                                           class="nueva"  maxlength="200" size="20" value=""></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="email">{{__('E-mail:')}}</label>
                            <input class="form-control" name="email" id="email" type="email" maxlength="200"
                                   value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="etelefono">{{__('Tél. 1:')}}</label>
                            <input type="number" class="form-control" name="etelefono" id="etelefono" maxlength="200"
                                   value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="etelefono2">{{__('Tél. 2:')}}</label>
                            <input type="number" class="form-control" name="etelefono2" id="etelefono2" maxlength="200"
                                   value="">
                        </div>
                    </div>
                    <table class="table table-responsive" id="id_tabla">
                        <tbody>
                        <tr>
                            <td>{{__('Fecha ingreso:')}}</td>
                            <td>
                                <input class="form-control" name="efecha_ingreso"  id="efecha_ingreso"
                                       type="date" class="required hasDatepicker" maxlength="200" value="">
                            </td>
                            <td>{{__('# Empleado:')}}</td>
                            <td>
                                <span id="num_emp_reac"></span>
                                <input class="form-control" name="eempleado" id="eempleado" type="number" min="0"
                                       maxlength="20" size="20" class="validar unique_num" size="15" value=""
                                      >
                            </td>
                        </tr>
                        <tr class="ocultar_tr">
                            <td>{{__('Empresa:')}}</td>
                            <td>
                                <select class="form-control" name="eempresa" id="eempresa"
                                        >
                                    <option value="">--SELECCIONE--</option>
                                    <option value="INDEPLO">INDEPLO</option>
                                    <option value="EXTERNO">EXTERNO</option>
                                </select>
                            </td>
                            <td>{{__('Localidad:')}}</td>
                            <td>
                                <select class="form-control" id="elocalidad" name="elocalidad">
                                    <option value="CUAUTITLAN">CUAUTITLAN</option>
                                    @foreach($localidades as $localidad)
                                        <option value="{{$localidad}}">{{$localidad}}</option>
                                    @endforeach
                                </select>
                        </tr>
                        <tr class="ocultar_tr">
                            <td>{{__('Segmento:')}}</td>
                            <td><select class="form-control" name="esegmento" id="esegmento">
                                    <option>{{__('ADMINISTRATIVO')}}</option>
                                    <option>{{__('OPERATIVO')}}</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>{{__('Coordinador:')}}</td>
                            <td>
                                <div id="div_coord" class="form-inline">
                                    <span class="col-md-8" id="spn_coord"></span>
                                    <a id="show_edit_coord" class="btn-primary btn-sm" style="color: white;">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                </div>
                                <div id="editar_coord" style="display: none;">
                                    {!! Form::select('coordinadores',$coordinadores,null,['class'=>'form-control','data-id'=>'coordinadores','id'=>'ecoordinadores','placeholder'=>'--SELECCIONE--']) !!}
                                    <label for="fin_coord">{{__('Fecha Fin')}}</label>
                                    <input class="form-control" id="fin_coord" name="fin_coord" type="date" placeholder="Fecha Fin">
                                    <label for="ini_coord">{{__('Fecha Inicio')}}</label>
                                    <input class="form-control" id="ini_coord" name="ini_coord" type="date" placeholder="Fecha Inicio">
                                    <div class="pull-right col-md-4" style="margin-top: 5px;">
                                        <a id="cancel_coord" title="Cancelar" class="btn btn-danger btn-sm pull-left" style="color:white;width:35%">
                                            <i class="fa fa-close"></i>
                                        </a>
                                        <a id="save_coord" title="Guardar" class="btn btn-success btn-sm pull-right" style="color: white;">
                                            <i class="fa fa-save"></i>
                                        </a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>{{__('IND')}} <strong>{{__('Alcatel')}}</strong>:</td>
                            <td>
                                <input class="form-control" readonly name="eind_val" id="eind_val" type="text" maxlength="200"
                                       size="9" value="">
                            </td>
                            <td>{{__('Proveedor:')}}</td>
                            <td>
                                <select class="form-control" name="eproveedor" id="eproveedor" class="form-select"
                                      >
                                    <option value="0">{{__('--SELECCIONE--')}}</option>
                                    @foreach($proveedores as $proveedor)
                                        <option value="{{$proveedor->id}}" @if($proveedor->id == 1) selected="selected" @endif>{{$proveedor->nombre}}</option>
                                    @endforeach
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>{{__('Razon Social:')}}</td>
                            <td colspan="3">
                                <select class="form-control" name="erazon_rh" id="erazon_rh" class="form-select"
                                      >
                                    <option value="">{{__('--SELECCIONE--')}}</option>
                                    @foreach($razones as $razon)
                                        <option value="{{$razon->razon_id}}">{{$razon->razon_nombre}}</option>
                                    @endforeach
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>{{__('Puesto:')}}</td>
                            <td colspan="3">
                                <select class="form-control" name="epuesto" id="epuesto" disabled>
                                    <option value="">{{__('--SELECCIONE--')}}</option>
                                    @foreach($puestos as $puesto)
                                        <option value="{{$puesto->id}}">{{$puesto->nombre_puesto}}</option>
                                    @endforeach
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>{{__('Sueldo')}}</td>
                            <td colspan="3">
                                <div id="sueldo_form" class="form-group col-md-12">
                                    <div class="form-row">
                                        <div class="form-group col-md-5">
                                            <strong>{{__('IMSS:')}}</strong>
                                            <input disabled class="form-control" name="esueldo_imss"
                                                   id="esueldo_imss" class="solo_numeros" type="number"
                                                   maxlength="200" value="0.00">
                                        </div>
                                        <div class="form-group col-md-5">
                                            <strong>{{__('Asimilado:')}}</strong>
                                            <input disabled class="form-control" name="esueldo_asimilado"
                                                   class="solo_numeros" id="esueldo_asimilado" type="number"
                                                   maxlength="200" value="0.00">
                                        </div>
                                        <div class="form-group col-md-1">
                                            <label></label>
                                            <a id="show_edit_sueldo" class="btn btn-primary" style="color:white;"><i class="fa fa-edit"></i></a>
                                        </div>
                                    </div>
                                    <div id="div_sueldo" style="display:none;">
                                        <div class="form-row">
                                            <div class="form-group col-md-5">
                                                <strong>{{__('IMSS Bruto:')}}</strong>
                                                <input class="form-control" name="imss_bruto" id="imss_bruto" type="number"
                                                       maxlength="200">
                                            </div>
                                            <div class="form-group col-md-5">
                                                <strong>{{__('Asimilado Bruto:')}}</strong>
                                                <input class="form-control" name="asimilado_bruto" id="asimilado_bruto" type="number"
                                                       maxlength="200">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-5">
                                                <strong>{{__('Fecha Fin Sueldo:')}}</strong>
                                                <input class="form-control" name="fin_sueldo" id="fin_sueldo" type="date"
                                                       maxlength="200">
                                            </div>
                                            <div class="form-group col-md-5">
                                                <strong>{{__('Fecha Inicio Sueldo:')}}</strong>
                                                <input class="form-control" name="ini_sueldo" id="ini_sueldo" type="date"
                                                       maxlength="200">
                                            </div>
                                            <div class="form-group col-md-1">
                                                <label></label>
                                                <a id="cancel_sueldo" title="Cancelar" class="btn btn-danger" style="color:white;"><i class="fa fa-close"></i></a>
                                            </div>
                                            <div class="form-group col-md-1">
                                                <label></label>
                                                <a id="save_sueldo" title="Guardar" class="btn btn-success" style="color:white;"><i class="fa fa-save"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr  class="ocultar_tr">

                            <td colspan="4">
                                {{__('Esquema:')}}
                                <select class="form-control" name="eesquema" id="eesquema">
                                    <option value="TRADICIONAL">{{__('TRADICIONAL')}}</option>
                                    <option value="ASIMILADO">{{__('ASIMILADO')}}</option>
                                    <option value="EFECTIVO">{{__('EFECTIVO')}}</option>
                                    <option value="VIATICOS">{{__('VIATICOS')}}</option>
                                </select>
                                {{__('Esquema Viaticos:')}}
                                <select class="form-control" name="eesquema_viaticos" id="eesquema_viaticos">
                                    <option value="TRADICIONAL">{{__('TRADICIONAL')}}</option>
                                    <option value="ASIMILADO">{{__('ASIMILADO')}}</option>
                                    <option value="EFECTIVO">{{__('EFECTIVO')}}</option>
                                    <option value="VIATICOS">{{__('VIATICOS')}}</option>
                                </select>
                            </td>



                        </tr>
                        <tr class="ocultar_tr">
                            <td>{{__('# Monex:')}}</td>
                            <td><input class="form-control" id="emonex" name="emonex" class="solo_numeros"
                                       type="number" min="0" maxlength="20" size="20" value=""></td>
                            <td>{{__('No.Cuenta:')}}</td>
                            <td><input class="form-control" name="enum_cuenta" id="enum_cuenta" type="number"
                                       min="0" maxlength="20" size="20" value=""></td>
                        </tr>
                        <tr class="ocultar_tr">
                            <td>
                                {{__('BANCO:')}}
                            </td>
                            <td>
                                <select class="form-control" name="ebanco" id="ebanco">
                                    <option>{{__('SANTANDER')}}</option>
                                    <option>{{__('BANCOMER')}}</option>
                                    <option>{{__('BANAMEX')}}</option>
                                    <option>{{__('HSBC')}}</option>
                                    <option>{{__('INBURSA')}}</option>
                                    <option>{{__('BANORTE')}}</option>
                                    <option>{{__('SCOTIABANK')}}</option>
                                    <option>{{__('BANCO AZTECA')}}</option>
                                    <option>{{__('BANCOPPEL')}}</option>
                                    <option>{{__('BANJIO')}}</option>
                                    <option>{{__('BANREGIO')}}</option>
                                </select>
                            </td>
                            <td>
                                {{__('CLABE:')}}
                            </td>
                            <td>
                                <input class="form-control" name="eclabe" id="eclabe" type="number" min="0"
                                       maxlength="20" size="20" value="">
                            </td>
                        </tr>
                        <tr class="ocultar_tr">
                            <td>{{__('Observaciones:')}}</td>
                            <td colspan="4">
                                    <textarea id="eobservaciones" class="form-control" name="eobservaciones" rows="1"
                                              cols="30"></textarea></td>
                        </tr>
                        <input hidden id="mov_coord_id" name="mov_coord_id">
                        <input hidden id="mov_proy_id" name="mov_proy_id">
                        <input hidden id="mov_pues_id" name="mov_pues_id">
                        <input hidden id="mov_rec_id" name="mov_rec_id">
                        <input hidden id="mov_suel_id" name="mov_suel_id">
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button id="cerrar" onclick="refreshTable();" type="button" class="btn btn-secondary" data-dismiss="modal">{{__('Cerrar')}}</button>
                    <button id="save" type="button" onclick="validaFormEditar();" class="btn btn-primary">{{__('Guardar')}}</button>
                </div>
            </form>
        </div>
    </div>
</div>
