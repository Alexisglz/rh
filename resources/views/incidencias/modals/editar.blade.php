<div class="modal fade" id="editar_envio" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLongTitle">Editar Incidencia</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body text-center">
                    <div class="form-row">
                        <div id="e_id" class="form-group col-md-4" style="display: none">
                            <label for="id_inc">{{__('ID')}}</label>
                            <input class="form-control" name="id_inc" type="text" id="id_inc" readonly>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="empleado_id">{{__('Empleado ID')}}</label>
                            <input readonly class="form-control" name="empleado_id" type="text" id="empleado_id">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="empleado">{{__('Empleado')}}</label>
                            <input readonly class="form-control" name="empleado" type="text" id="empleado">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="incidencia">{{__('Incidencia')}}</label>
                            <input readonly class="form-control" name=incidencia" type="text" id="incidencia">
                        </div>
                        <div class="form-group col-md-4" style="display: none">
                            <label for="incidencia_id">{{__('Incidencia id')}}</label>
                            <input class="form-control" name="incidencia_id" type="number" id="incidencia_id">
                        </div>
                        <div class="form-group col-md-4" style="display: none">
                            <label for="tratamiento">{{__('Tratamiento')}}</label>
                            <input class="form-control" name="tratamiento" type="text" id="tratamiento">
                        </div>
                        <div id="valida" class="row col-12">
                            <div class="form-group col-md-4">
                                <label for="monto">{{__('Monto')}}</label>
                                <input class="form-control" name="monto" type="number" step="any" id="monto">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="fecha">{{__('Fecha')}}</label>
                                <input class="form-control" name="fecha" type="date" id="fecha">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="dias">{{__('Dias')}}</label>
                                <input class="form-control" name="dias" type="number" step="1" min="1" id="dias">
                            </div>
                            <div class="form-group col-md-12">
                                <label for="dias">{{__('Motivo')}}</label>
                                <textarea class="form-control" name="motivo" id="motivo"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="enviarIncidencia()">Guardar</button>
            </div>
        </div>
    </div>
</div>
