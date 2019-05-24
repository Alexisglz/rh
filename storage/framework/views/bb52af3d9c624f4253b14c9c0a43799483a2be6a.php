<?php $__env->startSection('contenido'); ?>
    <?php if(Auth::check()): ?>
        <?php echo Form::hidden('IdUser',Auth::id(), ['class'=>'form-control' ,'id'=>'IdUser']); ?>

    <?php endif; ?>

    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fa fa-plus"></i>
                <?php echo e(__('LISTADO DE SOLICITUDES DE ALTA')); ?>

            </h3>
            <br>
            <input id="token" type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">

            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'exportar_solicitudes'])): ?>
                <form class="form-inline">
                    <div class="form-group mb-2">
                        <label for="FInicio" class="sr-only"><?php echo e(__('Fecha Inicio')); ?></label>
                        <input type="date" class="form-control" id="FInicio">
                    </div>
                    <div class="form-group mx-sm-3 mb-2">
                        <label for="FFIn" class="sr-only"><?php echo e(__('Fecha Fin')); ?></label>
                        <input type="date" class="form-control" id="FFIn">
                    </div>
                    <button id="excel" type="button" onclick="ExcelAltas();"
                            class="btn btn-success"><?php echo e(__('Exportar')); ?></button>
                </form>
            <?php endif; ?>

        </div>
        <div class="card-body">
            <input type="text" name="" value="<?php echo e(auth()->user()->id_usuario); ?>" id="index_user" hidden="true">
            <div class="row">
                <div class="col-sm">
                    <button id="auth" title="Solicitudes Autorizadas" class="btn btn-success btn-md" style="color: white; font-size: 13px;"><?php echo e(__('DIR')); ?><br><?php echo e(__('Autorizadas')); ?></button>
                    <button id="no_auth" title="Solicitudes Autorizadas" class="btn btn-warning btn-md" style="color: white; font-size: 13px;"><?php echo e(__('DIR')); ?><br><?php echo e(__('Sin Autorizar')); ?></button>
                    <button id="rh_auth" title="Solicitudes Autorizadas" class="btn btn-primary btn-md" style="color: white; font-size: 13px;"><?php echo e(__('RH')); ?><br><?php echo e(__('Autorizadas')); ?></button>
                    <button id="rh_no_auth" title="Solicitudes Autorizadas" class="btn btn-orange btn-md" style="color: white; font-size: 13px;"><?php echo e(__('RH')); ?><br><?php echo e(__('Sin Autorizar')); ?></button>
                </div>
                <div class="col-sm">
                    <a id="reset" class="btn btn-primary btn-md pull-right" title="Reiniciar Filtros" style="color: white">
                        <i class="fa fa-refresh"></i>
                    </a>
                </div>
            </div>
            <br>
            <table class="table table-active table-altas" width="100%" id="altas-table">
                <thead>
                <tr>
                    <th><?php echo e(__('ID')); ?></th>
                    <th><?php echo e(__('INFO')); ?></th>
                    <th><?php echo e(__('EDITAR')); ?></th>
                    <th><?php echo e(__('BITACORA')); ?></th>
                    <th><?php echo e(__('WBS')); ?></th>
                    <th><?php echo e(__('RECURSO')); ?></th>
                    <th><?php echo e(__('FECHA SOL')); ?></th>
                    <th><?php echo e(__('CREACION')); ?></th>
                    <th><?php echo e(__('COORDINADOR')); ?></th>
                    <th><?php echo e(__('AUTORIZAR DIRECCION')); ?></th>
                    <th><?php echo e(__('AUTORIZAR RH')); ?></th>
                    <th><?php echo e(__('AUTH COMPUTO')); ?></th>
                    <th><?php echo e(__('AUTH CELULAR')); ?></th>
                    <th><?php echo e(__('AUTH AUTO')); ?></th>
                    <th><?php echo e(__('AUTH ALMACEN')); ?></th>
                    <th><?php echo e(__('CONTRATO FIRMADO')); ?></th>
                    <th><?php echo e(__('COR-NOKIA-INDE')); ?></th>
                    <th><?php echo e(__('PM')); ?></th>
                    <th><?php echo e(__('IMSS')); ?></th>
                    <th><?php echo e(__('VARIABLE')); ?></th>
                    <th><?php echo e(__('ASIMILADO')); ?></th>
                    <th><?php echo e(__('COSTO')); ?></th>
                    <th><?php echo e(__('VENTA')); ?></th>
                    <th><?php echo e(__('MARGEN')); ?></th>
                    <th><?php echo e(__('ALTA')); ?></th>
                    <th><?php echo e(__('SOLICITANTE')); ?></th>
                </tr>
                </thead>
            </table>
        </div>
    </div>

    <!-- Modal informacion-->
    <?php echo $__env->make('altas.modals.info', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

    <!-- Modal editar *buscar si se utliza-->
    <?php echo $__env->make('altas.modals.editar_solicitud', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

    <!-- Modal autorizar *buscar si se utliza-->
    <?php echo $__env->make('altas.modals.autorizar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

    <!--Modal para cita de firmas -->
    <?php echo $__env->make('altas.modals.cita', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

    <!--Modal para autorizar computo -->
    <?php echo $__env->make('altas.modals.computo', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

    <!--Modal para autorizar auto -->
    <?php echo $__env->make('altas.modals.auto', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

    <!--Modal para autorizar celular -->
    <?php echo $__env->make('altas.modals.celular', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

    <!--Modal para autorizar almacen -->
    <?php echo $__env->make('altas.modals.almacen', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

    <style type="text/css">
        .main-sidebar {
            z-index: 5px;
        }
        .auths{
            max-width: 55px !important;
        }
        .width-auto{
            max-width: 60px; !important;
        }
        .id{
            max-width: 40px !important;
        }
        .editar_v{
            max-width: 40px !important;
        }
        .dire_v{
            max-width: 61px !important;
        }

    </style>
    <?php
        $edit              = auth()->user()->can('access',[\App\User::class,'editar_solicitudes'])? 1:0;
        $auth_sol          = auth()->user()->can('access',[\App\User::class,'autorizar_solicitudes'])? 1:0;
        $cita              = auth()->user()->can('access',[\App\User::class,'agendar_cita'])? 1:0;
        $auth_computadora  = auth()->user()->can('access',[\App\User::class,'autorizar_computadora'])? 1:0;
        $auth_celular      = auth()->user()->can('access',[\App\User::class,'autorizar_celular'])? 1:0;
        $auth_coche        = auth()->user()->can('access',[\App\User::class,'autorizar_coche'])? 1:0;
        $auth_herramientas = auth()->user()->can('access',[\App\User::class,'autorizar_herramientas'])? 1:0;
        $ver_checks        = auth()->user()->can('access',[\App\User::class,'ver_autorizaciones'])? 1:0;
        $cont_firm         = auth()->user()->can('access',[\App\User::class,'contrato_firmado'])? 1:0;
    ?>
    <script>
        var edit              = '<?php echo $edit?>';
        var auth_sol          = '<?php echo $auth_sol?>';
        var cita              = '<?php echo $cita?>';
        var auth_computadora  = '<?php echo $auth_computadora?>';
        var auth_celular      = '<?php echo $auth_celular?>';
        var auth_coche        = '<?php echo $auth_coche?>';
        var auth_herramientas = '<?php echo $auth_herramientas?>';
        var ver_checks        = '<?php echo $ver_checks?>';
        var cont_firm         = '<?php echo $cont_firm?>';
        $(function () {
            $("#computadora_check").bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
            $('#alta_check').bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
            $('#carro_check').bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
            $('#herramientas_check').bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
            $('#solicitante_check').bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
            $('#contrato_check').bootstrapToggle({
                on: 'SI',
                off: 'NO'
            });
        })
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <?php echo Html::script('js/sol_altas/index.js'); ?>

    <?php echo Html::script('js/validador.js'); ?>


    <?php echo Form::close(); ?>



<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>