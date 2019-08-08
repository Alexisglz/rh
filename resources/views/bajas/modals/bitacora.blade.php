<div class="modal fade" id="ModalBitacora" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    {!! Form::open() !!}
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="">Bitacora de la solicitud</h4>
            </div>
            <div class="modal-body">

                <div class="modal-body body-permisos" id="">

                        <div class="form-row">
                            <div class="form-group col-md-12">
                              <div id="tabla_bitacora">
                                <table class="table table-bordered">
                                  <thead class="thead-dark">
                                    <tr>
                                        <th class="text-center">Hora</th>
                                        <th class="text-center">Realizó</th>
                                        <th class="text-center">Comentario</th>
                                    </tr>
                                  </thead>
                                </table>
                              </div>

                            </div>
                              <div class="border border-info form-group col-md-12">
                            <div class="form-group col-md-12">
                                <p class="text-muted">
                                    NUEVA ENTRADA:
                                </p>
                            </div>
                            <div class="form-group col-md-12">
                                <p class="text-muted">
                                    <textarea class="form-control" id="entrada_bitacora" placeholder="Escribe aqui..."></textarea>
                                </p>
                            </div>

                        </div>
                    </div>

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="EnviarEntrada()">Enviar entrada</button>
            </div>
        </div>
    </div>
    {!! Form::close() !!}
</div>
