<div class="modal fade" id="modalCelu" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal">{{__('Baja Celular')}}</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <form id="form_edit_empleado" method="post" action="">
                                <br>
                                <textarea class="form-control" id="obs_cel"
                                          placeholder="Comentarios adicionales,lugar de cita,etc"
                                          style="height: 150px"></textarea>
                                <label for="message-text" class="col-form-label">{{__('Cantidad de Adeudo')}}:</label>
                                <input type="number" value="0" min="0" class="form-control" name="cel_cant" id="cel_cant">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div align="right">
                    <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">{{__('Cerrar')}}
                    </button>
                    <button type="button" class="btn btn-xs btn-primary" onclick="bajaCelu()">
                        {{__('Enviar')}}
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

