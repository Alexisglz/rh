<div class="modal fade" id="AutorizarcionesChecks" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Autorizaciones</h5>
                <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
                <!-- <span aria-hidden="true">&times;</span> -->
                <!--/button-->
            </div>
            <div class="modal-body">
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <table id="usuarios"
                                   class="display nowrap table table-hover table-striped table-bordered"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr style="text-align: center;">
                                    <th>Alta</th>
                                    <th>Computadora</th>
                                    <th>Automovil</th>
                                    <th>Herramientas</th>
                                    <th>Solicitante</th>
                                    <th>Contrato</th>
                                </tr>

                                <td>
                                    <center>
                                        <input type="checkbox" id="alta_check">
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <input type="checkbox" id="computadora_check">
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <input type="checkbox" id="carro_check">
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <input type="checkbox" id="herramientas_check">
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <input type="checkbox" id="solicitante_check">
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <input type="checkbox" id="contrato_check">
                                    </center>
                                </td>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-xs btn-primary" id="enviar" onClick="saveChecks()">Enviar
                </button>
            </div>
        </div>
    </div>
</div>
