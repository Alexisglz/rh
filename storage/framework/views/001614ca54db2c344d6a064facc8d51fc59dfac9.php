<div class="modal fade" id="AutorizarcionAuto" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="width: 100%;text-align: center;">VISTO BUENO DE AUTO</h5>
            </div>
            <div class="modal-body">
                <div class="card-block">
                    <div class="row">
                        <div class="col-md-12">
                            <p>
                                Se entregan elementos solicitados en la solicitud <label id="num_solicitud_c"></label>
                                del
                                recurso: <label id="name_recurso_auto"></label><br>
                                <br>
                                <label>Auto: </label><label id="resp_auto"></label><br>
                                <textarea class="form-control" placeholder="Observaciones"
                                          id="observaciones_auto"></textarea>
                            </p>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-xs btn-primary" id="enviar" onClick="saveCheckCoche()">Enviar
                </button>
            </div>
        </div>
    </div>
</div>
