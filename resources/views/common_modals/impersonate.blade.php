<div class="modal fade" id="impersonate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <form type="POST" action="{{route('imper.create')}}">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLongTitle">{{__('Ver como otro usuario')}}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body body-permisos">

                    <div class="form-group">
                        <label for="ver_user">{{__('Buscar Usuario')}}</label>
                        <input id="id_ver_user" name="id_ver_user" hidden>
                        <input autocomplete="off" type="text" class="form-control" id="ver_user" name="ver_user"
                               placeholder="Usuario" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{__('Cerrar')}}</button>
                    <button type="submit" class="btn btn-success">{{__('Ver Como')}}</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    $('#ver_user').autocomplete({
        source: "/imper/get_users",
        minLength: 2,
        select: function (event, ui) {
            $('#ver_user').val(ui.item.value);
            $('#id_ver_user').val(ui.item.id);
        }
    });
</script>