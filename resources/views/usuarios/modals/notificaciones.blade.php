<div class="modal fade" id="asignarnotifi" role="dialog">
    {!! Form::open(['id'=>'edit_notificaciones','route'=>'usuarios.store','method'=>'POST','files'=>true,'enctype'=>"multipart/form-data"]) !!}
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal">{{__('Administración de Notificaciones.')}}</h4>
            </div>
            <input id="id_noti" name="id_noti" hidden value="0">
            <div class="modal-body text-center body-permisos" id="body-notifi">
            </div>
            <div class="modal-footer">
                <div align="right">
                    <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">{{__('Cerrar')}}</button>
                    <button type="button" class="btn btn-xs btn-primary" id="enviar"
                            onclick="validaCheckNotificaciones()">{{__('Enviar')}}
                    </button>
                </div>
            </div>
        </div>
    </div>
    {!! Form::close() !!}
</div>
