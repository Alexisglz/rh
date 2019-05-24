<div class="modal fade" id="permisos" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal"><?php echo e(__('Administración de Permisos.')); ?></h4>
            </div>
            <input id="id_usuario" name="id_usuario" hidden value="">
            <div class="modal-body text-center body-permisos" id="body_permisos">
            </div>
            <div class="modal-footer">
                <div align="right">
                    <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal"><?php echo e(__('Cerrar')); ?></button>
                    <button type="button" class="btn btn-xs btn-primary" id="enviar"
                            onclick="enviarPermisos()"><?php echo e(__('Enviar')); ?>

                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
