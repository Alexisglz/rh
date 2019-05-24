
<?php $__env->startSection('contenido'); ?>
    <?php
        $p_noti  = auth()->user()->can('access',[\App\User::class,'notificaciones_usuarios'])? 1:0;
        $p_edit  = auth()->user()->can('access',[\App\User::class,'editar_usuarios'])? 1:0;
        $p_elim  = auth()->user()->can('access',[\App\User::class,'baja_usuarios'])? 1:0;
    ?>
    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fa fa-plus"></i>
                <?php echo e(__('LISTADO DE USUARIOS')); ?>

            </h3>
            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'exportar_usuarios'])): ?>
                <button id="excel" type="button" onclick="ExcelUsuarios();"
                        class="btn btn-success"><?php echo e(__('Exportar')); ?></button>
            <?php endif; ?>
        </div>
        <div class="card-body">
            <table class="table table-bordered" style="width: 100%" id="index-table">
                <thead>
                <tr>
                    <th><?php echo e(__('Id')); ?></th>
                    <th><?php echo e(__('Info')); ?></th>
                    <th><?php echo e(__('Nombre')); ?></th>
                    <th><?php echo e(__('Usuario')); ?></th>
                    <th><?php echo e(__('Correo eléctronico')); ?></th>
                    <th><?php echo e(__('Estatus')); ?></th>
                    <th><?php echo e(__('Área')); ?></th>
                    <th><?php echo e(__('Rol')); ?></th>
                    <th><?php echo e(__('Acciones')); ?></th>
                </tr>
                </thead>
            </table>
        </div>
    </div>

    <?php echo $__env->make('usuarios.modals.editar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <?php echo $__env->make('usuarios.modals.notificaciones', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <?php echo $__env->make('usuarios.modals.permisos', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <?php echo $__env->make('usuarios.modals.info', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

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


    <?php $__env->startPush('scripts'); ?>
        <script>
            var p_noti = '<?php echo $p_noti?>';
            var p_edit = '<?php echo $p_edit?>';
            var p_elim = '<?php echo $p_elim?>';
        </script>
    <?php $__env->stopPush(); ?>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <?php echo Html::script('js/validador.js?v='.time()); ?>

    <?php echo Html::script('js/usuarios/index.js?v='.time()); ?>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>