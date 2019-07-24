<div class="modal fade" id="myModalbaja" role="dialog">
    {!! Form::open() !!}
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal">Baja Recursos Humanos</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <form id="form_edit_empleado" method="post" action="">
                                <div class="form-row">
                                    <label>Fecha de baja</label>
                                    <input type="date" name="empleado_fecha_baja" id="empleado_fecha_baja" class="form-control col-md-11">
                                </div>
                                <label for="incidencias1" class="col-form-label">Incidencias:</label>
                                <input type="textarea" class="form-control" name="incidencias1" id="incidencias1"
                                       required>
                                <label for="observaciones" class="col-form-label">Observaciones:</label>
                                <input type="textarea" class="form-control" name="observaciones" id="observaciones"
                                       required>
                                <label for="motivo">Motivo</label>
                                <select id="motivo" name="motivo" class="form-control" required>
                                    <option value="ABANDONO DE TRABAJO/AUSENTISMO">Abandono de Trabajo/Ausentismo</option>
                                    <option value="TERMINO DE PROYECTO">Termino de Proyecto</option>
                                    <option value="RENUNCIA VOLUNTARIA">Renuncia</option>
                                    <option value="MEJOR OFERTA LABORAL">Mejor Oferta Laboral</option>
                                    <option value="CAMBIO DE VENDOR">Cambio de Vendor</option>
                                    <option value="DESEMPEÑO RESICION">Desempeño/Resición</option>
                                </select>
                                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                <br>
                                <div class="row">
                                    <label>Recurso tiene conocimiento de baja: </label>
                                    <td>
                                        <center>
                                            {!! Form::checkbox('recurso_check', 'value', false,['data-toggle'=>'toggle','data-on'=>'SI','data-off'=>'NO','id'=>'recurso_check','data-onstyle'=>'primary','data-offstyle'=>'success']); !!}
                                        </center>
                                    </td>
                                </div>
                                <label for="vobo">V.o B.o jefe directo:</label>
                                <br>
                                <input type="file" name="vobo" id="vobo">
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
                    <button type="button" class="btn btn-xs btn-primary" id="enviar" onclick='postBajaEmpleado()'>
                        Dar baja
                    </button>
                </div>
            </div>
        </div>
    </div>
    {!! Form::close() !!}
</div>