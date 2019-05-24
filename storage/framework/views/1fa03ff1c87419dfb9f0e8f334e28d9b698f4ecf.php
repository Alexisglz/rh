<div class="modal fade" id="editarUserModal" role="dialog">
    <?php echo Form::open(['id'=>'formulario_edit_usuario','route'=>'usuarios.store','method'=>'POST','files'=>true,'enctype'=>"multipart/form-data"]); ?>

    <div class="modal-dialog modal-md">
        <div id="edit_usuario" class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal"><?php echo e(__('Editar Usuario')); ?></h4>
            </div>
            <div class="modal-body body-permisos">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <form id="edit_usuario1" method="post" action="">
                                <input type="number" name="" id="user_id" hidden="true">
                                <label for="name_user"><?php echo e(__('Nombre')); ?></label>
                                <input type="text" name="name_user" id="name_user" class="form-control">
                                <label for="apellidos"><?php echo e(__('Apellidos')); ?></label>
                                <input type="text" name="apellidos" id="apellidos" class="form-control">
                                <label for="usuario"><?php echo e(__('Usuario')); ?></label>
                                <input type="text" name="usuario" id="usuario" class="form-control">
                                <label for="email_user"><?php echo e(__('Correo Eléctronico')); ?></label>
                                <input type="email" name="email_user" id="email_user" class="form-control">
                                <label for="id_empleado"><?php echo e(__('ID Empleado')); ?></label>
                                <input type="number" name="id_empleado" id="id_empleado" class="form-control">
                                <label for="perfil"><?php echo e(__('Perfil')); ?></label>
                                <select id="perfil" type="text" class="form-control" name="perfil" required>
                                    <option value="ADMIN"><?php echo e(__('ADMIN')); ?></option>
                                    <option value="STAFF"><?php echo e(__('STAFF')); ?></option>
                                    <option value="ESPECIAL"><?php echo e(__('ESPECIAL')); ?></option>
                                    <option value="CLIENTE"><?php echo e(__('CLIENTE')); ?></option>
                                </select>
                                <label for="area"><?php echo e(__('Área')); ?></label>
                                <select id="area" type="text" class="form-control" name="area" required>
                                    <option value=""><?php echo e(__('Seleccione')); ?></option>
                                    <option value="RH"><?php echo e(__('RH')); ?></option>
                                    <option value="FINANZAS"><?php echo e(__('FINANZAS')); ?></option>
                                    <option value="DESARROLLO"><?php echo e(__('DESARROLLO')); ?></option>
                                    <option value="IT"><?php echo e(__('IT')); ?></option>
                                    <option value="TODO"><?php echo e(__('TODO')); ?></option>
                                    <option value="DIRECCION"><?php echo e(__('DIRECCION')); ?></option>
                                    <option value="ALMACEN"><?php echo e(__('ALMACEN')); ?></option>
                                    <option value="SISTEMAS"><?php echo e(__('SISTEMAS')); ?></option>
                                    <option value="CONTROL"><?php echo e(__('CONTROL')); ?></option>
                                    <option value="COORDINACION"><?php echo e(__('COORDINACION')); ?></option>
                                    <option value="CUSTOMER"><?php echo e(__('CUSTOMER')); ?></option>
                                    <option value="LOGISTICA"><?php echo e(__('LOGISTICA')); ?></option>
                                    <option value="VIATICOS"><?php echo e(__('VIATICOS')); ?></option>
                                    <option value="DEHN"><?php echo e(__('DEHN')); ?></option>
                                    <option value="COMERCIAL"><?php echo e(__('COMERCIAL')); ?></option>
                                    <option value="NCR"><?php echo e(__('NCR')); ?></option>
                                    <option value="CAPACITACION"><?php echo e(__('CAPACITACION')); ?></option>
                                    <option value="SUPERVISION"><?php echo e(__('SUPERVISION')); ?></option>
                                    <option value="CALIDAD"><?php echo e(__('CALIDAD')); ?></option>
                                    <option value="CAPITAL"><?php echo e(__('CAPITAL')); ?></option>
                                    <option value="SOPORTE"><?php echo e(__('SOPORTE')); ?></option>
                                    <option value="NOKIA"><?php echo e(__('NOKIA')); ?></option>
                                    <option value="TAC"><?php echo e(__('TAC')); ?></option>
                                    <option value="ESPECIAL"><?php echo e(__('ESPECIAL')); ?></option>
                                    <option value="NAE"><?php echo e(__('NAE')); ?></option>
                                    <option value="ADMINISTRADOR"><?php echo e(__('ADMINISTRADOR')); ?></option>
                                </select>
                                <label for="rol"><?php echo e(__('Rol')); ?></label>
                                <select id="rol" name="rol" class="form-control"></select>
                                <?php if(auth()->user()->getRol->Rol == 'ADMIN'): ?>
                                    <label for="password"><?php echo e(__('Contraseña')); ?></label>
                                    <input type="password" name="password" id="password" class="form-control">
                                <?php endif; ?>
                            </form>
                        </div>
                        <div class="col-md-6">

                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div align="right">
                    <button type="button" class="btn btn-xs btn-danger"
                            data-dismiss="modal" id="cerrar"><?php echo e(__('Cerrar')); ?></button>
                    <button type="button" class="btn btn-xs btn-primary" id="enviar_user"
                            onclick="validateFormEdit()"><?php echo e(__('Enviar')); ?></button>
                </div>
            </div>
        </div>
    </div>
    <?php echo Form::close(); ?>

</div>
