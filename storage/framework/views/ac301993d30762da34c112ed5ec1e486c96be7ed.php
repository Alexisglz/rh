<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="shortcut icon" href="<?php echo e(asset('img/user.png')); ?>">


    <title><?php echo e(__('Indeplo RRHH')); ?></title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <?php echo Html::style('/css/style.css'); ?>



    <?php echo Html::style('plugins/font-awesome/css/font-awesome.min.css'); ?>

<!-- IonIcons -->
    <?php echo Html::style('http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'); ?>

<!-- Theme style -->
    <?php echo Html::style('dist/css/adminlte.css'); ?>

<!-- Google Font: Source Sans Pro -->
    <?php echo Html::style('https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700'); ?>

<!-- DateTimePicker -->
    <?php echo Html::style('plugins/datetimepicker/datetimepicker.min.css'); ?>

<!-- Bootstrap Toggle -->
    <?php echo Html::style('plugins/bootstrap-toggle/css/bootstrap-toggle.min.css'); ?>

<!-- jQuery -->
    <?php echo Html::script('plugins/jquery/jquery.min.js'); ?>

<!-- jQuery UI -->
    <?php echo Html::script('plugins/jQueryUI/jquery-ui.min.js'); ?>

    <?php echo Html::style('plugins/jQueryUI/jquery-ui.min.css'); ?>

<!-- Autocomplete jQuery -->
    <?php echo Html::style('css/autocomplete.css'); ?>

<!-- Autocomplete -->
    <?php echo Html::script('js/autocomplete.js'); ?>

<!-- Loader -->
    <?php echo Html::script('js/loader.js'); ?>


    <?php echo Html::script('js/email.js'); ?>

<!-- DATATABLES -->
    <?php echo Html::style('https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css'); ?>

    <?php echo Html::style('https://cdn.datatables.net/fixedheader/3.1.3/css/fixedHeader.bootstrap.min.css'); ?>

    <?php echo Html::style('https://cdn.datatables.net/responsive/2.2.1/css/responsive.bootstrap.min.css'); ?>

    <?php echo Html::script('https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js'); ?>

    <?php echo Html::script('https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js'); ?>

    <?php echo Html::script('https://cdn.datatables.net/fixedheader/3.1.3/js/dataTables.fixedHeader.min.js'); ?>

    <?php echo Html::script('https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js'); ?>

    <?php echo Html::script('https://cdn.datatables.net/responsive/2.2.1/js/responsive.bootstrap.min.js'); ?>




    <?php
        /*
          <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.4.2/css/buttons.dataTables.min.css">
          <script src="https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js"></script>
          <script src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.flash.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
          <script src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.html5.min.js"></script>
          <script src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.print.min.js"></script>
        */
    ?>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to to the body tag
to get the desired effect
|---------------------------------------------------------|
|LAYOUT OPTIONS | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->

<link rel="stylesheet" type="text/css" href="<?php echo e(asset('/css/style.css')); ?>">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
      integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<body class="sidebar-mini sidebar sidebar-collapse">
<input hidden id="token" name="token" value="<?php echo e(csrf_token()); ?>">
<?php echo $__env->make('sweetalert::alert', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<div class="wrapper">
    <!-- Navbar -->


    <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
        <!-- Left navbar links -->


        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="<?php echo e(route('altas.index')); ?>" class="nav-link"><?php echo e(__('Inicio')); ?></a>
            </li>
        </ul>

        <!-- Right Side Of Navbar -->
        <ul class="navbar-nav ml-auto">
            <!-- Authentication Links -->
            <?php if(Auth::check()): ?>
                <?php echo Form::hidden('Area_',Auth::user()->area, ['class'=>'form-control' ,'id'=>'Area_']); ?>


            <?php endif; ?>

            <?php if(auth()->guard()->guest()): ?>
                <li><a class="nav-link" href="<?php echo e(route('login')); ?>"><?php echo e(__('Login')); ?></a></li>
                <li><a class="nav-link" href="<?php echo e(route('register')); ?>"><?php echo e(__('Register')); ?></a></li>
            <?php else: ?>

                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?php echo e(Auth::user()->nombre); ?> <span class="caret">:</span>
                        <?php echo e(Auth::user()->getRol->Descripcion); ?> <span class="caret"></span>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="<?php echo e(route('logout')); ?>"
                           onclick="event.preventDefault();
                          document.getElementById('logout-form').submit();">
                            <?php echo e(__('Logout')); ?>

                        </a>

                        <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
                            <?php echo csrf_field(); ?>
                        </form>
                    </div>
                </div>
            <?php endif; ?>
        </ul>
    </nav>
    <aside class="main-sidebar sidebar-dark-primary">
        <div class="sidebar">
            <a href="<?php echo e(route('altas.index')); ?>" class="brand-link">
                <img src="<?php echo e(asset('img/logo_indeplo_alt.png')); ?>" alt="Logo Indeplo" class="brand-image">
                <br>
            </a>
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            </div>
        <?php echo Form::hidden('IdUser',Auth::id(), ['class'=>'form-control' ,'id'=>'IdUser']); ?>

        <?php echo Form::hidden('CorreoUser',Auth::user()->email, ['class'=>'form-control' ,'id'=>'CorreoUser']); ?>

        <?php echo Form::hidden('NombreUsuario',Auth::user()->name, ['class'=>'form-control' ,'id'=>'NombreUsuario']); ?>

        <?php echo Form::hidden('Area',Auth::user()->getRol->Descripcion, ['class'=>'form-control' ,'id'=>'Area']); ?>


        <?php
            $area = auth()->user()->getRol->Descripcion;
        ?>
        <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <!-- Empleados -->
                    <?php
                        $p_noti   = auth()->user()->can('access',[\App\User::class,'listado_usuarios'])? 1:0;
                        $p_crear  = auth()->user()->can('access',[\App\User::class,'crear_usuarios'])? 1:0;
                        $p_cata   = auth()->user()->can('access',[\App\User::class,'listado_catalogos'])? 1:0;
                    ?>
                    <?php if($p_noti == 1 || $p_crear == 1 || $p_cata == 1): ?>
                        <div id="usuarios">
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fa fa-wrench"></i>
                                    <p class="labelMenu">
                                        <?php echo e(__('Configuración')); ?>

                                        <i class="right fa fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'listado_usuarios'])): ?>
                                        <li class="nav-item">
                                            <a href="<?php echo route('usuarios.index'); ?>" class="nav-link">
                                                <i class="fa  fa-user nav-icon iconMenu"></i>
                                                <p class="labelMenu"><?php echo e(__('Usuarios')); ?></p>
                                            </a>
                                        </li>
                                    <?php endif; ?>
                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'crear_usuarios'])): ?>
                                        <li class="nav-item">
                                            <a href="<?php echo route('usuarios.create'); ?>" class="nav-link">
                                                <i class="fa fa-user-plus nav-icon iconMenu"></i>
                                                <p class="labelMenu"><?php echo e(__('Crear usuario')); ?></p>
                                            </a>
                                        </li>
                                    <?php endif; ?>
                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'listado_catalogos'])): ?>
                                        <li class="nav-item">
                                            <a href="<?php echo route('configuracion.index'); ?>" class="nav-link">
                                                <i class="fa fa-th-list nav-icon iconMenu"></i>
                                                <p class="labelMenu"><?php echo e(__('Catalogos')); ?></p>
                                            </a>
                                        </li>
                                    <?php endif; ?>
                                </ul>
                            </li>
                        </div>
                    <?php endif; ?>
                <!-- Empleados -->
                    <?php
                        $listado_sol = auth()->user()->can('access',[\App\User::class,'listado_solicitudes'])? 1:0;
                        $crear_sol   = auth()->user()->can('access',[\App\User::class,'crear_solicitudes'])? 1:0;
                        $listado_emp = auth()->user()->can('access',[\App\User::class,'listado_empleados'])? 1:0;
                        $listado_baj = auth()->user()->can('access',[\App\User::class,'listado_bajas'])? 1:0;
                        $listado_cit = auth()->user()->can('access',[\App\User::class,'listado_citas'])? 1:0;
                    ?>
                    <?php if($listado_sol == 1 || $crear_sol == 1 || $listado_emp == 1 || $listado_baj == 1 || $listado_cit == 1): ?>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fa fa-users"></i>
                                <p class="labelMenu">
                                    <?php echo e(__('Empleados')); ?>

                                    <i class="right fa fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'crear_solicitudes'])): ?>
                                    <li class="nav-item">
                                        <a href="<?php echo route('altas.create'); ?>" class="nav-link">
                                            <i class="fa fa-plus nav-icon iconMenu"></i>
                                            <p class="labelMenu"><?php echo e(__('Crear solicitud')); ?></p>
                                        </a>
                                    </li>
                                <?php endif; ?>
                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'listado_solicitudes'])): ?>
                                    <li class="nav-item">
                                        <a href="<?php echo route('altas.index'); ?>" class="nav-link">
                                            <i class="fa fa-list-alt nav-icon iconMenu"></i>
                                            <p class="labelMenu"><?php echo e(__('Solicitudes de alta')); ?></p>
                                        </a>
                                    </li>
                                <?php endif; ?>
                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'listado_empleados'])): ?>
                                    <li class="nav-item">
                                        <a href="<?php echo route('empleados.index'); ?>" class="nav-link">
                                            <i class="fa  fa-user nav-icon iconMenu"></i>
                                            <p class="labelMenu"><?php echo e(__('Empleados')); ?></p>
                                        </a>
                                    </li>
                                <?php endif; ?>
                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'listado_bajas'])): ?>
                                    <li class="nav-item">
                                        <a href="<?php echo route('bajas.index'); ?>" class="nav-link">
                                            <i class="fa fa-minus nav-icon iconMenu"></i>
                                            <p class="labelMenu"><?php echo e(__('Bajas')); ?></p>
                                        </a>
                                    </li>
                                <?php endif; ?>
                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'listado_citas'])): ?>
                                    <li class="nav-item">
                                        <a href="<?php echo route('firma_cita.index'); ?>" class="nav-link">
                                            <i class="fa fa-calendar nav-icon iconMenu"></i>
                                            <p class="labelMenu"><?php echo e(__('Citas')); ?></p>
                                        </a>
                                    </li>
                                <?php endif; ?>
                            </ul>
                        </li>
                <?php endif; ?>
                <!-- Empleados fin -->
                    <!-- Incidencias Empleados -->
                    <?php
                        $crear_inci = auth()->user()->can('access',[\App\User::class,'crear_incidencias'])? 1:0;
                        $lista_inci = auth()->user()->can('access',[\App\User::class,'listado_incidencias'])? 1:0;
                        $lista_auth = auth()->user()->can('access',[\App\User::class,'listado_autorizar'])? 1:0;
                        $lista_lote = auth()->user()->can('access',[\App\User::class,'listado_lote'])? 1:0;
                    ?>
                    <?php if($crear_inci == 1 || $lista_inci == 1 || $lista_auth == 1 || $lista_lote == 1): ?>
                    <div id="incidencias">
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fa fa-list-alt"></i>
                                <p class="labelMenu">
                                    <?php echo e(__('Incidencias')); ?>

                                    <i class="right fa fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'crear_incidencias'])): ?>
                                <li class="nav-item">
                                    <a href="<?php echo route('incidencias.create'); ?>" class="nav-link">
                                        <i class="fa  fa-plus nav-icon iconMenu"></i>
                                        <p class="labelMenu"><?php echo e(__('Nueva incidencia')); ?></p>
                                    </a>
                                </li>
                                <?php endif; ?>
                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'listado_incidencias'])): ?>
                                <li class="nav-item">
                                    <a href="<?php echo route('incidencias.index'); ?>" class="nav-link">
                                        <i class="fa  fa-list-ul nav-icon iconMenu"></i>
                                        <p class="labelMenu"><?php echo e(__('Incidencias')); ?></p>
                                    </a>
                                </li>
                                <?php endif; ?>
                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'listado_autorizar'])): ?>
                                <li class="nav-item">
                                    <a href="<?php echo route('autorizar.index'); ?>" class="nav-link">
                                        <i class="fa fa-check nav-icon iconMenu"></i>
                                        <p class="labelMenu"><?php echo e(__('Autorizaciones')); ?></p>
                                    </a>
                                </li>
                                <?php endif; ?>
                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('access',[\App\User::class,'listado_lote'])): ?>
                                <li class="nav-item">
                                    <a href="<?php echo route('envio_incidencias.index'); ?>" class="nav-link">
                                        <i class="fa fa-th-list nav-icon iconMenu"></i>
                                        <p class="labelMenu"><?php echo e(__('Lote de incidencias')); ?></p>
                                    </a>
                                </li>
                                <?php endif; ?>
                            </ul>
                        </li>
                    </div>
                    <?php endif; ?>
                </ul>
            </nav>
        </div>
    </aside>
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-lg-12">
                        <?php echo $__env->yieldContent('contenido'); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" data-backdrop="static" data-keyboard="false"
         id="ModalBitacoras" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLongTitle"><?php echo e(__('Bitacoras')); ?></h4>
                </div>
                <div class="modal-body" id="datosss">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="DestruirMOdal()"><?php echo e(__('Cerrar')); ?></button>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo Html::script('plugins/ckeditor/ckeditor.js'); ?>

<!-- Bootstrap -->
<?php echo Html::script('plugins/bootstrap/js/bootstrap.bundle.min.js'); ?>

<!-- AdminLTE -->
<?php echo Html::script('dist/js/adminlte.js'); ?>

<!-- Moment.js -->
<?php echo Html::script('plugins/moment/moment.js'); ?>

<!-- DateTimePicker -->
<?php echo Html::script('plugins/datetimepicker/datetimepicker.min.js'); ?>

<!-- Bootstrap Toggle -->
<?php echo Html::script('plugins/bootstrap-toggle/js/bootstrap-toggle.min.js'); ?>

<!-- chartjs
<?php echo Html::script('plugins/chart.js/chart.bundle.min.js'); ?>

        -->
<?php echo $__env->yieldPushContent('scripts'); ?>
<script>
    $(function () {
        var table_select = $('.table tbody');
        table_select.on( 'click', 'tr', function () {
            $(this).toggleClass('selected');
        } );
    });
</script>


<!-- OPTIONAL SCRIPTS >
<script src="plugins/chart.js/Chart.min.js"></script>
<script src="dist/js/demo.js"></script>
<script src="dist/js/pages/dashboard3.js"></script-->

<footer class="main-footer" style="margin: initial;">
    <strong>Powered by <a href="http://www.indeplo.com">InCore</a>.</strong>
    <br>Todos los derechos reservados.
</footer>

</body>
</html>
