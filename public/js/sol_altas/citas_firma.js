function ordenarSelect(id_componente) {
    //  alert(id_componente);
    var selectToSort = jQuery('#' + id_componente);
    var optionActual = selectToSort.val();
    selectToSort.html(selectToSort.children('option').sort(function (a, b) {
        return a.text === b.text ? 0 : a.text < b.text ? -1 : 1;
    })).val(optionActual);
}

var CSRF_TOKEN = $('#token').val();
var reset      = 0;
var s_esta     = null;

var table = $('#citas-firma-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    ajax: {
        url: '/datatables/get_citas_firma',
        type: 'GET',
        data: function (data) {
            data.reset   = reset;
            data.estatus = s_esta;
        }
    },
    order: [[0, "desc"]],
    columns: [
        {data: 'id',                name: 'id'},
        {data: 'status_cita',       name: 'status_cita',  orderable: false, searchable: false},
        {data: 'WBS',               name: 'WBS'},
        {data: 'Nombre',            name: 'Nombre'},
        {data: 'coordinador',       name: 'coordinador'},
        {data: 'Auth_direccion',    name: 'Auth_direccion'},
        {data: 'Auth_RH',           name: 'Auth_RH'},
        {data: 'fecha_cita',        name: 'fecha_cita'},
        {data: 'hora_cita',         name: 'hora_cita'},
        {data: 'status_cita',       name: 'status_cita'},
        {data: 'correo_cita',       name: 'correo_cita'},
        {data: 'detalles_cita',     name: 'detalles_cita'}
    ],
    /*"render":function(data, type, full, meta ){
        return'<button type="button" onclick="Editar('+full.ID+')" class="btn btn-warning btn-sm" ><i class="fa fa-edit"></i>Editar</button> <button type="button" onclick="eliminar('+full.ID+')" class="btn btn-danger btn-sm" ><i class="fa fa-trash"></i> Eliminar</button>'
        }
    }*/
    language: {
        "lengthMenu":   "Mostrando _MENU_ registros por página",
        "zeroRecords":  "Nada que mostrar",
        "info":         "Página _PAGE_ de _PAGES_",
        "infoEmpty":    "No hay información disponible",
        "infoFiltered": "(filtrado de _MAX_ registros )",
        "search":       "Buscar:",
        "paginate": {
            "previous": "Anterior",
            "next":     "Siguiente",
            "first":    "Primera",
            "last":     "Última"
        },
        processing: '<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>'
    },
    'columnDefs': [
        {
            "targets":  1, // your case first column
            "data":     null,
            "render":   function (data, type, row) {
                if (auth_emp == 1) {
                    switch (data) {
                        case "PENDIENTE"  :
                            return "<button data-tipo='Autorizar'class='info btn btn-xs btn-success btnAutorizarEmpleado' data-toggle='modal' data-target='#ModalDataEmpleado''><i class='fa fa-user-plus nav-icon nav-icon nav-icon'></i></button>";
                            break;
                        default :
                            return '<i class="fas fa-check-circle" style="color:#007bffcc;font-size:20px"></i>';
                    }
                } else {
                    return '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
            }
        },
    ]
});

new $.fn.dataTable.FixedHeader(table);

var data;
$('#citas-firma-table tbody').on('click', '.btn', function () {
    data = table.row($(this).parent()).data();
});

$('#ModalDataEmpleado').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});

$('#ModalDataEmpleado').on('show.bs.modal', function (event) {
    // Obtener la lista de coordinadores
    $('#coordinador').empty();
    var id_solicitud = data.id;
    var cliente      = data.cliente;
    $.ajax({
        url:'/empleados/get_coordinadores',
        type: 'GET',
        dataType:'JSON',
        data:{
            cliente: cliente
        },
        success: function (data) {
            if (data.ok == true) {
                var options = data.data;
                var select = $('#coordinador');
                for (i in options) {
                    select.append($('<option>', {
                        value: options[i].id,
                        text: options[i].nombre
                    }));
                }
            }
        }
    });

    // Obterner los datos de la solicitud del posible empleado
    $.ajax({
        url:'/altas/get_solicitud',
        type: 'POST',
        dataType:'JSON',
        data:{
            _token: CSRF_TOKEN,
            id: id_solicitud
        },
        success: function (data) {
            if (data.ok == true){
                var solicitud = data.data;
                $("#servicio").html(solicitud.servicio);
                $("#cliente").html(solicitud.cliente);
                $("#region").html(solicitud.region);
                $("#tecnologia").html(solicitud.tecnologia);
                $("#grupo").html(solicitud.grupo);
                $("#nombre").val(solicitud.nombre);
                $("#apaterno").val(solicitud.apaterno);
                $("#amaterno").val(solicitud.amaterno);
                if (solicitud.correo_cita != null && solicitud.correo_cita != undefined) {
                    $("#email").val(solicitud.correo_cita)
                }
                $("#fecha_ingreso").val(solicitud.fecha_inicio);
                if (solicitud.puesto != null && solicitud.puesto != undefined) {
                    $("#puesto").val(solicitud.puesto)
                }
                if (solicitud.sueldo_imss != null && solicitud.sueldo_imss != undefined) {
                    $("#sueldo_imss").val(solicitud.sueldo_imss)
                }
                if (solicitud.sueldo_variable != null && solicitud.sueldo_variable != undefined) {
                    $("#sueldo_variable").val(solicitud.sueldo_variable)
                }
                if (solicitud.esquema != null && solicitud.esquema != undefined) {
                    $("#esquema").val(solicitud.esquema)
                }
                $("#coordinador").val(solicitud.coordinador_id);
                $("#area").val(solicitud.area);
                $("#ind_alcatel").val(solicitud.ind);
            }
        }
    });
});

function saveEmpleado() {
    var CSRF_TOKEN   = $('#token').val();
    var id_solicitud = data['id'];
    var dataRes      = {
        _token:             CSRF_TOKEN,
        name:               $("#nombre").val(),
        apaterno:           $("#apaterno").val(),
        amaterno:           $("#amaterno").val(),
        calle:              $("#calle").val(),
        num_ext:            $("#num_ext").val(),
        num_int:            $("#num_int").val(),
        colonia:            $("#colonia").val(),
        municipio:          $("#municipio").val(),
        cp:                 $("#cp").val(),
        estado:             $("#estado").val(),
        nss:                $("#nss").val(),
        rfc:                $("#rfc").val(),
        curp:               $("#curp").val(),
        email:              $("#email").val(),
        telefono1:          $("#telefono1").val(),
        telefono2:          $("#telefono2").val(),
        cliente:            $("#cliente").val(),
        servicio:           $("#servicio").val(),
        region:             $("#region").val(),
        tecnologia:         $("#tecnologia").val(),
        grupo:              $("#grupo").val(),
        fecha_ingreso:      $("#fecha_ingreso").val(),
        num_empleado:       $("#num_empleado").val(),
        empresa:            $("#empresa").val(),
        localidad:          $("#localidad").val(),
        segmento:           $("#segmento").val(),
        coordinador:        $("#coordinador").val(),
        ind_alcatel:        $("#ind_alcatel").val(),
        proveedor:          $("#proveedor").val(),
        razon_social:       $("#razon_social").val(),
        puesto:             $("#puesto").val(),
        area:               $("#area").val(),
        sueldo_imss:        $("#sueldo_imss").val(),
        sueldo_variable:    $("#sueldo_variable").val(),
        esquema:            $("#esquema").val(),
        esquema_viaticos:   $("#esquema_viaticos").val(),
        num_monex:          $("#num_monex").val(),
        num_cuenta:         $("#num_cuenta").val(),
        clabe:              $("#clabe").val(),
        banco:              $("#banco").val(),
        observaciones:      $("#observaciones").val(),
        enviar:             $("#enviar").val(),
        id_solicitud:       id_solicitud
    };
    if (validate(dataRes)) {
        // Obterner los datos de la solicitud del posible empleado
        $.ajax({
            'url': '/empleados/create_empleado',
            'type': 'POST',
            'dataType': 'JSON',
            'data': dataRes,
            beforeSend: function () {
                $().loader("show");
            },
            complete: function () {
                $().loader("hide");
            },
            success: function (data) {
                if (data.fecha == true){
                    Swal.fire("Ocurrio un error", "La fecha de ingreso debe ser mayor a: <strong>"+data.data.fecha_fin+'</strong>', "error");
                }
                else {
                    if (data.ok == true){
                        Swal.fire("Correcto", "El empleado se ha guardado con exito;", "success").then((value) => {
                            location.href = "/empleados";
                        });
                    }
                    else
                        Swal.fire("Ocurrio un error", "Error al guardar el empleado", "error");
                }
            }
        });
    } else {
        Swal.fire("Error en la validacion de los campos", "Uno o mas campos obligatorios incorrectos", "error");
    }
}

function validate(obj) {

    var validation = true;
    $.each(obj, function (key, value) {
        if (key == 'num_int' || key == 'telefono2' || key == 'ind_alcatel' || key == 'cliente' || key == 'servicio' || key == 'region' || key == 'tecnologia' || key == 'grupo' || key == 'observaciones')
            console.log();
        else{
            if (value == ""){
                validation = false;
                $('#'+key).css('border-color','red');
            }
            else {
                $('#'+key).css('border','1px solid #ced4da');
            }
        }
    });

    return validation;
}

var search_estatus = $('#search_estatus');

search_estatus.on('change', function () {
    s_esta = $(this).val();
    table.draw();
});

$('#reset').on('click', function (e) {
    reset    = 1;
    s_esta   = null;
    search_estatus.val("");
    table.draw();
    e.preventDefault();
    reset = 0;
});