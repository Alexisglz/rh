<div class="modal fade" id="modalEditSolicitud" role="dialog">
    <?php echo Form::open(['id'=>'form_edit_solicitud','route'=>'altas.store','method'=>'POST','files'=>true,'enctype'=>"multipart/form-data"]); ?>

    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal">Editar solicitud</h4>
            </div>
            <div class="modal-body">
                <p class="h4">Solicitud de alta</p>
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fa fa-plus"></i>
                            WBS
                        </h3>
                    </div>
                    <div class="card-body">
                        <div class="form-inline" id="c_wbs">
                            <?php echo Form::token(); ?>

                            <div class="col-md-1 hidden-sm hidden-xs">
                            </div>
                            <div class="col-md-2">
                                <?php echo Form::select('cliente',$clientes,null,['class'=>'form-control select_wbs req_common','data-id'=>1,'id'=>'cliente','placeholder'=>'CLIENTE','style'=>'width: 100%;']); ?>

                            </div>
                            <div class="col-md-2">
                                <?php echo Form::select('servicio',[],null,['class'=>'form-control select_wbs req_common','data-id'=>2,'id'=>'servicio','placeholder'=>'SERVICIO','style'=>'width: 100%;']); ?>

                            </div>
                            <div class="col-md-2">
                                <?php echo Form::select('region',[],null,['class'=>'form-control select_wbs req_common','data-id'=>3,'id'=>'region','placeholder'=>'REGION','style'=>'width: 100%;']); ?>

                            </div>
                            <div class="col-md-2">
                                <?php echo Form::select('tecnologia',[],null,['class'=>'form-control select_wbs req_common','data-id'=>4,'id'=>'tecnologia','placeholder'=>'TECNOLOGIA','style'=>'width: 100%;']); ?>

                            </div>
                            <div class="col-md-2">
                                <?php echo Form::select('grupo',[],null,['class'=>'form-control select_wbs req_common','data-id'=>5,'id'=>'grupo','placeholder'=>'GRUPO','style'=>'width: 100%;']); ?>

                            </div>
                        </div>
                        <hr>
                        <div id="wbs_completa" class="h3 text-center"></div>
                        <hr>
                    </div>
                </div>

                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fa fa-plus"></i>
                            Datos
                        </h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <?php echo Form::label('nombre', 'Nombre: '); ?>

                                <?php echo Form::text('nombre', null, ['class' => 'form-control req_common']); ?>


                                <?php echo Form::label('apaterno', 'Apellido paterno: '); ?>

                                <?php echo Form::text('apaterno', null, ['class' => 'form-control req_common']); ?>


                                <?php echo Form::label('amaterno', 'Apellido materno: '); ?>

                                <?php echo Form::text('amaterno', null, ['class' => 'form-control req_common']); ?>


                                <?php echo Form::label('cv', 'C.V. recurso: ');; ?>

                                <br>
                                <?php echo Form::file('cv'); ?>

                            </div>
                            <div class="col-md-6">
                            <!--
                            <?php echo Form::label('puesto', 'Puesto: '); ?>

                            <?php echo Form::text('puesto', null, ['class' => 'form-control req_common']); ?>

                                    -->
                                <?php echo Form::label('puesto', 'Puesto'); ?>

                                <?php echo Form::select('puesto',$puestos,null,['class'=>'form-control req_nok','id'=>'puesto','style'=>'width: 100%;']); ?>


                                <?php echo Form::label('fecha_inicio', 'Fecha de inicio: '); ?>

                                <?php echo Form::text('fecha_inicio', null, ['class' => 'form-control req_common']); ?>


                                <div id="esquema_div" class="hide">
                                    <?php
                                        $esquema_con = [
                                          '0'=>'SELECCIONE',
                                          '1'=>'NORMAL',
                                          '2'=>'TASK BASED',
                                          '3'=>'RENTA FIJA',
                                          '4'=>'ETL',
                                          '6'=>'POLIZA',
                                          '7'=>'RENTA FIJA',
                                        ];
                                    ?>
                                    <?php echo Form::label('esquemas', 'Esquema: '); ?>

                                    <?php echo Form::select('esquemas',$esquema_con,null,['class'=>'form-control req_nok','id'=>'esquemas','style'=>'width: 100%;']); ?>

                                </div>
                                <div id="temporalidad_contrato_div">
                                    <?php
                                        $temps_contrato = [
                                          '0'=>'SELECCIONE',
                                          '1'=>'1 MES',
                                          '2'=>'3 MESES',
                                          '3'=>'1 AÑO',
                                          '4'=>'3 AÑOS'
                                        ];
                                    ?>
                                    <?php echo Form::label('temporalidad_contrato', 'Temporalidad de contrato: '); ?>

                                    <?php echo Form::select('temporalidad_contrato',$temps_contrato,null,['class'=>'form-control req_nok','id'=>'temporalidades_contrato','style'=>'width: 100%;']); ?>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="card card-primary card-outline hide" id="venta_esperada_div">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fa fa-plus"></i>
                            Venta esperada
                        </h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div id="esq_task" class="hide">
                                    <?php echo Form::label('sueldo_venta', 'Monto de venta: '); ?>

                                    <?php echo Form::text('sueldo_venta', null, ['class' => 'form-control req_nok']); ?>

                                </div>
                                <div id="esq_poliza" class="hide">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <?php echo Form::label('codigo_poliza', 'Codigo Póliza: '); ?>

                                        </div>
                                        <div class="col-md-6">
                                            <?php echo Form::text('codigo_poliza', null, ['class' => 'form-control','id'=>'codigo_poliza']); ?>

                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <?php echo Form::label('sueldo_venta', 'Monto de venta: '); ?>

                                        </div>
                                        <div class="col-md-6" id="sueldo_venta_div">
                                            <?php
                                                /*{!! Form::text('sueldo_venta', null, ['class' => 'form-control','id'=>'sueldo_venta']) !!}*/
                                            ?>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <?php echo Form::label('Venta de la poliza: '); ?>

                                        </div>
                                        <div class="col-md-6">
                                            <?php echo Form::label('','',['id'=>'costo_pol']); ?>

                                        </div>
                                    </div>
                                    <?php
                                        /*
                                        <div class="row">
                                          <div class="col-md-6">
                                            {!! Form::label('Cantidad actual de recursos dentro de la poliza: ') !!}
                                          </div>
                                          <div class="col-md-6">
                                            {!! Form::label('','',['id'=>'cantidad_pol']) !!}
                                          </div>
                                        </div>
                                        */
                                    ?>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <?php echo Form::label('Cantidad de recursos asignada a esta póliza: '); ?>

                                        </div>
                                        <div class="col-md-6">
                                            <?php echo Form::label('','',['id'=>'cantidad_pol_inc']); ?>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fa fa-plus"></i>
                            Sueldo
                        </h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <?php
                                    $esquema_sueldos = [
                                      'TRADICIONAL'=>'TRADICIONAL',
                                      'ASIMILADO'=>'ASIMILADO',
                                      'EFECTIVO'=>'EFECTIVO',
                                      'VIATICOS'=>'VIATICOS',
                                    ];
                                ?>
                                <?php echo Form::label('esquema', 'Esquema de contratación: '); ?>

                                <?php echo Form::select('esquema',$esquema_sueldos,null,['class'=>'form-control select_esquema req_common','id'=>'esquema','placeholder'=>'SELECCIONE','style'=>'width: 100%;']); ?>


                            </div>

                            <div class="col-md-6">
                                <?php
                                    $trabajo_riesgo = [
                                      '1'=>'RIESGO 1',
                                      '2'=>'RIESGO 2',
                                      '3'=>'RIESGO 3',
                                      '4'=>'RIESGO 4',
                                      '5'=>'RIESGO 5',
                                    ];
                                ?>
                                <?php echo Form::label('riesgo', 'Trabajo de riesgo: '); ?>

                                <?php echo Form::select('riesgo',$trabajo_riesgo,null,['class'=>'form-control req_common','id'=>'riesgo','placeholder'=>'SELECCIONE','style'=>'width: 100%;']); ?>


                            </div>
                            <div class="clearfix"></div>
                            <div id="codigo_sueldo_div" class="hide col-md-6">
                                <?php echo Form::label('codigo_sueldo', 'Código Facturación de Salario Venta: '); ?>

                                <?php echo Form::text('codigo_sueldo', null, ['class' => 'form-control','id'=>'codigo_sueldo']); ?>

                            </div>

                            <div id="sueldo_venta_c_div" class="hide col-md-6">
                                <?php echo Form::label('sueldo_venta_c', 'Total Facturación de Salario Venta: '); ?>

                                <?php echo Form::text('sueldo_venta_c', null, ['class' => 'form-control','id'=>'sueldo_venta_c']); ?>

                            </div>
                            <div class="clearfix"></div>
                            <div id="v_imss" class="hide col-md-6">
                                <?php echo Form::label('sueldo_imss', 'Sueldo IMSS: '); ?>

                                <?php echo Form::text('sueldo_imss', null, ['class' => 'form-control req_common']); ?>

                            </div>

                            <div id="v_variable" class="hide col-md-6">
                                <?php echo Form::label('sueldo_variable', 'Sueldo Variable: '); ?>

                                <?php echo Form::text('sueldo_variable', null, ['class' => 'form-control']); ?>

                            </div>
                            <br>
                            <div class="clearfix"></div>
                            <br>
                            <div class="col-md-6 hide" id="costo_nomina_div">
                                <?php echo Form::label('costo_nomina', 'Costo nomina: '); ?>

                                <?php echo Form::text('costo_nomina', null, ['class' => 'form-control','id'=>'costo_nomina']); ?>

                            </div>

                        </div>
                    </div>
                </div>

                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fa fa-plus"></i>
                            Motivo de contratación
                        </h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <?php echo Form::label('motivo', 'Motivo: '); ?>

                                <?php echo Form::textarea('motivo', null, ['class' => 'form-control','rows'=>'4','style'=>'overflow: hidden; resize: none;']); ?>


                                <?php echo Form::label('vobo', 'Vo.Bo. Cliente: ');; ?>

                                <br>
                                <?php echo Form::file('vobo'); ?>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fa fa-plus"></i>
                            Uniforme y Equipamiento
                        </h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <?php echo Form::label('celular', 'Celular con plan: ',['style'=>'width:130px;']); ?>

                                <?php echo Form::checkbox('celular', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']);; ?>

                            </div>
                            <div class="col-md-9">
                                <div class="row hide" id="celular_opciones">
                                    <div class="col-md-6">
                                        <?php echo Form::label('plan_celular_select', 'Plan: '); ?>

                                        <br>
                                        <?php echo Form::select('plan_celular_select',$planes,null,['class'=>'form-control','id'=>'plan_celular_select','style'=>'width: 100%;']); ?>

                                    </div>
                                    <div class="col-md-6 hide" id="celular_codigos">
                                        <?php echo Form::label('codigo_celular', 'Codigo de celular: '); ?>

                                        <?php echo Form::text('codigo_celular', null, ['class' => 'form-control','id'=>'codigo_celular']); ?>

                                        <p>Venta:<span id="venta_celular_label"></span>, Costo:<span
                                                    id="costo_celular_label"></span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-3">
                                <?php echo Form::label('computadora', 'Computadora: ',['style'=>'width:130px;']); ?>

                                <?php echo Form::checkbox('computadora', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']);; ?>

                            </div>
                            <div class="col-md-9">
                                <div class="row hide" id="computadora_opciones">
                                    <div class="col-md-6">
                                        <?php echo Form::label('desc_computadora', 'Descripcion de la computadora (OPCIONAL): '); ?>

                                        <?php echo Form::textarea('desc_computadora', null, ['class' => 'form-control','rows'=>'3','style'=>'overflow: hidden; resize: none;']); ?>

                                    </div>
                                    <div class="col-md-6 hide" id="computadora_codigos">
                                        <?php echo Form::label('codigo_computadora', 'Codigo de computadora: '); ?>

                                        <?php echo Form::text('codigo_computadora', null, ['class' => 'form-control','id'=>'codigo_computadora']); ?>

                                        <p>Venta:<span id="venta_computadora_label"></span>, Costo:<span
                                                    id="costo_computadora_label"></span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-3">
                                <?php echo Form::label('software', 'Software: ',['style'=>'width:130px;']); ?>

                                <?php echo Form::checkbox('software', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']);; ?>

                            </div>
                            <div class="col-md-9">
                                <div class="row hide" id="software_opciones">
                                    <div class="col-md-6">
                                        <?php echo Form::label('desc_software', 'Descripcion del software (OPCIONAL): '); ?>

                                        <?php echo Form::textarea('desc_software', null, ['class' => 'form-control','rows'=>'3','style'=>'overflow: hidden; resize: none;']); ?>

                                    </div>
                                    <div class="col-md-6 hide" id="software_codigos">
                                        <?php echo Form::label('codigo_software', 'Codigo de software: '); ?>

                                        <?php echo Form::text('codigo_software', null, ['class' => 'form-control','id'=>'codigo_software']); ?>

                                        <p>Venta:<span id="venta_software_label"></span>, Costo:<span
                                                    id="costo_software_label"></span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-3">
                                <?php echo Form::label('correo', 'Correo: ',['style'=>'width:130px;']); ?>

                                <?php echo Form::checkbox('correo', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']);; ?>

                            </div>
                            <div class="col-md-9">
                                <div class="row hide" id="correo_opciones">
                                    <div class="col-md-12">
                                        <?php
                                            $correo_array = [
                                              'INDEPLO'=>'INDEPLO',
                                              'NAE'=>'NAE',
                                            ];
                                        ?>
                                        <?php echo Form::label('tipo_correo', 'Tipo de correo: '); ?>

                                        <?php echo Form::select('tipo_correo',$correo_array,null,['class'=>'form-control','id'=>'riesgo','placeholder'=>'SELECCIONE','style'=>'width: 100%;']); ?>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-3">
                                <?php echo Form::label('bam', 'BAM: ',['style'=>'width:130px;']); ?>

                                <?php echo Form::checkbox('bam', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']);; ?>

                            </div>
                            <div class="col-md-9">
                                <div class="row hide" id="bam_opciones">
                                    <div class="col-md-6">
                                        <?php echo Form::label('plan_bam_select', 'Plan: '); ?>

                                        <br>
                                        <?php echo Form::select('plan_bam_select',$planes,null,['class'=>'form-control','id'=>'plan_bam_select','style'=>'width: 100%;']); ?>

                                    </div>
                                    <div class="col-md-6 hide" id="bam_codigos" style="z-index: 100!important">
                                        <?php echo Form::label('codigo_bam', 'Codigo de BAM: '); ?>

                                        <?php echo Form::text('codigo_bam', null, ['class' => 'form-control','id'=>'codigo_bam']); ?>

                                        <p>Venta:<span id="venta_bam_label"></span>, Costo:<span
                                                    id="costo_bam_label"></span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <hr>
                        <div class="row">
                            <div class="col-md-3">
                                <?php echo Form::label('auto', 'Auto: ',['style'=>'width:130px;']); ?>

                                <?php echo Form::checkbox('auto', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']);; ?>

                            </div>
                            <div class="col-md-9">
                                <div class="row hide" id="auto_opciones">
                                    <div class="col-md-12 hide" id="auto_codigos">
                                        <?php echo Form::label('codigo_auto', 'Codigo de Auto: '); ?>

                                        <?php echo Form::text('codigo_auto', null, ['class' => 'form-control','id'=>'codigo_auto']); ?>

                                        <p>Venta:<span id="venta_auto_label"></span>, Costo:<span
                                                    id="costo_auto_label"></span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-3">
                                <?php echo Form::label('botas', 'Botas seguridad: ',['style'=>'width:130px;']); ?>

                                <?php echo Form::checkbox('botas', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']);; ?>

                            </div>
                            <div class="col-md-9">
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-3">
                                <?php echo Form::label('playera', 'Playeras con logo: ',['style'=>'width:130px;']); ?>

                                <?php echo Form::checkbox('playera', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']);; ?>

                            </div>
                            <div class="col-md-9">
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-12">
                                <?php echo Form::textarea('herramientas_almacen', null, ['class' => 'form-control','rows'=>'5','style'=>'overflow: hidden; resize: none;','placeholder'=>'Detalle de las herramientas de almacen necesitadas']); ?>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fa fa-plus"></i>
                            Actividades y lugar de trabajo
                        </h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <?php echo Form::label('actividad', 'Actividades: '); ?>

                                <?php echo Form::textarea('actividad', null, ['class' => 'form-control req_common','rows'=>'2','style'=>'overflow: hidden; resize: none;']); ?>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <?php echo Form::label('coordinador_id', 'Coordinador: '); ?>

                                <div class="ui-widget">
                                    <?php echo Form::select('coordinador_id',$coordinadores,null,['class'=>'form-control req_common','id'=>'coordinador_id','style'=>'width: 100%;']); ?>

                                </div>
                            </div>
                            <div class="col-md-6 hide" id="coord_nuevo_div">
                                <?php echo Form::label('coord_nuevo', 'Coordinador Nuevo: ',['style'=>' margin-top:27px;']); ?>

                                <?php echo Form::checkbox('coord_nuevo', 'value', false,['id'=>'coord_nuevo','data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','data-onstyle'=>'primary','data-offstyle'=>'success']);; ?>

                            </div>
                        </div>

                        <div class="row hide" id="datos_coord_nuevo_div">
                            <div class="col-xs-10 col-md-10">
                                <?php echo Form::label('nombre_coor', 'Nombre de nuevo coordinador: '); ?>

                                <?php echo Form::text('nombre_coor', null, ['class' => 'form-control','id'=>'nombre_coor']); ?>

                            </div>
                            <div class="col-xs-2 col-md-2 text-center" style="padding-top:35px;"
                                 id="retro_nuevo_coor">

                            </div>
                            <div class="clearfix"></div>
                            <div class="col-xs-10 col-md-10">
                                <?php echo Form::label('correo_coor', 'Correo de nuevo coordinador: '); ?>

                                <?php echo Form::email('correo_coor', null, ['class' => 'form-control','id'=>'correo_coor']); ?>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <?php echo Form::label('lugar_trabajo', 'Lugar de trabajo: '); ?>

                                <?php echo Form::select('lugar_trabajo',$estados,null,['class'=>'form-control req_common','id'=>'lugar_trabajo','style'=>'width: 100%;']); ?>

                            </div>
                            <div class="col-md-6">
                                <?php echo Form::label('pm', 'PM: '); ?>

                                <?php echo Form::text('pm', null, ['class' => 'form-control req_common','id'=>'pm']); ?>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <?php echo Form::label('direccion', 'Direccion: '); ?>

                                <?php echo Form::textarea('direccion', null, ['class' => 'form-control req_common','rows'=>'2','style'=>'overflow: hidden; resize: none;','id'=>'direccion']); ?>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="card card-primary card-outline hide" id="venta_calculada_div">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 text-center">
                                <p class="h5">Venta calculada: <span id="venta_calculada_span">  </span></p>
                                <?php echo Form::hidden('venta_calculada', null, ['class' => 'form-control','id'=>'venta_calculada']); ?>

                            </div>
                            <div class="col-md-4 text-center">
                                <p class="h5">Costo estimado: <span id="costo_estimado_span">  </span></p>
                                <?php echo Form::hidden('costo_estimado', null, ['class' => 'form-control','id'=>'costo_estimado']); ?>

                            </div>
                            <div class="col-md-4 text-center">
                                <p class="h5">Margen: <span id="margen_span">  </span></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card card-primary card-outline hide" id="caso_negocio_div">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <?php echo Form::label('caso_negocio', 'Caso de negocio: ');; ?>

                                <?php echo Form::file('caso_negocio'); ?>

                                <br><br>
                                <?php echo Form::label('cotizacion', 'Cotización: ');; ?>

                                <?php echo Form::file('cotizacion'); ?>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="card card-primary">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <?php echo Form::button('Generar Solicitud',['class'=>'btn btn-primary btn-lg btn-block','id'=>'guarda_info']); ?>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div align="right">
                    <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-xs btn-primary" id="enviar"
                            onclick="validarteFormEditar()">Enviar
                    </button>
                </div>
            </div>
        </div>
    </div>
    <?php echo Form::close(); ?>

</div>
