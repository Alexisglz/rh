<div class="modal fade" id="Autorizarcioncelular" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="width: 100%;text-align: center;">VISTO BUENO DE CELULAR</h5>
            </div>
            <div class="modal-body">
                <div class="card-block">
                    <div class="row">
                        <div class="col-md-12">
                            <p>
                                Se entregan elementos solicitados en la solicitud <label id="num_solicitud_t"></label>
                                del
                                recurso: <label id="name_recurso_t"></label><br>
                                <br>
                                <label>Celular: </label><label id="resp_celular"></label><br>
                                <label>Plan: </label><label id="resp_plan"></label><br>
                                <label>Bam: </label><label id="resp_bam"></label><br>
                                <textarea class="form-control" placeholder="Observaciones"
                                          id="observaciones_varios"></textarea>
                            </p>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-xs btn-primary" id="enviar" onClick="saveCheckCelular()">Enviar
                </button>
            </div>
        </div>
    </div>
</div>
