<div class="modal fade" id="modal_cambio_pro" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal">Cambio de Proyecto</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <form id="form_edit_empleado" method="post" action="">
                                <div class="form-group col-md-12">
                                    <div class="form-row">
                                        <div class="col-md-4">
                                            <label for="cliente_ca">Cliente:</label>
                                            {!! Form::select('cliente_ca',$clientes,null,['class'=>'form-control select_wbs_cambio req_common','data-id'=>1,'id'=>'cliente_ca','placeholder'=>'CLIENTE']) !!}
                                        </div>
                                        <div class="col-md-4">
                                            <label for="servicio_ca">Servicio:</label>
                                            {!! Form::select('servicio_ca',[],null,['class'=>'form-control select_wbs_cambio req_common','data-id'=>2,'id'=>'servicio_ca','placeholder'=>'SERVICIO','style'=>'width: 100%;']) !!}
                                        </div>
                                        <div class="col-md-4">
                                            <label for="region_ca">Region:</label>
                                            {!! Form::select('region_ca',[],null,['class'=>'form-control select_wbs_cambio req_common','data-id'=>3,'id'=>'region_ca','placeholder'=>'REGION','style'=>'width: 100%;']) !!}
                                        </div>
                                        <div class="col-md-4">
                                            <label for="tecnologia_ca">Tecnologia:</label>
                                            {!! Form::select('tecnologia_ca',[],null,['class'=>'form-control select_wbs_cambio req_common','data-id'=>4,'id'=>'tecnologia_ca','placeholder'=>'TECNOLOGIA','style'=>'width: 100%;']) !!}
                                        </div>
                                        <div class="col-md-4">
                                            <label for="grupo_ca">Grupo:</label>
                                            {!! Form::select('grupo_ca',[],null,['class'=>'form-control select_wbs_cambio req_common','data-id'=>5,'id'=>'grupo_ca','placeholder'=>'GRUPO','style'=>'width: 100%;']) !!}
                                        </div>
                                        <div class="col-md-4">
                                            <div id="wbs_completa" class="h5 text-center" style="height: 100%;margin-top: 15%;"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div id="esquema_div" class="hide">
                                            @php
                                                $esquema_con = [
                                                    ''=>'SELECCIONE',
                                                    '1'=>'NORMAL',
                                                    '2'=>'TASK BASED',
                                                    '3'=>'RENTA FIJA',
                                                    '4'=>'ETL',
                                                    '6'=>'POLIZA',
                                                    '7'=>'RENTA FIJA',
                                                ];
                                            @endphp
                                            {!! Form::label('esquemas', 'Esquema: ') !!}
                                            {!! Form::select('esquemas', $esquema_con, null,['class'=>'form-control req_nok','id'=>'esquemas','style'=>'width: 100%;']) !!}
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div align="right">
                    <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-xs btn-primary" id="enviar" onclick=''>
                        Guardar
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
