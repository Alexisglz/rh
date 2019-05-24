$(function () {
    var nss         = $('#rnss');
    var rfc         = $('#rrfc');
    var curp        = $('#rcurp');
    var num_emp     = $('#empleado');
    var span        = $('#validation_label');
    var span2       = $('#empleado_label');
    var autollenado = $('#autollenado');
    var auto_id     = $('#auto_id');
    var auto_nombre = $('#auto_nombre');
    var auto_nss    = $('#auto_nss');
    var auto_rfc    = $('#auto_rfc');
    var auto_curp   = $('#auto_curp');
    var btn_auto    = $('#btn_auto');
    var enviar      = $('#guardar');
    var datos       = null;
    nss.on('keyup', function () {
        if (datos != null){
            rfc.val("");
            curp.val("");
            enviar.val(0);
        }
        validator(nss, 'nss');
    });
    rfc.on('keyup', function () {
        if (datos != null){
            nss.val("");
            curp.val("");
            enviar.val(0);
        }
        validator(rfc, 'rfc');
    });
    curp.on('keyup', function () {
        if (datos != null){
            rfc.val("");
            nss.val("");
            enviar.val(0);
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
            $('#rnombre').val(datos.empleado_nombre);
            $('#rapaterno').val(datos.empleado_apaterno);
            $('#ramaterno').val(datos.empleado_amaterno);
            $('#rcalle').val(datos.calle);
            $('#rno_exterior').val(datos.num_exterior);
            $('#no_interior').val(datos.num_interior);
            $('#rcolonia').val(datos.colonia);
            $('#rmunicipio').val(datos.municipio);
            $('#rcp').val(datos.cp);
            $('#estado').val(datos.estado);
            $('#rnss').val(datos.nss);
            $('#rrfc').val(datos.rfc);
            $('#rcurp').val(datos.curp);
            $('#telefono').val(datos.telefono);
            $('#rtelefono2').val(datos.telefono2);
            $('#rmail').val(datos.mail);
            $('#empleado').val(datos.empleado_num).prop("readonly", true);
            enviar.val(datos.empleado_id);
            enviar.attr("disabled", false);
            autollenado.hide();
            span.text("");
        }
    });
});