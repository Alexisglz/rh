<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><?php echo e(__('Editar Empleado')); ?></h5>
            </div>
            <form id="editar_emp">
                <div class="modal-body body-permisos">
                    <legend><?php echo e(__('Datos personales')); ?></legend>
                    <div class="form-row">
                        <div id="e_id" class="form-group col-md-4">
                            <label for="eid"><?php echo e(__('ID')); ?></label>
                            <input class="form-control" name="eid" type="text" id="eid" required=""
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="enombre"><?php echo e(__('Nombre(s):')); ?></label>
                            <input class="form-control" name="enombre" type="text" id="enombre" required=""
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="eapaterno"><?php echo e(__('A. Paterno:')); ?></label>
                            <input class="form-control" name="eapaterno" type="text" id="eapaterno" required=""
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="eamaterno"><?php echo e(__('A. Materno:')); ?></label>
                            <input class="form-control" class="validar" name="eamaterno" type="text" id="eamaterno"
                                   required="" maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="ecalle"><?php echo e(__('Calle:')); ?></label>
                            <input class="form-control" name="ecalle" type="text" id="ecalle" required=""
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="eno_exterior"><?php echo e(__('# Ext:')); ?></label>
                            <input class="form-control" name="eno_exterior" type="text" min="0" maxlength="20"
                                   size="20" id="eno_exterior" required="" maxlength="200" size="6" value="">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="ecalle"><?php echo e(__('# Int:')); ?></label>
                            <input class="form-control" name="eno_interior" type="text" min="0" maxlength="20"
                                   size="20" id="eno_interior" maxlength="200" size="6" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="ecolonia"><?php echo e(__('Colonia:')); ?></label>
                            <input class="form-control" name="rcolonia" type="text" id="ecolonia" required=""
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="emunicipio"><?php echo e(__('Del./Municipio:')); ?></label>
                            <input class="form-control" name="emunicipio" type="text" id="emunicipio" required=""
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="ecp"><?php echo e(__('CP:')); ?></label>
                            <input class="form-control" name="ecp" type="text" id="ecp" required="" maxlength="200"
                                   size="10" value="">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="eestado"><?php echo e(__('Estado:')); ?></label>
                            <select class="form-control" id="eestado" name="eestado">
                                <?php $__currentLoopData = $estados; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $estado): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e(strval($estado)); ?>"><?php echo e($estado); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                        <div class="form-group col-md-12">
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col col-md-2">
                                    <label class="modalLabel"><?php echo e(__('Cliente:')); ?></label>
                                    <label id="lcliente"></label>
                                </div>
                                <div class="col col-md-2">
                                    <label class="modalLabel"><?php echo e(__('Servicio:')); ?></label>
                                    <label id="lservicio"></label>
                                </div>
                                <div class="col col-md-2">
                                    <label class="modalLabel"><?php echo e(__('Región:')); ?></label>
                                    <label id="lregion"></label>
                                </div>
                                <div class="col col-md-2">
                                    <label class="modalLabel"><?php echo e(__('Tecnología:')); ?></label>
                                    <label id="ltecnologia"></label>
                                </div>
                                <div class="col col-md-2">
                                    <label class="modalLabel"><?php echo e(__('Grupo:')); ?></label>
                                    <label id="lgrupo"></label>
                                </div>
                                <div class="col-md-1"></div>
                            </div>
                        </div>
                        <div class="border border-info form-group col-md-12">
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="enss"><?php echo e(__('NSS:')); ?></label>
                                    <input class="form-control" name="enss" type="text" id="enss"
                                           class="validar nueva" required="" maxlength="200" size="20" value="">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="erfc"><?php echo e(__('RFC:')); ?></label>
                                    <input class="form-control" name="erfc" type="text" id="erfc"
                                           class="nueva" required="" maxlength="200" size="20" value="">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="ecurp"><?php echo e(__('CURP:')); ?></label>
                                    <input class="form-control" name="ecurp" type="text" id="ecurp"
                                           class="nueva" required="" maxlength="200" size="20" value=""></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="email"><?php echo e(__('E-mail:')); ?></label>
                            <input class="form-control" name="email" id="email" type="email" maxlength="200"
                                   value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="etelefono"><?php echo e(__('Tél. 1:')); ?></label>
                            <input type="tel" class="form-control" name="etelefono" id="etelefono" maxlength="200"
                                   value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="etelefono2"><?php echo e(__('Tél. 2:')); ?></label>
                            <input type="tel" class="form-control" name="etelefono2" id="etelefono2" maxlength="200"
                                   value="">
                        </div>
                    </div>
                    <table class="table table-responsive">
                        <tbody>
                        <tr>
                            <td><?php echo e(__('Fecha ingreso:')); ?></td>
                            <td>
                                <input class="form-control" name="efecha_ingreso" required="" id="efecha_ingreso"
                                       type="date" class="required hasDatepicker" maxlength="200" value="">
                            </td>
                            <td><?php echo e(__('# Empleado:')); ?></td>
                            <td>
                                <span id="num_emp_reac"></span>
                                <input class="form-control" name="eempleado" id="eempleado" type="number" min="0"
                                       maxlength="20" size="20" class="validar unique_num" size="15" value=""
                                       required="">
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo e(__('Empresa:')); ?></td>
                            <td>
                                <select class="form-control" name="eempresa" id="eempresa" class="required"
                                        required="">
                                    <option value="">--SELECCIONE--</option>
                                    <option value="INDEPLO">INDEPLO</option>
                                    <option value="EXTERNO">EXTERNO</option>
                                </select>
                            </td>
                            <td><?php echo e(__('Localidad:')); ?></td>
                            <td>
                                <select class="form-control" id="elocalidad" name="elocalidad">
                                    <option value="CUAUTITLAN">CUAUTITLAN</option>
                                    <?php $__currentLoopData = $localidades; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $localidad): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($localidad); ?>"><?php echo e($localidad); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td><?php echo e(__('Segmento:')); ?></td>
                            <td><select class="form-control" name="esegmento" id="esegmento">
                                    <option><?php echo e(__('ADMINISTRATIVO')); ?></option>
                                    <option><?php echo e(__('OPERATIVO')); ?></option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo e(__('Coordinador:')); ?></td>
                            <td>
                                <div id="div_coord" class="form-inline">
                                    <span class="col-md-8" id="spn_coord"></span>
                                    <a id="show_edit_coord" class="btn-primary btn-sm" style="color: white;">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                </div>
                                <div id="editar_coord" style="display: none;">
                                    <?php echo Form::select('coordinadores',$coordinadores,null,['class'=>'form-control','data-id'=>'coordinadores','id'=>'ecoordinadores','placeholder'=>'--SELECCIONE--']); ?>

                                    <label for="fin_coord"><?php echo e(__('Fecha Fin')); ?></label>
                                    <input class="form-control" id="fin_coord" name="fin_coord" type="date" placeholder="Fecha Fin">
                                    <label for="ini_coord"><?php echo e(__('Fecha Inicio')); ?></label>
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
                            <td><?php echo e(__('IND')); ?> <strong><?php echo e(__('Alcatel')); ?></strong>:</td>
                            <td>
                                <input class="form-control" readonly name="eind_val" id="eind_val" type="text" maxlength="200"
                                       size="9" value="">
                            </td>
                            <td><?php echo e(__('Proveedor:')); ?></td>
                            <td>
                                <select class="form-control" name="eproveedor" id="eproveedor" class="form-select"
                                        required="">
                                    <option value="0"><?php echo e(__('--SELECCIONE--')); ?></option>
                                    <?php $__currentLoopData = $proveedores; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $proveedor): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($proveedor->id); ?>" <?php if($proveedor->id == 1): ?> selected="selected" <?php endif; ?>><?php echo e($proveedor->nombre); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo e(__('Razon Social:')); ?></td>
                            <td colspan="3">
                                <select class="form-control" name="erazon_rh" id="erazon_rh" class="form-select"
                                        required="">
                                    <option value=""><?php echo e(__('--SELECCIONE--')); ?></option>
                                    <?php $__currentLoopData = $razones; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $razon): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($razon->razon_id); ?>"><?php echo e($razon->razon_nombre); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo e(__('Puesto:')); ?></td>
                            <td colspan="3">
                                <select class="form-control" name="epuesto" id="epuesto">
                                    <option value=""><?php echo e(__('--SELECCIONE--')); ?></option>
                                    <?php $__currentLoopData = $puestos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $puesto): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($puesto->id); ?>"><?php echo e($puesto->nombre_puesto); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo e(__('Sueldo')); ?></td>
                            <td colspan="3">
                                <div id="sueldo_form" class="form-group col-md-12">
                                    <div class="form-row">
                                        <div class="form-group col-md-5">
                                            <strong><?php echo e(__('IMSS:')); ?></strong>
                                            <input disabled class="form-control" name="esueldo_imss" required=""
                                                   id="esueldo_imss" class="solo_numeros" type="number"
                                                   maxlength="200" value="0.00">
                                        </div>
                                        <div class="form-group col-md-5">
                                            <strong><?php echo e(__('Asimilado:')); ?></strong>
                                            <input disabled class="form-control" name="esueldo_asimilado" required=""
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
                                                <strong><?php echo e(__('IMSS Bruto:')); ?></strong>
                                                <input class="form-control" name="imss_bruto" id="imss_bruto" type="number"
                                                       maxlength="200">
                                            </div>
                                            <div class="form-group col-md-5">
                                                <strong><?php echo e(__('Asimilado Bruto:')); ?></strong>
                                                <input class="form-control" name="asimilado_bruto" id="asimilado_bruto" type="number"
                                                       maxlength="200">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-5">
                                                <strong><?php echo e(__('Fecha Fin Sueldo:')); ?></strong>
                                                <input class="form-control" name="fin_sueldo" id="fin_sueldo" type="date"
                                                       maxlength="200">
                                            </div>
                                            <div class="form-group col-md-5">
                                                <strong><?php echo e(__('Fecha Inicio Sueldo:')); ?></strong>
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
                        <tr>
                            <td colspan="4">
                                <?php echo e(__('Esquema:')); ?>

                                <select class="form-control" name="eesquema" id="eesquema">
                                    <option value="TRADICIONAL"><?php echo e(__('TRADICIONAL')); ?></option>
                                    <option value="ASIMILADO"><?php echo e(__('ASIMILADO')); ?></option>
                                    <option value="EFECTIVO"><?php echo e(__('EFECTIVO')); ?></option>
                                    <option value="VIATICOS"><?php echo e(__('VIATICOS')); ?></option>
                                </select>
                                <?php echo e(__('Esquema Viaticos:')); ?>

                                <select class="form-control" name="eesquema_viaticos" id="eesquema_viaticos">
                                    <option value="TRADICIONAL"><?php echo e(__('TRADICIONAL')); ?></option>
                                    <option value="ASIMILADO"><?php echo e(__('ASIMILADO')); ?></option>
                                    <option value="EFECTIVO"><?php echo e(__('EFECTIVO')); ?></option>
                                    <option value="VIATICOS"><?php echo e(__('VIATICOS')); ?></option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo e(__('# Monex:')); ?></td>
                            <td><input class="form-control" id="emonex" name="emonex" class="solo_numeros"
                                       type="number" min="0" maxlength="20" size="20" value=""></td>
                            <td><?php echo e(__('No.Cuenta:')); ?></td>
                            <td><input class="form-control" name="enum_cuenta" id="enum_cuenta" type="number"
                                       min="0" maxlength="20" size="20" value=""></td>
                        </tr>
                        <tr>
                            <td>
                                <?php echo e(__('BANCO:')); ?>

                            </td>
                            <td>
                                <select class="form-control" name="ebanco" id="ebanco">
                                    <option><?php echo e(__('SANTANDER')); ?></option>
                                    <option><?php echo e(__('BANCOMER')); ?></option>
                                    <option><?php echo e(__('BANAMEX')); ?></option>
                                    <option><?php echo e(__('HSBC')); ?></option>
                                    <option><?php echo e(__('INBURSA')); ?></option>
                                    <option><?php echo e(__('BANORTE')); ?></option>
                                    <option><?php echo e(__('SCOTIABANK')); ?></option>
                                    <option><?php echo e(__('BANCO AZTECA')); ?></option>
                                    <option><?php echo e(__('BANCOPPEL')); ?></option>
                                    <option><?php echo e(__('BANJIO')); ?></option>
                                    <option><?php echo e(__('BANREGIO')); ?></option>
                                </select>
                            </td>
                            <td>
                                <?php echo e(__('CLABE:')); ?>

                            </td>
                            <td>
                                <input class="form-control" name="eclabe" id="eclabe" type="number" min="0"
                                       maxlength="20" size="20" value="">
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo e(__('Observaciones:')); ?></td>
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
                    <button id="cerrar" onclick="refreshTable();" type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('Cerrar')); ?></button>
                    <button id="save" type="button" onclick="validaFormEditar();" class="btn btn-primary"><?php echo e(__('Guardar')); ?></button>
                </div>
            </form>
        </div>
    </div>
</div>
