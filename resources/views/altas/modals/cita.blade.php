<div class="modal fade" id="CitaFirma" role="dialog">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Cita para firma</h5>
            </div>
            <div class="modal-body">
                <input hidden id="val_botas" value="0">
                <input hidden id="val_playera" value="0">
                <div class="card-block" id="cita_div">
                    <div class="row">
                        <label class="col-md-12">Fecha</label>
                        <input type="text" name="fecha_cita" id="fecha_cita" class="form-control col-md-11">
                    </div>
                    <div class="row">
                        <label>Hora</label>
                        <input type="time" name="hora_cita" id="hora_cita" class="form-control">
                    </div>
                    <div class="row">
                        <label>Detalles de la cita</label>
                        <textarea name="detalles_cita" id="detalles_cita" class="form-control"
                                  style="height: 120px"></textarea>
                    </div>
                    <div id="div_botas" class="row">
                        <label>Talla de botas (cms)</label>
                        <input id="botas1" type="number" name="botas1" class="form-control">
                    </div>
                    <div id="div_playera" class="row">
                        <label>Talla playera</label>
                        <select id="playera1" name="playera1" class="form-control">
                            <option value="chica">{{__('Chica')}}</option>
                            <option value="mediana">{{__('Mediana')}}</option>
                            <option value="grande">{{__('Grande')}}</option>
                        </select>
                    </div>
                    <div class="row">
                        <label>Correo solicitante</label>
                        <input type="email" name="correo_cita" id="correo_cita" class="form-control">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-xs btn-primary" id="enviar" onClick="saveCitaFirma()">Enviar
                </button>
            </div>
        </div>
    </div>
</div>
