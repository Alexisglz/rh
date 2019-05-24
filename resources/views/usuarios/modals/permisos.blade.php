<div class="modal fade" id="permisos" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal">{{__('Administración de Permisos.')}}</h4>
            </div>
            <input id="id_usuario" name="id_usuario" hidden value="">
            <div class="modal-body text-center body-permisos" id="body_permisos">
            </div>
            <div class="modal-footer">
                <div align="right">
                    <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">{{__('Cerrar')}}</button>
                    <button type="button" class="btn btn-xs btn-primary" id="enviar"
                            onclick="enviarPermisos()">{{__('Enviar')}}
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
