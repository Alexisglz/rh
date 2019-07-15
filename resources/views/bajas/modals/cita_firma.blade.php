<div class="modal fade" id="modalCita" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal">{{__('Fecha para la cita')}}</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <form id="form_edit_empleado" method="post" action="">
                                <div class="row">
                                    <textarea class="form-control" id="obs_cita" placeholder="Comentarios adicionales,lugar de cita,etc"
                                              style="height: 150px"></textarea>
                                </div>
                                <div class="row">
                                    <label for="fecha_baja_nom" class="col-md-12">{{__('Fecha Baja Nomina')}}</label>
                                    <input type="text" name="fecha_baja_nom" id="fecha_baja_nom" class="form-control col-md-11">
                                </div>
                                <div class="row">
                                    <label for="fecha_cita" class="col-md-12">{{__('Fecha de la Cita')}}</label>
                                    <input type="text" name="fecha_cita" id="fecha_cita" class="form-control col-md-11">
                                </div>
                                <div class="row">
                                    <label for="hora_cita" class="col-md-12">Hora</label>
                                    <input type="time" name="hora_cita" id="hora_cita" class="form-control">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div align="right">
                    <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">Cerrar
                    </button>
                    <button type="button" class="btn btn-xs btn-primary" onclick="enviarCita()">
                        Enviar
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
