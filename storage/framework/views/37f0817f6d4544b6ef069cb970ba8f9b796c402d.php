<div class="modal fade" id="asignarnotifi" role="dialog">
    <?php echo Form::open(['id'=>'edit_notificaciones','route'=>'usuarios.store','method'=>'POST','files'=>true,'enctype'=>"multipart/form-data"]); ?>

    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal"><?php echo e(__('Administración de Notificaciones.')); ?></h4>
            </div>
            <input id="id_noti" name="id_noti" hidden value="0">
            <div class="modal-body text-center body-permisos" id="body-notifi">
            </div>
            <div class="modal-footer">
                <div align="right">
                    <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal"><?php echo e(__('Cerrar')); ?></button>
                    <button type="button" class="btn btn-xs btn-primary" id="enviar"
                            onclick="validaCheckNotificaciones()"><?php echo e(__('Enviar')); ?>

                    </button>
                </div>
            </div>
        </div>
    </div>
    <?php echo Form::close(); ?>

</div>
