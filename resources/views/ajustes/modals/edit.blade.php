<div class="modal fade bd-example-modal-lg" id="edit_ajuste" tabindex="-1" data-backdrop="static"
     data-keyboard="false" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" id="edit_ajuste" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{__('Editar Ajuste de Sueldo')}}</h5>
            </div>
            <div>
                <div id="edit_ajus" class="modal-body body-permisos">
                    <legend>Datos</legend>
                    <div class="form-row">
                        <input id="e_id_emp" hidden>
                        <div class="form-group col-md-4">
                            <label for="empleado">Empleado:</label>
                            <input class="form-control" name="e_empleado" type="text" id="e_empleado" disabled>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="e_tradicional">Sueldo Tradicional:</label>
                            <input class="form-control" name="e_tradicional" type="number" id="e_tradicional" value="0">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="e_asimilado">Sueldo Asimilado:</label>
                            <input class="form-control" class="validar" name="e_asimilado" type="number" id="e_asimilado" value="0">
                        </div>
                        <div class="form-group col-md-12 text-center">
                            <label for="e_observaciones">Observaciones:</label>
                            <textarea class="form-control" class="validar" name="e_observaciones" id="e_observaciones"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="cerrar" href="#" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" href="#" value="0" class="btn btn-primary" id="guardar" onclick="saveEdit();">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>
