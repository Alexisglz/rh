<div class="modal fade" id="AutorizarcionAlmacen" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="width: 100%;text-align: center;">VISTO BUENO DE ALMACEN</h5>
            </div>
            <div class="modal-body">
                <div class="card-block">
                    <div class="row">
                        <div class="col-md-12">
                            <p>
                                Se entregan equipos de almacen descrito en la solicitud <label
                                        id="num_solicitud_a"></label> del
                                recurso: <label id="name_recurso_almacen"></label><br>
                                <br>
                                <label>Botas: </label><label id="resp_botas"></label><br><br>
                                <label>Playera: </label><label id="resp_playera"></label><br>
                                <textarea class="form-control" placeholder="Observaciones"
                                          id="observaciones_almacenamiento"></textarea>
                            </p>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-xs btn-primary" id="enviar" onClick="saveCheckAlmacen()">
                    Enviar
                </button>
            </div>
        </div>
    </div>
</div>