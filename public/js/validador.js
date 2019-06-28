/*
*   -------------------------------------------------------------------------
*   Funcion para validar campos requeridos
*   -------------------------------------------------------------------------
*   @param  string  id          Elemento contenedor de los campos
*   @param  array   array       Arreglo con campos que no se quieran validar
*   @return bool    bool        Se devuelve boolean
*   -------------------------------------------------------------------------
*/
function existe(id, array = []) {
    var inputs   = $('#'+id+' :input');
    var erroneos = [];
    inputs.each(function (key, value) {
        var input  = $(this);
        var value  = input.val();
        var id     = input.attr('id');
        var button = input.prev().is("button");
        if (array.indexOf(id) != -1 || button == true){
            return true;
        }
        if (value == null || value == ""){
            input.css('border','1px solid red');
            erroneos.push(id);
        }
        else
            input.css('border','1px solid #ced4da');
    });
    if (erroneos.length != 0) {
        Swal.fire({
            title: 'Los campos son requeridos',
            type: 'error'
        });
        return false;
    }
    else
        return true;
}

function password(id, confirm = null, button = null, small1 = null, small2 = null) {
    var disabled = false;
    var disabled2 = false;
    $('#'+id).on('keyup', function (e) {
        var input = $(this);
        var lowerCaseLetters = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*?[#?!@$%^&*\-_.])[a-zA-Z0-9#?!@$%^&*\-_.]{8,}/g;
        var small = small1 != null ? $('#'+small1):false;
        if(input.val().match(lowerCaseLetters)){
            small.removeClass('text-danger');
            small.addClass('text-success');
            disabled = true;
            input.css('border','1px solid #ced4da');
        }
        else{
            small.removeClass('text-success');
            small.addClass('text-danger');
            if (small != false) {
            }
            disabled = false;
            input.css('border','1px solid red');
        }
        if (confirm != null) {
            var pass_c = $('#'+confirm);
            var small2 = $('#'+small2);
            if (input.val() != pass_c.val()) {
                small2.show();
                disabled2 = false;
                pass_c.css('border', '1px solid red');
            } else {
                pass_c.css('border', '1px solid #ced4da');
                small2.hide();
                disabled2 = true;
            }
            if (disabled == true && disabled2 == true)
                $('#sub').prop('disabled', false);
            else
                $('#sub').prop('disabled', true)
        }
    });
    if (confirm != null){
        $('#'+confirm).on('keyup', function (e) {
            var input = $(this);
            var pass  = $('#password');
            var small = $('#'+small2);
            if (input.val() != pass.val()){
                small.show();
                disabled2 = false;
                input.css('border','1px solid red');
            }
            else{
                small.hide();
                input.css('border','1px solid #ced4da');
                disabled2 = true;
            }
            if (disabled == true && disabled2 == true)
                $('#'+button).prop('disabled', false);
            else
                $('#'+button).prop('disabled', true)
        });
    }
}