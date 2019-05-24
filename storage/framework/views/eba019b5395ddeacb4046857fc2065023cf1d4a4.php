<div class="modal fade bd-example-modal-lg" id="mdialTamanio" tabindex="-1" data-backdrop="static"
     data-keyboard="false" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" id="mdialTamanio" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><?php echo e(__('Nuevo Empleado')); ?></h5>
            </div>
            <form id="ReingresoDiv">
                <div class="modal-body body-permisos">
                    <legend>Datos personales</legend>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="rnombre">Nombre(s):</label>
                            <input class="form-control" name="rnombre" type="text" id="rnombre" required=""
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="rapaterno">A. Paterno:</label>
                            <input class="form-control" name="rapaterno" type="text" id="rapaterno" required=""
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="ramaterno">A. Materno:</label>
                            <input class="form-control" class="validar" name="ramaterno" type="text" id="ramaterno"
                                   required="" maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="rcalle">Calle:</label>
                            <input class="form-control" name="rcalle" type="text" id="rcalle" required=""
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="rno_exterior"># Ext:</label>
                            <input class="form-control" name="rno_exterior" type="text" min="0" maxlength="20"
                                   size="20" id="rno_exterior" required="" maxlength="200" size="6" value="">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="rcalle"># Int:</label>
                            <input class="form-control" name="no_interior" type="text" min="0" maxlength="20"
                                   size="20" id="no_interior" maxlength="200" size="6" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="rcolonia">Colonia:</label>
                            <input class="form-control" name="rcolonia" type="text" id="rcolonia" required=""
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="rmunicipio">Del./Municipio:</label>
                            <input class="form-control" name="rmunicipio" type="text" id="rmunicipio" required=""
                                   maxlength="200" size="20" value="">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="rcp">CP:</label>
                            <input class="form-control" name="rcp" type="text" id="rcp" required="" maxlength="200"
                                   size="10" value="">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="estado">Estado:</label>
                            <select class="form-control" id="estado" name="estado">
                                <?php $__currentLoopData = $estados; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $estado): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($estado); ?>"><?php echo e($estado); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                        <div class="form-group col-md-12">
                            <div class="form-row">
                                <div class="col-md-4">
                                    <label for="cliente">Cliente:</label>
                                    <?php echo Form::select('cliente',$clientes,null,['class'=>'form-control select_wbs req_common','data-id'=>1,'id'=>'cliente','placeholder'=>'CLIENTE']); ?>

                                </div>
                                <div class="col-md-4">
                                    <label for="servicio">Servicio:</label>
                                    <?php echo Form::select('servicio',[],null,['class'=>'form-control select_wbs req_common','data-id'=>2,'id'=>'servicio','placeholder'=>'SERVICIO','style'=>'width: 100%;']); ?>

                                </div>
                                <div class="col-md-4">
                                    <label for="region">Region:</label>
                                    <?php echo Form::select('region',[],null,['class'=>'form-control select_wbs req_common','data-id'=>3,'id'=>'region','placeholder'=>'REGION','style'=>'width: 100%;']); ?>

                                </div>
                                <div class="col-md-4">
                                    <label for="tecnologia">Tecnologia:</label>
                                    <?php echo Form::select('tecnologia',[],null,['class'=>'form-control select_wbs req_common','data-id'=>4,'id'=>'tecnologia','placeholder'=>'TECNOLOGIA','style'=>'width: 100%;']); ?>

                                </div>
                                <div class="col-md-4">
                                    <label for="grupo">Grupo:</label>
                                    <?php echo Form::select('grupo',[],null,['class'=>'form-control select_wbs req_common','data-id'=>5,'id'=>'grupo','placeholder'=>'GRUPO','style'=>'width: 100%;']); ?>

                                </div>
                                <div class="col-md-4">
                                    <div id="wbs_completa" class="h5 text-center" style="height: 100%;margin-top: 15%;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="border border-info form-group col-md-12">
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="rnss">NSS:</label>
                                    <input class="form-control" name="rnss" type="text" id="rnss"
                                           class="validar nueva" required="" maxlength="200" size="20" value="">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="rrfc">RFC:</label>
                                    <input class="form-control" name="rrfc" type="text" id="rrfc"
                                           class="nueva" required="" maxlength="200" size="20" value="">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="rcurp">CURP:</label>
                                    <input class="form-control" name="rcurp" type="text" id="rcurp"
                                           class="nueva" required="" maxlength="200" size="20" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class="col col-md-12">
                            <label id="validation_label" class="modalLabel"></label>
                            <div class="row text-center" id="autollenado"  style="display: none;">
                                <table class="table table-autollenado">
                                    <thead>
                                    <tr>
                                        <th><?php echo e(__('ID')); ?></th>
                                        <th><?php echo e(__('NOMBRE')); ?></th>
                                        <th><?php echo e(__('NSS')); ?></th>
                                        <th><?php echo e(__('RFC')); ?></th>
                                        <th><?php echo e(__('CURP')); ?></th>
                                        <th><?php echo e(__('ACCIONES')); ?></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><span id="auto_id"></span></td>
                                        <td><span id="auto_nombre"></span></td>
                                        <td><span id="auto_nss"></span></td>
                                        <td><span id="auto_rfc"></span></td>
                                        <td><span id="auto_curp"></span></td>
                                        <td><a id="btn_auto" class="btn btn-primary btn-sm" style="color: white"><?php echo e(__('Autollenar')); ?></a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="rmail">E-mail:</label>
                            <input class="form-control" name="rmail" id="rmail" type="email" maxlength="200"
                                   value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="telefono">Tél. 1:</label>
                            <input type="tel" class="form-control" name="telefono" id="telefono" maxlength="200"
                                   value="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="rtelefono2">Tél. 2:</label>
                            <input type="tel" class="form-control" name="rtelefono2" id="rtelefono2" maxlength="200"
                                   value="">
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class="col col-md-12">
                            <label id="empleado_label" class="modalLabel"></label>
                        </div>
                    </div>
                    <table class="table table-responsive">
                        <tbody>
                        <tr>
                            <td>Fecha ingreso:</td>
                            <td>
                                <input class="form-control" name="fecha_ingreso" required="" id="fecha_ingreso"
                                       type="date" class="required hasDatepicker" maxlength="200" value="">
                            </td>
                            <td># Empleado:</td>
                            <td>
                                <span id="num_emp_reac"></span>
                                <input class="form-control" name="empleado" id="empleado" type="number" min="0"
                                       maxlength="20" size="20" class="validar unique_num" size="15" value=""
                                       required="">
                            </td>
                        </tr>
                        <tr>
                            <td>Empresa:</td>
                            <td>
                                <select class="form-control" name="empresa" id="empresa" class="required"
                                        required="">
                                    <option value="">--SELECCIONE--</option>
                                    <option value="INDEPLO">INDEPLO</option>
                                    <option value="EXTERNO">EXTERNO</option>
                                </select>
                            </td>
                            <td> Localidad:</td>
                            <td>
                                <select class="form-control" id="localidad" name="localidad">
                                    <?php $__currentLoopData = $localidades; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $localidad): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($localidad); ?>"><?php echo e($localidad); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td>Segmento:</td>
                            <td><select class="form-control" name="segmento" id="segmento">
                                    <option>ADMINISTRATIVO</option>
                                    <option>OPERATIVO</option>
                                </select></td>
                            <td>Coordinador:</td>
                            <td>
                                <?php echo Form::select('coordinadores',$coordinadores,null,['class'=>'form-control','data-id'=>'coordinadores','id'=>'coordinadores','placeholder'=>'--SELECCIONE--']); ?>

                            </td>
                        </tr>
                        <tr>
                            <td>IND <strong>Alcatel</strong>:</td>
                            <td>
                                <input class="form-control" name="ind_val" id="ind_val" type="text" maxlength="200"
                                       size="9" value="0">
                            </td>
                            <td>Proveedor:</td>
                            <td>
                                <select class="form-control" name="proveedor" id="proveedor" class="form-select"
                                        required="">
                                    <option value="">--SELECCIONE--</option>
                                    <?php $__currentLoopData = $proveedores; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $proveedor): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($proveedor->id); ?>"><?php echo e($proveedor->nombre); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Area</td>
                            <td>
                                <select class="form-control" id="rarea" name="rarea" class="form-select" required>
                                    <option value=""><?php echo e(__('--SELECCIONE--')); ?></option>
                                    <?php $__currentLoopData = $areas; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $area): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($area); ?>"><?php echo e($area); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </td>
                            <td>Razon Social:</td>
                            <td colspan="3">
                                <select class="form-control" name="razon_rh" id="razon_rh" class="form-select"
                                        required="">
                                    <option value=""><?php echo e(__('--SELECCIONE--')); ?></option>
                                    <?php $__currentLoopData = $razones; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $razon): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($razon->razon_id); ?>"><?php echo e($razon->razon_nombre); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Puesto:</td>
                            <td>
                                <select class="form-control" name="puesto" id="puesto">
                                    <option value=""><?php echo e(__('--SELECCIONE--')); ?></option>
                                    <?php $__currentLoopData = $puestos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $puesto): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($puesto->id); ?>"><?php echo e($puesto->nombre_puesto); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </td>
                            <td>Sueldo</td>
                            <td colspan="3">
                                <strong>IMSS:</strong><input class="form-control" name="sueldo_imss" required=""
                                                             id="sueldo_imss" class="solo_numeros" type="number"
                                                             maxlength="200" value="0.00" size="6">
                                <strong>Asimilado:</strong><input class="form-control" name="sueldo_asimilado"
                                                                  required="" class="solo_numeros"
                                                                  id="sueldo_asimilado" type="numbre"
                                                                  maxlength="200" value="0.00" size="6">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                Esquema:
                                <select class="form-control" name="esquema" id="esquema">
                                    <option value="TRADICIONAL">TRADICIONAL</option>
                                    <option value="ASIMILADO">ASIMILADO</option>
                                    <option value="EFECTIVO">EFECTIVO</option>
                                    <option value="VIATICOS">VIATICOS</option>
                                </select>
                                Esquema Viaticos:
                                <select class="form-control" name="esquema_viaticos" id="esquema_viaticos">
                                    <option value="TRADICIONAL">TRADICIONAL</option>
                                    <option value="ASIMILADO">ASIMILADO</option>
                                    <option value="EFECTIVO">EFECTIVO</option>
                                    <option value="VIATICOS">VIATICOS</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td># Monex:</td>
                            <td><input class="form-control" id="monex" name="monex" class="solo_numeros"
                                       type="number" min="0" maxlength="20" size="20" value=""></td>
                            <td>No.Cuenta:</td>
                            <td><input class="form-control" name="rnum_cuenta" id="rnum_cuenta" type="number"
                                       min="0" maxlength="20" size="20" value=""></td>
                        </tr>
                        <tr>
                            <td>
                                BANCO:
                            </td>
                            <td>
                                <select class="form-control" name="banco" id="rbanco">
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
                            </td>
                            <td>
                                CLABE:
                            </td>
                            <td>
                                <input class="form-control" name="clabe" id="rclabe" type="number" min="0"
                                       maxlength="20" size="20" value="">
                            </td>
                        </tr>
                        <tr>
                            <td>Observaciones:</td>
                            <td colspan="4">
                                    <textarea id="robservaciones" class="form-control" name="observaciones" rows="1"
                                              cols="30"></textarea></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" id="cerrar" href="#" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" href="#" value="0" class="btn btn-primary" id="guardar" onclick="guardarEmpleado();">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>
