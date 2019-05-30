$(".select_wbs").on('change', function () {
    var id = $(this).attr('id');
    var data_id = $(this).data('id');
    var valor = $(this).val();
    var token = $('input[name=_token]').val();
    var campo = '';
    var tabla = '';
    for (var i = data_id; i >= 1; i--) {
        var valor_e = $('*[data-id="' + i + '"]').val();
        var id_e = $('*[data-id="' + i + '"]').attr('id');
        window[id_e] = valor_e;
    }

    for (var i = data_id + 1; i <= 5; i++) {
        var id_e = $('*[data-id="' + i + '"]').attr('id');
        $('#' + id_e).empty();
        $('#' + id_e).append("<option>" + id_e.toUpperCase() + "</option>");
        window[id_e] = '';
    }

    switch (id) {
        case 'cliente':
            campo = 'servicio';
            tabla = 'servicios';
            break;
        case 'servicio':
            campo = 'region';
            tabla = 'regiones';
            break;
        case 'region':
            campo = 'tecnologia';
            tabla = 'tecnologias';
            break;
        case 'tecnologia':
            campo = 'grupo';
            tabla = 'grupos';
            break;
        default:
            campo = 'otro';
            tabla = 'otro';
    }
    if (id != 'grupo') {
        $().loader("show");

        // MOD-SAM:CAMBIAR RUTA DEL SERVIDOR EN PRODUCION 
        // 09-11-18

        $.post("/wbs/get_wbs",
            {
                cliente: cliente,
                servicio: servicio,
                region: region,
                tecnologia: tecnologia,
                grupo: grupo,
                valor: valor,
                campo: campo,
                tabla: tabla,
                '_token': token,
            })
            .done(function (data) {
                var selects = ['servicio', 'region', 'tecnologia', 'grupo'];

                var add = "<option value=''>" + campo.toUpperCase() + "</option>";
                $.each(data, function () {
                    add += '<option value="' + this.id + '">' + this.nombre + '</option>';
                });
                $('#' + campo).empty();
                $('#' + campo).append(add);
                $().loader("hide");

            })
            .fail(function (data) {
                alert("error:" + data);
                console.log(data);
            })
    } else {
        $().loader("hide");

    }
    $("#wbs_completa").empty();
    $("#wbs_completa").append(cliente + '-' + servicio + '-' + region + '-' + tecnologia + '-' + grupo);

    // VALIDACIONES PARA LOS CAMPOS DE NOK-RREC
    var cliente_val = $("#cliente").val();
    var servicio_val = $("#servicio").val();

    if (servicio_val === "RREC" || servicio_val === "POLZ" || servicio_val === "TKBS" || servicio_val === "SERV") {
        //MOSTRAR ESQUEMA
        $("#esquema_div").removeClass('hide');
        //NUEVO COORDINADOR
        $("#coord_nuevo_div").removeClass('hide');
        //VENTA CALCULADA
        $("#venta_calculada_div").removeClass('hide');
        var esquema = $('#esquemas');
        $('#esquemas option[value="1"]').prop('disabled', false);
        $('#esquemas option[value="2"]').prop('disabled', false);
        $('#esquemas option[value="3"]').prop('disabled', false);
        $('#esquemas option[value="4"]').prop('disabled', false);
        $('#esquemas option[value="6"]').prop('disabled', false);
        $('#esquemas option[value="7"]').prop('disabled', false);
        switch (servicio_val) {
            case "POLZ":
                esquema.val(6);
                $('#esquemas option[value="1"]').prop('disabled', true);
                $('#esquemas option[value="2"]').prop('disabled', true);
                $('#esquemas option[value="3"]').prop('disabled', true);
                $('#esquemas option[value="4"]').prop('disabled', true);
                $('#esquemas option[value="7"]').prop('disabled', true);
                esquema.trigger('change');
                break;
            case "TKBS":
                $('#esquemas option[value="1"]').prop('disabled', true);
                $('#esquemas option[value="3"]').prop('disabled', true);
                $('#esquemas option[value="4"]').prop('disabled', true);
                $('#esquemas option[value="6"]').prop('disabled', true);
                $('#esquemas option[value="7"]').prop('disabled', true);
                esquema.val(2);
                esquema.trigger('change');
                break;
            case "SERV":
                $('#esquemas option[value="1"]').prop('disabled', true);
                $('#esquemas option[value="2"]').prop('disabled', true);
                $('#esquemas option[value="6"]').prop('disabled', true);
                $('#esquemas option[value="7"]').prop('disabled', true);
                esquema.val(3);
                esquema.trigger('change');
                break;
            case "RREC":
                esquema.val(0);
                esquema.trigger('change');
                break;
            default:
                //esquema.val('0');
                break;
        }
    } else {
        //OCULTAR ESQUEMA
        $("#esquema_div").addClass('hide');
        $("#esquemas").val('1');
        // CUADRO DE VENTA ESPERADA
        $("#sueldo_venta").val("");
        $("#codigo_poliza").val("");
        $("#sueldo_venta_div").empty();
        $("#costo_pol").empty();
        $("#cantidad_pol_inc").empty();
        $("#venta_esperada_div").addClass('hide');
        $("#esq_task").addClass('hide');
        $("#esq_poliza").addClass('hide');
        //NUEVO COORDINADOR
        $("#coord_nuevo_div").addClass('hide');
        //VENTA CALCULADA
        $("#venta_calculada_div").addClass('hide');
        $("#codigo_sueldo_div").addClass('hide');
        $("#sueldo_venta_c_div").addClass('hide');
        $("#codigo_sueldo").val('');
        $("#sueldo_venta_c").val('');

    }

    if (servicio_val === "RREC" || servicio_val === "POLZ" || servicio_val === "TKBS" || servicio_val === "SERV") {
        //CASO DE NEGOCIO
        $("#caso_negocio_div").removeClass('hide');
    } else {
        //CASO DE NEGOCIO
        $("#caso_negocio_div").addClass('hide');
    }

});


$(".select_wbss").on('change', function () {

    var id = $(this).attr('id');
    alert(id);
    var data_id = $(this).data('id');
    var valor = $(this).val();
    var token = $('input[name=_token]').val();
    var campo = '';
    var tabla = '';


    switch (id) {
        case 'cliente':
            campo = 'servicio';
            tabla = 'servicios';
            break;
        case 'servicio':
            campo = 'region';
            tabla = 'regiones';
            break;
        case 'region':
            campo = 'tecnologia';
            tabla = 'tecnologias';
            break;
        case 'tecnologia':
            campo = 'grupo';
            tabla = 'grupos';
            break;
        default:
            campo = 'otro';
            tabla = 'otro';
    }
    if (id != 'grupo') {
        $().loader("show");

        // MOD-SAM:CAMBIAR RUTA DEL SERVIDOR EN PRODUCION 
        // 09-11-18

        var Datos = {
            cliente: cliente,
            servicio: servicio,
            region: region,
            tecnologia: tecnologia,
            grupo: grupo,
            valor: valor,
            campo: campo,
            tabla: tabla,
            '_token': token,
        };

        console.log(Datos);


        $.post("/wbs/get_wbs", Datos,
            function (data) {

                console.log(data);

            });


        //     $.post( "/rh/public/getWbs", Datos)
        //     (function( data ) {
        //         var selects = ['servicio','region','tecnologia','grupo'];
        //         var add = "<option value=''>"+campo.toUpperCase()+"</option>";
        //         $.each(data,function(){
        //             add +='<option value="'+this.id+'">'+this.nombre+'</option>';
        //         });
        //         $('#'+campo).empty();
        //         $('#'+campo).append(add);
        //         $().loader("hide");

        //     })
        //     .fail(function( data ) {
        //         alert( "error:"+data );
        //         console.log(data);
        //     })
        // } else {
        //     $().loader("hide");

        // }
        // $("#wbs_completa").empty();
        // $("#wbs_completa").append(cliente+'-'+ servicio+'-'+ region+'-'+ tecnologia+'-'+ grupo);

    }
});

$('#cliente').on('change', function () {
    var cliente = $(this);
    $.ajax({
        url: '/altas/get_coordinadores',
        type: 'GET',
        datType: 'JSON',
        data:{
            cliente: cliente.val()
        },
        success:function (data) {
            if (data.ok == true){
                var coord = $('#coordinador_id');
                var options = data.data;
                coord.empty();
                for (i in options){
                    coord.append($('<option>', {
                        value: options[i].id,
                        text : options[i].nombre
                    }));
                }
            }
        }
    });
});