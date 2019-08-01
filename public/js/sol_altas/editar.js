var solicitud = JSON.parse(sol);   // Obetener la solicitud
var vista     = JSON.parse(vista); // Obetener el registro en la vista de solicitudes de alta

// LLenar el WBS del recurso y desabilitarlo
var wbs = ['cliente','servicio','region','tecnologia','grupo'];
$("#c_wbs").hide();
for (i in wbs){
    var item = wbs[i];
    var select = $('#'+item);
    select.append($('<option>', {
        value: solicitud[item],
        text: solicitud[item]
    }));
    select.val(solicitud[item]);
    select.prop('disabled', true);
}
$('#esquema').val(solicitud.esquema).trigger('change'); // Emular la seleccion del tipo de sueldo para que despliegue los inputs correspondientes
$('#servicio').trigger('change'); // Emular la seleccion del servicio para que despliegue los inputs correspondientes
// LLenar la etiqueta del WBS
$("#wbs_completa").empty();
$("#wbs_completa").html(vista.WBS);

// Revisar si el servicio necesita calcular venta
switch (solicitud.servicio) {
    case 'POLZ':
        $('#codigo_poliza').val('NFF-SOP-TAC-SM-001');
        $.ajax({
            url:'/pet_sol/get_codigos_poliza',
            type: 'GET',
            dataType:'JSON',
            data:{
                term: $('#codigo_poliza').val(),
                edit:1
            },
            success:function (data) {
                var codigo = data;
                var total = (codigo.incluye == null || codigo.incluye == "") ? 0 : codigo.incluye;
                var sueldo_venta = (total == 0) ? codigo.precio : (codigo.precio / total).toFixed(2);
                $('#codigo_poliza').val(codigo.value);
                $("#sueldo_venta_div").empty();
                $("#costo_pol").empty();
                $("#cantidad_pol_inc").empty();
                $("#costo_pol").append('<strong style="color: red; font-weight: bold;">$ ' + codigo.precio + '</strong>');
                $("#cantidad_pol_inc").append('<strong style="color: red; font-weight: bold;">' + total + '</strong>');
                $("#sueldo_venta_div").append('<input name="sueldo_venta" id="sueldo_venta_p" class="form-control" value="' + sueldo_venta + '" readonly="readonly">');
            }
        });
        break;
    case 'SERV':
        $.ajax({
            url:'/pet_sol/get_codigos_sueldo',
            type: 'GET',
            dataType:'JSON',
            data:{
                term: solicitud.codigo_sueldo,
                edit:1
            },
            success:function (data) {
                var codigo = data;
                $('#codigo_sueldo').attr('data-id', codigo.id);
                $('#codigo_sueldo').attr('data-precio', codigo.precio);
                $('#codigo_sueldo').attr('data-diario', codigo.diario);
                $('#sueldo_venta_c').val(codigo.precio).prop('readonly',true);
                $('#costo_nomina').prop('readonly',true);
            }
        });
        break;
    case 'TKBS':
        $('#sueldo_venta').val(solicitud.sueldo_venta);
        $.ajax({
            url:'/pet_sol/get_codigos_sueldo',
            type: 'GET',
            dataType:'JSON',
            data:{
                term: solicitud.codigo_sueldo,
                edit:1
            },
            success:function (data) {
                var codigo = data;
                $('#codigo_sueldo').attr('data-id', codigo.id);
                $('#codigo_sueldo').attr('data-precio', codigo.precio);
                $('#codigo_sueldo').attr('data-diario', codigo.diario);
                $('#sueldo_venta_c').val(codigo.precio).prop('readonly',true);
                $('#costo_nomina').prop('readonly',true);
            }
        });
        break;
    default:
        break;
}

if (solicitud.celular == 1){
    $('#celular').trigger('click');
    if (solicitud.servicio == "SERV"){
        $.ajax({
            url:'/pet_sol/get_codigos_celular',
            type:'GET',
            dataType:'JSON',
            data:{
                term:solicitud.codigo_celular,
                edit:1
            },
            success:function (data) {
                var codigo = data;
                var costo_cel = $("#costo_celular_incore").val();

                $('#codigo_celular').val(codigo.value);
                $('#codigo_celular').attr('data-id', codigo.id);
                $('#codigo_celular').attr('data-precio', codigo.precio);
                $('#codigo_celular').attr('data-diario', codigo.diario);

                $("#venta_celular_label").html(codigo.precio);

                if (codigo.diario == 1 || codigo.diario == "1") {
                    $("#costo_celular_label").html((parseFloat(costo_cel) / 30).toFixed(2));
                } else {
                    $("#costo_celular_label").html(parseFloat(costo_cel).toFixed(2));
                }
            }
        });
    }
}
if (solicitud.computadora == 1){
    $('#computadora').trigger('click');
    if (solicitud.servicio == "SERV"){
        $.ajax({
            url:'/pet_sol/get_codigos_computadora',
            type:'GET',
            dataType:'JSON',
            data:{
                term:solicitud.codigo_computadora,
                edit:1
            },
            success:function (data) {
                var codigo    = data;
                var costo_com = $("#costo_computadora_incore").val();

                $('#codigo_computadora').val(codigo.value);
                $('#codigo_computadora').attr('data-id', codigo.id);
                $('#codigo_computadora').attr('data-precio', codigo.precio);
                $('#codigo_computadora').attr('data-diario', codigo.diario);

                $("#venta_computadora_label").html(codigo.precio);

                if (codigo.diario == 1 || codigo.diario == "1") {
                    $("#costo_computadora_label").html((parseFloat(costo_com) / 30).toFixed(2));
                } else {
                    $("#costo_computadora_label").html(parseFloat(costo_com).toFixed(2));
                }
            }
        });
    }
}
if (solicitud.software == 1){
    $('#software').trigger('click');
    if (solicitud.servicio == "SERV"){
        $.ajax({
            url:'/pet_sol/get_codigos_software',
            type:'GET',
            dataType:'JSON',
            data:{
                term:solicitud.codigo_software,
                edit:1
            },
            success:function (data) {
                var codigo = data;
                $('#codigo_software').val(codigo.value);
                $('#codigo_software').attr('data-id', codigo.id);
                $('#codigo_software').attr('data-precio', codigo.precio);
                $('#codigo_software').attr('data-diario', codigo.diario);

                $("#venta_software_label").html(codigo.precio);
                $("#costo_software_label").html((parseFloat(codigo.precio) * 0.7).toFixed(2));
            }
        });
    }
}
if (solicitud.correo == 1)
    $('#correo').trigger('click');
if (solicitud.bam == 1){
    $('#bam').trigger('click');
    if (solicitud.servicio == "SERV"){
        $.ajax({
            url:'/pet_sol/get_codigos_bam',
            type:'GET',
            dataType:'JSON',
            data:{
                term:solicitud.codigo_bam,
                edit:1
            },
            success:function (data) {
                var codigo = data;
                var costo_bam = $("#costo_bam_incore").val();

                $('#codigo_bam').val(codigo.value);
                $('#codigo_bam').attr('data-id', codigo.id);
                $('#codigo_bam').attr('data-precio', codigo.precio);
                $('#codigo_bam').attr('data-diario', codigo.diario);

                $("#venta_bam_label").html(codigo.precio);

                if (codigo.diario == 1 || codigo.diario == "1") {
                    $("#costo_bam_label").html((parseFloat(costo_bam) / 30).toFixed(2));
                } else {
                    $("#costo_bam_label").html(parseFloat(costo_bam).toFixed(2));
                }
            }
        });
    }
}
if (solicitud.auto == 1){
    $('#auto').trigger('click');
    if (solicitud.servicio == "SERV"){
        $.ajax({
            url:'/pet_sol/get_codigos_auto',
            type:'GET',
            dataType:'JSON',
            data:{
                term:solicitud.codigo_auto,
                edit:1
            },
            success:function (data) {
                var codigo = data;
                var costo_auto = $("#costo_auto_incore").val();

                $('#codigo_auto').val(codigo.value);
                $('#codigo_auto').attr('data-id', codigo.id);
                $('#codigo_auto').attr('data-precio', codigo.precio);
                $('#codigo_auto').attr('data-diario', codigo.diario);

                $("#venta_auto_label").html(codigo.precio);

                if (codigo.diario == 1 || codigo.diario == "1") {
                    $("#costo_auto_label").html((parseFloat(costo_auto) / 30).toFixed(2));
                } else {
                    $("#costo_auto_label").html(parseFloat(costo_auto).toFixed(2));
                }
            }
        });
    }
}
if (solicitud.botas == 1)
    $('#botas').trigger('click');
if (solicitud.playera == 1)
    $('#playera').trigger('click');

if (solicitud.servicio == "SERV" || solicitud.servicio == "POLZ" || solicitud.servicio == "TKBS"){
    costoVenta();
}

$('#guarda_info').html('Actualizar Solicitud');
$('#caso_negocio_div').hide();