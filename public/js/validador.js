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
            input.css('border-color','red');
            erroneos.push(id);
        }
        else
            input.css('border','1px solid #ced4da');
    });
    if (erroneos.length != 0) {
        swal("Los campos son requeridos", {
            icon: "error",
        });
        return false;
    }
    else
        return true;
}