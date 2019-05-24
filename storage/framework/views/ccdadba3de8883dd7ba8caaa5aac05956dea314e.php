<div class="modal fade" id="AutorizarcionComputadora" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="width: 100%;text-align: center;">VISTO BUENO DE COMPUTO</h5>
            </div>
            <div class="modal-body">
                <div class="card-block">
                    <div class="row">
                        <div class="col-md-12">
                            <p>
                                <span>Se entrega equipo de computo y software descrito en la solicitud</span>
                                <label id="num_solicitud"></label> <span>del recurso: </span><label id="name_recurso"></label><br>
                                <br>
                                <label>Computadora:</label><label id="res_computadora"></label><br>
                                <span>Desc. de computadora: </span><label id="desc_computadora1"></label><br><br>
                                <label>Software: </label><label id="res_software"></label><br>
                                <span>Desc. de Software: </span><label id="desc_software1"></label><br><br>
                                <label>Correo (Indeplo):</label>
                                <div id="form_compu">
                                <input type="email" class="form-control" id="correo_ind"><br>
                                <textarea class="form-control" placeholder="Observaciones"
                                          id="observaciones_computadora"></textarea>
                                </div>
                            </p>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-xs btn-primary" id="enviar" onClick="saveCheckComputo()">
                    Enviar
                </button>
            </div>
        </div>
    </div>
</div>
