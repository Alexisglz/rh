<div class="modal fade bd-example-modal-lg" id="save_ajuste" tabindex="-1" data-backdrop="static"
     data-keyboard="false" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" id="save_ajuste" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{__('Nuevo Ajuste de Sueldo')}}</h5>
            </div>
            <div>
                <div id="nuevo_ajus" class="modal-body body-permisos">
                    <legend>Datos</legend>
                    <div class="form-row">
                        <input id="id_emp" hidden>
                        <input id="id_risk" hidden>
                        <div class="form-group col-md-3">
                            <label for="empleado">Empleado:</label>
                            <input class="form-control" name="empleado" type="text" id="empleado" autocomplete="off">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="asimilado">Risk Order:</label>
                            <input class="form-control" class="validar" name="ro" type="text" id="ro" autocomplete="off">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="tradicional">Sueldo Tradicional:</label>
                            <input class="form-control" name="tradicional" type="number" id="tradicional" value="0">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="asimilado">Sueldo Asimilado:</label>
                            <input class="form-control" class="validar" name="asimilado" type="number" id="asimilado" value="0">
                        </div>
                        <div class="form-group col-md-12 text-center">
                            <label for="observaciones">Observaciones:</label>
                            <textarea class="form-control" class="validar" name="observaciones" id="observaciones"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="cerrar" href="#" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" href="#" value="0" class="btn btn-primary" id="guardar" onclick="saveAjuste();">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>
