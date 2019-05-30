$(function () {
    var nss         = $('#nss');
    var rfc         = $('#rfc');
    var curp        = $('#curp');
    var num_emp     = $('#num_empleado');
    var span        = $('#validation_label');
    var span2       = $('#empleado_label');
    var autollenado = $('#autollenado');
    var auto_id     = $('#auto_id');
    var auto_nombre = $('#auto_nombre');
    var auto_nss    = $('#auto_nss');
    var auto_rfc    = $('#auto_rfc');
    var auto_curp   = $('#auto_curp');
    var btn_auto    = $('#btn_auto');
    var enviar      = $('#enviar');
    var datos       = null;
    nss.on('keyup', function () {
        if (datos != null){
            rfc.val("");
            curp.val("");
        }
        validator(nss, 'nss');
    });
    rfc.on('keyup', function () {
        if (datos != null){
            nss.val("");
            curp.val("");
        }
        validator(rfc, 'rfc');
    });
    curp.on('keyup', function () {
        if (datos != null){
            rfc.val("");
            nss.val("");
        }
        validator(curp, 'curp');
    });
    num_emp.on('keyup', function () {
        empleado(num_emp, 'empleado_num');
    });

    function validator(type, attr){
        autollenado.fadeOut();
        var txt = attr.toUpperCase();
        if (type.val().length < 11){
            span.text("El "+txt+" no tiene suficientes valores para realizar una busqueda ");
            enviar.attr("disabled", true);
            return false;
        }
        $.ajax({
            url: '/exist_empleado',
            type: "GET",
            dataType: 'JSON',
            data: {
                value: type.val(),
                attr: attr
            },
            success:function (data) {
                datos = null;
                if(data.exist == true){
                    if (data.active == false){
                        span.text("Coincidencias encontradas con el "+txt+": "+type.val());
                        autollenado.fadeIn();
                        auto_id.text(data.data.id);
                        auto_nombre.text(data.data.empleado_nombre+' '+data.data.empleado_apaterno+' '+data.data.empleado_amaterno);
                        auto_nss.text(data.data.nss);
                        auto_rfc.text(data.data.rfc);
                        auto_curp.text(data.data.curp);
                        datos = data.data;
                        enviar.attr("disabled", true);
                    }
                    else{
                        span.text("Se encontró un recurso con el "+txt+" indicado, el cual esta actualmente activo.");
                        enviar.attr("disabled", true);
                    }
                }
                else{
                    span.text(txt+" Disponible");
                    enviar.attr("disabled", false);
                    enviar.val(0);
                }
            }
        });
    }
    function empleado(type, attr){
        $.ajax({
            url: '/exist_empleado',
            type: "GET",
            dataType: 'JSON',
            data: {
                value: type.val(),
                attr: attr
            },
            success:function (data) {
                datos = null;
                if(data.exist == true){
                    span2.text("Numero de empleado "+type.val()+" esta en uso");
                    enviar.attr("disabled", true);
                }
                else{
                    span2.text("");
                    enviar.attr("disabled", false);
                }
            }
        });
    }
    btn_auto.on('click',function () {
        if(datos != null){
            $('#nombre').val(datos.empleado_nombre);
            $('#apaterno').val(datos.empleado_apaterno);
            $('#amaterno').val(datos.empleado_amaterno);
            $('#calle').val(datos.calle);
            $('#num_ext').val(datos.num_exterior);
            $('#num_int').val(datos.num_interior);
            $('#colonia').val(datos.colonia);
            $('#municipio').val(datos.municipio);
            $('#cp').val(datos.cp);
            $('#estado').val(datos.estado);
            $('#nss').val(datos.nss);
            $('#rfc').val(datos.rfc);
            $('#curp').val(datos.curp);
            $('#telefono1').val(datos.telefono);
            $('#telefono2').val(datos.telefono2);
            $('#ind_alcatel').val(datos.empleado_alcatel_id);
            $('#num_empleado').val(datos.empleado_num).prop("readonly", true);
            enviar.val(datos.empleado_id);
            enviar.attr("disabled", false);
            autollenado.hide();
            span.text("");
        }
    });
});