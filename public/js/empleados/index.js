var tabla;
var s_id     = null;
var n_emp    = null;
var s_nombre = null;
var s_coord  = null;
var s_pd     = null;
var reset    = 0;
var CSRF_TOKEN = $('#token').val();
var table = $('#empleados-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    ajax: {
        url: '/datatables/get_data_empleados',
        type: 'GET',
        dataType: 'JSON',
        data:function (data) {
            data.search_id     = s_id;
            data.num_emp       = n_emp;
            data.search_nombre = s_nombre;
            data.search_coord  = s_coord;
            data.search_pd     = s_pd;
            data.reset         = reset;
        }
    },
    order: [[0, "desc"]],
    columns: [
        {data: 'id', name: 'id'},
        {data: null, name: 'info', orderable: false, searchable: false},
        {data: 'empleado_estatus', name: 'empleado_estatus', orderable: false, searchable: false, className:'text-center editar_v'},
        {data: 'empleado_estatus', name: 'empleado_estatus', orderable: false, searchable: false, className:'text-center baja_v'},
        {data: null, name: 'viable', orderable: false, searchable: false, className:'text-center viable_v'},
        {data: 'empleado_num', name: 'empleado_num'},
        {data: 'nombre_completo', name: 'nombre_completo'},
        {data: 'coordinador', name: 'coordinador'},
        {data: 'pd', name: 'pd'},
        {data: 'puesto', name: 'puesto'},
        {data: 'segmento', name: 'segmento'},
        {data: 'sueldo_imss', name: 'sueldo_imss', className:'sueldo_v'},
        {data: 'sueldo_asimilado', name: 'sueldo_asimilado', className:'sueldo_v'},
        {data: 'empleado_estatus', name: 'empleado_estatus'},
        {data: 'empleado_fecha_alta', name: 'empleado_fecha_alta'}
    ],
    language: {
        "lengthMenu": "Mostrando _MENU_ registros por página",
        "zeroRecords": "Nada que mostrar",
        "info": "Página _PAGE_ de _PAGES_",
        "infoEmpty": "No hay información disponible",
        "infoFiltered": "(filtrado de _MAX_ registros )",
        "search": "Buscar:",
        "paginate": {
            "previous": "Anterior",
            "next": "Siguiente",
            "first": "Primera",
            "last": "Última"
        },
        processing: '<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>'
    },
    'columnDefs': [
        {
            "targets": 1,
            "data": null,
            "render": function () {
                return "<button data-tipo='Informacion' style='font-size: 16px;' class='info btn btn-xs btn-success iconInfo' data-toggle='modal' data-target='#Modal'><i class='fa fa-info nav-icon nav-icon'></i></button>";
            },
            "className": "info"
        },
        {
            "targets": 2, // your case first column
            "data": null,
            "className": "text-center",
            "render": function (data, type, row) {
                if (edit_emple == 1) {
                    switch (data) {
                        case 'BAJA':
                            return '<i class="fa fa-ban" style="color:orange;font-size:16px"></i>';
                            break;
                        case 'ACTIVO':
                            return "<button  class='Editar btn-xs btn-primary iconEdit' style='margin-rigth: 5px;margin-left: 5px;font-size: 16px'><i class='fa fa-pencil-square-o'></i></button>";
                            break;
                    }
                } else {
                    return '<i class="fa fa-ban" style="color:orange;font-size:16px"></i>';
                }
            },
        },
        {
            "targets": 3, // your case first column
            "data": null,
            "className": "text-center",
            "render": function (data, type, row) {
                if (baja_emple == 1) {
                    switch (data) {
                        case 'BAJA':
                            return '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                            break;
                        case 'ACTIVO':
                            return "<button  class='DarBajaEmpleado btn btn-xs btn-danger btnBajaEmpleado' style='margin-rigth: 5px;margin-left: 5px;font-size: 16px'><i class='fas fa-user-minus'></i></i></button>"
                            break;
                    }
                } else {
                    return '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
            },
        },
        {
            "targets": 4,
            "data": null,
            "render": function (data, type, row) {
                var view = '';
                var via = parseInt(row.viable);
                switch (via) {
                    case 0:
                        view = '<a class="viable btn btn-sm text-danger" title="No Viable"><i class="fa fa-frown-o" aria-hidden="true"></i></a>';
                        break;
                    case 1:
                        view = '<a class="viable btn btn-sm text-success" title="Viable"><i class="fa fa-smile-o" aria-hidden="true"></i></a>';
                        break;
                    case 2:
                        view = '<a class="viable btn btn-sm text-warning" title="Viable con Reservas"><i class="fa fa-meh-o" aria-hidden="true"></i></a>';
                        break;
                    default:
                        view = '<a class="viable btn btn-sm text-secondary" title="No Aplica"><i class="fa fa-question-circle" aria-hidden="true"></i></a>';
                        break;
                }
                return view;
            }
        },
    ]
});

//Guardar sql para los reportes
table.on( 'xhr', function () {
    var json = table.ajax.json();
    var input = $('#sql_input');
    input.val("");
    input.val(json.sql);
});

new $.fn.dataTable.FixedHeader(table);

$('#empleados-table tbody').on('click', '.Editar', function () {
    data = table.row($(this).parent()).data();
    $("#lservicio").empty();
    $("#lcliente").empty();
    $("#lregion").empty();
    $("#ltecnologia").empty();
    $("#lgrupo").empty();
    $('#spn_coord').empty();
    empleado_id = data['id'];
    var datosRe = {
        _token: CSRF_TOKEN,
        empleado_id: empleado_id
    };
    $('#myModal').modal('show');
    $('#titulomodal').text("Editar Empleado");
    $.post("/empleados/get_empleado", datosRe,

        function (data) {
            var o = data.data;
            var select = document.getElementById('empleado_id');
            $("#empleado_id").empty();
            for (value in o.empleado_id) {
                var option = document.createElement("option");
                option.text = o.empleado_id[value];
                option.value = value;
            }

           if ((o.empresa)=="EXTERNO"){
             $('#eid').val(o.id);
             $('#e_id').hide();
             $('#enombre').val(o.empleado_nombre);
             $('#eapaterno').val(o.empleado_apaterno);
             $('#eamaterno').val(o.empleado_amaterno);
             $('#ecalle').val(o.calle);
             $('#eno_exterior').val(o.num_exterior);
             $('#eno_interior').val(o.num_interior);
             $('#ecolonia').val(o.colonia);
             $('#emunicipio').val(o.municipio);
             $('#ecp').val(o.cp);
             $('#eestado').val(o.estado);

             $('#enss').val(o.nss);
             $('#enss').attr("readonly","readonly");
             $('#erfc').val(o.rfc);
             $('#erfc').attr("readonly","readonly");
             $('#ecurp').val(o.curp);
             $('#ecurp').attr("readonly","readonly");

             $('#email').val(o.mail);
             $('#etelefono').val(o.telefono);
             $('#etelefono2').val(o.telefono2);
             $('#efecha_ingreso').val(o.fecha_ingreso);
             $('#eempleado').val(o.empleado_num);
             $('#eempresa').val(o.empresa);
             $('#elocalidad').val(o.localidad);
             $('#esegmento').val(o.segmento);
             $('#esegmento').attr("readonly","readonly");
             $('#eind_val').val(o.empleado_alcatel_id);
             $('#erazon_rh').val(o.razon);
             $('#epuesto').val(o.id_puesto);
             $('#show_edit_sueldo').hide();
             $('#show_edit_coord').hide();
             $('#esueldo_imss').val(o.sueldo_imss);
             $('#esueldo_asimilado').val(o.sueldo_asimilado);
             $('#eesquema').val(o.esquema);
             $('#eesquema').hide();
             $('#eesquema_viaticos').val(o.esquema_viaticos);
             $('#eesquema_viaticos').hide();
             $('#spn_coord').append(o.coordinador);
             $('#ecoordinadores').val(o.coordinador_id);

             $('#emonex').val(o.monex);
             $('#enum_cuenta').val(o.num_cuenta);
             $('#ebanco').val(o.banco);
             $('#eclabe').val(o.clabe);
             $('#eobservaciones').val(o.empleado_observaciones);
             $('#id_tabla').find('.ocultar_tr').hide();


             $("#lservicio").append(o.servicio);
             $("#lcliente").append(o.cliente);
             $("#lregion").append(o.region);
             $("#ltecnologia").append(o.tecnologia);
             $("#lgrupo").append(o.grupo);
             $("#mov_coord_id").val(o.movimiento_coordinador_id);
             $("#mov_proy_id").val(o.movimiento_proyecto_id);
             $("#mov_pues_id").val(o.movimiento_puesto_id);
             $("#mov_rec_id").val(o.movimiento_recurso_id);
             $("#mov_suel_id").val(o.movimiento_sueldo_id);

           }
           else {

             $('#eid').val(o.id);
             $('#e_id').hide();
             $('#enombre').val(o.empleado_nombre);
             $('#eapaterno').val(o.empleado_apaterno);
             $('#eamaterno').val(o.empleado_amaterno);
             $('#ecalle').val(o.calle);
             $('#eno_exterior').val(o.num_exterior);
             $('#eno_interior').val(o.num_interior);
             $('#ecolonia').val(o.colonia);
             $('#emunicipio').val(o.municipio);
             $('#ecp').val(o.cp);
             $('#eestado').val(o.estado);

             $('#enss').val(o.nss);
             $('#enss').removeAttr("readonly");
             $('#erfc').val(o.rfc);
             $('#erfc').removeAttr("readonly");
             $('#ecurp').val(o.curp);
             $('#ecurp').removeAttr("readonly");

             $('#email').val(o.mail);
             $('#etelefono').val(o.telefono);
             $('#etelefono2').val(o.telefono2);
             $('#efecha_ingreso').val(o.fecha_ingreso);
             $('#eempleado').val(o.empleado_num);
             $('#eempresa').val(o.empresa);
             $('#elocalidad').val(o.localidad);
             $('#esegmento').val(o.segmento);
             $('#esegmento').removeAttr("readonly");
             $('#eind_val').val(o.empleado_alcatel_id);
             $('#erazon_rh').val(o.razon);
             $('#epuesto').val(o.id_puesto);
             $('#show_edit_sueldo').show();
             $('#show_edit_coord').show();
             $('#esueldo_imss').val(o.sueldo_imss);
             $('#esueldo_asimilado').val(o.sueldo_asimilado);
             $('#eesquema').val(o.esquema);
             $('#eesquema').show();
             $('#eesquema_viaticos').val(o.esquema_viaticos);
             $('#eesquema_viaticos').show();
             $('#spn_coord').append(o.coordinador);
             $('#ecoordinadores').val(o.coordinador_id);

             $('#emonex').val(o.monex);
             $('#enum_cuenta').val(o.num_cuenta);
             $('#ebanco').val(o.banco);
             $('#eclabe').val(o.clabe);
             $('#eobservaciones').val(o.empleado_observaciones);
             $('#id_tabla').find('.ocultar_tr').show();


             $("#lservicio").append(o.servicio);
             $("#lcliente").append(o.cliente);
             $("#lregion").append(o.region);
             $("#ltecnologia").append(o.tecnologia);
             $("#lgrupo").append(o.grupo);
             $("#mov_coord_id").val(o.movimiento_coordinador_id);
             $("#mov_proy_id").val(o.movimiento_proyecto_id);
             $("#mov_pues_id").val(o.movimiento_puesto_id);
             $("#mov_rec_id").val(o.movimiento_recurso_id);
             $("#mov_suel_id").val(o.movimiento_sueldo_id);
           }


        }
    )
});

$('#show_edit_coord').on('click', function (e) {
    $('#editar_coord').fadeIn();
    $('#div_coord').fadeOut();
    e.preventDefault();
});

$('#cancel_coord').on('click', function (e) {
    $('#editar_coord').fadeOut();
    $('#div_coord').fadeIn();
    e.preventDefault();
});

$('#empleados-table tbody').on('click', '.cambio_proyect', function () {
    data = table.row($(this).parent()).data();
    $('#cliente_ca').val(data.cliente);
    $('#servicio_ca').val(data.servicio);
    $('#region_ca').val(data.region);
    $('#tecnologia_ca').val(data.tecnologia);
    $('#grupo_cabio').val(data.grupo);
    $('#modal_cambio_pro').modal('show');
}); // Pausar para buscar una mejor manera de hacerlo

$('#save_coord').on('click', function (e) {
    var validador = existe('editar_coord');
    if (validador == false)
        return false;
    var id = $('#eid').val();
    var fecha_fin = $('#fin_coord').val();
    var fecha_ini = $('#ini_coord').val();
    var coord_id  = $("#ecoordinadores").val();
    swal({
        title: "Cambio de coordinador",
        text: "¿Desea cambiar el coordinador del empleado?",
        icon: "warning",
        buttons: true,
        dangerMode: true
    }).then((res) => {
        if (res == true){
            $.ajax({
                url: '/empleados/cambio_coord',
                type: 'POST',
                dataType: 'JSON',
                data:{
                    _token: CSRF_TOKEN,
                    id: id,
                    fecha_ini:fecha_ini,
                    fecha_fin: fecha_fin,
                    coord_id: coord_id,
                },
                beforeSend: function () {
                    $().loader("show");
                },
                complete: function () {
                    $().loader("hide");
                },
                success: function (data) {
                    if (data.ok == true){
                        $('#editar_coord').fadeOut();
                        $('#div_coord').fadeIn();
                        $('#spn_coord').empty();
                        $('#spn_coord').append(data.data.nombre);
                        $('#ecoordinadores').val(data.data.id);
                        swal("Se ha actualizado el coordinador exitosamente:", {
                            icon: "success",
                        });
                    }
                    else {
                        swal(data.data, {
                            icon: "error",
                        });
                    }
                }
            });
        }
    });
    e.preventDefault();
});

$('#show_edit_sueldo').on('click', function (e) {
    $('#div_sueldo').fadeIn();
    $('#esueldo_imss').removeAttr('disabled');
    $('#esueldo_asimilado').removeAttr('disabled');
    $(this).fadeOut();
    e.preventDefault();
});

$('#cancel_sueldo').on('click', function (e) {
    $('#div_sueldo').fadeOut();
    $('#show_edit_sueldo').fadeIn();
    $('#esueldo_imss').prop('disabled', true);
    $('#esueldo_asimilado').prop('disabled', true);
    e.preventDefault();
});

$('#save_sueldo').on('click', function (e) {
    var array = ['imss_bruto','asimilado_bruto'];
    var validador = existe('sueldo_form', array);
    if (validador == false)
        return false;
    var id               = $('#eid').val();
    var fecha_fin        = $('#fin_sueldo').val();
    var fecha_ini        = $('#ini_sueldo').val();
    var imss_bruto       = $('#imss_bruto').val();
    var asimilado_bruto  = $('#asimilado_bruto').val();
    var sueldo_imss      = $('#esueldo_imss').val();
    var sueldo_asimilado = $('#esueldo_asimilado').val();
    swal({
        title: "Cambio de sueldo",
        text: "¿Desea cambiar el sueldo del empleado?",
        icon: "warning",
        buttons: true,
        dangerMode: true
    }).then((res) => {
        if (res == true){
            $.ajax({
                url: '/empleados/cambio_sueldo',
                type: 'POST',
                dataType: 'JSON',
                data:{
                    _token: CSRF_TOKEN,
                    id: id,
                    fecha_ini:fecha_ini,
                    fecha_fin: fecha_fin,
                    imss_bruto: imss_bruto,
                    asimilado_bruto: asimilado_bruto,
                    sueldo_imss: sueldo_imss,
                    sueldo_asimilado: sueldo_asimilado,
                },
                beforeSend: function () {
                    $().loader("show");
                },
                complete: function () {
                    $().loader("hide");
                },
                success: function (data) {
                    if (data.ok == true){
                        $('#div_sueldo').fadeOut();
                        $('#show_edit_sueldo').fadeIn();
                        $('#esueldo_imss').val(data.data.sueldo_imss);
                        $('#esueldo_asimilado').val(data.data.sueldo_asimilado);
                        $('#esueldo_imss').prop('disabled', true);
                        $('#esueldo_asimilado').prop('disabled', true);
                        $('#fin_sueldo').val("");
                        $('#ini_sueldo').val("");
                        $('#imss_bruto').val("");
                        $('#asimilado_bruto').val("");
                        swal("Se ha actualizado el sueldo exitosamente:", {
                            icon: "success",
                        });
                    }
                    else {
                        swal(data.data, {
                            icon: "error",
                        });
                    }
                }
            });
        }
    });
    e.preventDefault();
});


$('#myModalbaja').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});
var idtablaempleados = "";
$('#empleados-table tbody').on('click', '.DarBajaEmpleado', function () {
    document.getElementById("empleado_fecha_baja").value = fecha();
    data = table.row($(this).parent()).data();
    $.ajax({
        url: '/exist_baja',
        type: "GET",
        dataType: 'JSON',
        data: {
            id: data.id
        },
        success:function (response) {
            if(response.ok == true){
                if ((response.data).length >0)
                    swal({title:"Ya existe un proceso de baja para este empleado",icon: "warning"});
                else {
                    idtablaempleados = data['id'];
                    idtablaempleados = data['id'];
                    $('#myModalbaja').modal('show');
                }
            }
        }
    });
});

function fecha() {
    var fecha = new Date();
    var date = fecha.getFullYear() + '-' + (fecha.getMonth() + 1) + '-' + fecha.getDate() + ' ' + fecha.getHours() + ':' + fecha.getMinutes() + ':' + fecha.getSeconds();
    return date;
}

function postBajaEmpleado() {
    var vobo = $('#vobo');
    var incidencias = $('#incidencias1');
    var observaciones = $('#observaciones');
    var empleado_fecha_baja = $('#empleado_fecha_baja');
    var file = vobo[0].files[0];
    if (file == null || file == undefined){
        swal("Atención", "El V.o B.o es obligatorio", "error");
        return false;
    }
    if (incidencias.val() == "" || observaciones.val() == "" || empleado_fecha_baja.val() == "") {
        incidencias.css('border-color','red');
        observaciones.css('border-color','red');
        empleado_fecha_baja.css('border-color','red');
        swal("Atención", "Todos los datos son obligatorios", "error");
        return false;
    } else {
        incidencias.css('border','1px solid #ced4da');
        observaciones.css('border','1px solid #ced4da');
        empleado_fecha_baja.css('border','1px solid #ced4da');
        var check = 0;
        if ($('#recurso_check').is(':checked'))
            check = 1;
        var DataInsert = new FormData();
        DataInsert.append('_token', CSRF_TOKEN);
        DataInsert.append('empleado_fecha_baja', $('#empleado_fecha_baja').val());
        DataInsert.append('incidencia', $('#incidencias1').val());
        DataInsert.append('obs', $('#observaciones').val());
        DataInsert.append('motivo',  $('#motivo').val());
        DataInsert.append('conbaja', check);
        DataInsert.append('solicitante', $('#IdUser').val());
        DataInsert.append('vobo', file);
        DataInsert.append('fechaEmi', fecha());
        DataInsert.append('id', idtablaempleados);
        $.ajax({
            url: '/empleados/baja_empleado',
            data: DataInsert,
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            beforeSend: function () {
                $().loader("show");
            },
            complete: function () {
                $().loader("hide");
            },
            success: function(data){
                if (data.ok == true){
                    swal("La solicitud se a generado exitosamente:", {
                        icon: "success",
                    }).then((value) => {
                        location.href='/bajas';
                    });
                }
                else {
                    swal("Ocurrio un error", {
                        icon: "error",
                    })
                }
            }
        });
    }
}

function validaFormEditar() {
    var Datos = {};
    var $inputs = $('#editar_emp :input');
    $inputs.each(function (index) {
        Datos[$(this).attr('id')] = $(this).val();
    });
    var array = ['enss','erfc','ecurp','mov_suel_id','elocalidad','eesquema_viaticos','eesquema','esueldo_imss','esueldo_asimilado','etelefono','email','cerrar','eno_interior','etelefono2','cerrar','eobservaciones','emonex','fin_coord','ini_coord',
                 'asimilado_bruto','imss_bruto','fin_sueldo','ini_sueldo'];
    var validador = existe('editar_emp', array);
    if (validador == false)
        return false;
    Datos._token = CSRF_TOKEN;
    swal({
        title: "Editar empleado",
        text: "¿Desea editar al empleado?",
        icon: "warning",
        buttons: true,
        dangerMode: true
    }).then((res) => {
        if (res == true){
            $.ajax({
                url: '/empleados/update_empleado',
                type: "POST",
                dataType: 'JSON',
                data: Datos,
                success: function (response) {
                    if (response.ok == true){
                        swal("Empleado actualizado con éxito", {
                            icon: "success",
                        }).then((value) => {
                        });
                        $('#myModal').modal('toggle');
                        table.ajax.reload();
                    }
                    else {
                        swal("Ocurrio un error al actualizar el empleado", {
                            icon: "error",
                        }).then((value) => {
                        });
                        $('#myModal').modal('toggle');
                        table.ajax.reload();
                    }
                }
            });
            table.ajax.reload();
        }
    });
}

function guardarEmpleado() {
    var omitir    = ['cerrar','monex','no_interior','rtelefono2','robservaciones'];
    var validador = existe('ReingresoDiv', omitir);
    var dataRes      = {
        _token:             CSRF_TOKEN,
        name:               $("#rnombre").val(),
        apaterno:           $("#rapaterno").val(),
        amaterno:           $("#ramaterno").val(),
        calle:              $("#rcalle").val(),
        num_ext:            $("#rno_exterior").val(),
        num_int:            $("#no_interior").val(),
        colonia:            $("#rcolonia").val(),
        municipio:          $("#rmunicipio").val(),
        cp:                 $("#rcp").val(),
        estado:             $("#estado").val(),
        nss:                $("#rnss").val(),
        rfc:                $("#rrfc").val(),
        curp:               $("#rcurp").val(),
        email:              $("#rmail").val(),
        telefono1:          $("#telefono").val(),
        telefono2:          $("#rtelefono2").val(),
        cliente:            $("#cliente").val(),
        servicio:           $("#servicio").val(),
        region:             $("#region").val(),
        tecnologia:         $("#tecnologia").val(),
        grupo:              $("#grupo").val(),
        fecha_ingreso:      $("#fecha_ingreso").val(),
        num_empleado:       $("#empleado").val(),
        empresa:            $("#empresa").val(),
        localidad:          $("#localidad").val(),
        segmento:           $("#segmento").val(),
        coordinador:        $("#coordinadores").val(),
        ind_alcatel:        $("#ind_val").val(),
        proveedor:          $("#proveedor").val(),
        razon_social:       $("#razon_rh").val(),
        puesto:             $("#puesto").val(),
        area:               $("#rarea").val(),
        sueldo_imss:        $("#sueldo_imss").val(),
        sueldo_variable:    $("#sueldo_asimilado").val(),
        esquema:            $("#esquema").val(),
        esquema_viaticos:   $("#esquema_viaticos").val(),
        num_monex:          $("#monex").val(),
        num_cuenta:         $("#rnum_cuenta").val(),
        clabe:              $("#rclabe").val(),
        banco:              $("#rbanco").val(),
        observaciones:      $("#robservaciones").val(),
        enviar:             $("#guardar").val(),
        id_solicitud:       0
    };

    if (validador.length == 0) {
        swal({
            title: "Alta de empleado",
            text: "¿Desea Guardar un empleado nuevo?",
            icon: "warning",
            buttons: true,
            dangerMode: true
        })
            .then((res) => {
                if (res) {
                    $.ajax({
                        url: '/empleados/create_sin_sol',
                        type: "POST",
                        dataType: 'JSON',
                        data: dataRes,
                        success: function (response) {
                            if (response.ok == true){
                                swal("Empleado se ha creado con éxito", {
                                    icon: "success",
                                }).then((value) => {
                                })
                            }
                            $('#mdialTamanio').modal('toggle');
                            table.ajax.reload();
                        }
                    });
                }
            });

    }
    else {
        swal("Llenar los campos son requeridos", {
            icon: "error",
        })
    }
}

function ExcelEmpleados() {

    if ($("#FInicio").val() == '' || $("#FFIn").val() == '') {
        swal("Selecione las fechas de inicio y fin del reporte.", {
            icon: "error",
        })
    } else {
        fechas = {
            inicio: $("#FInicio").val(),
            fin: $("#FFIn").val()

        };
        swal({
            title: "Descargar Empleados",
            text: "¿Desea descargar los datos de empleados?",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
                if (willDelete) {
                    location.href = "/excel/export_empleados/" + fechas.inicio + "/" + fechas.fin;
                }
            });
    }
}

var data;
$('#empleados-table tbody').on('click', '.info', function () {
    data = table.row($(this).parent()).data();
    $('#info-body').empty();
});

$('#Modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var tipo   = button.data('tipo');
    var modal  = $(this);
    var cuerpo = modal.find('.modal-body');
    var pie    = modal.find('.modal-footer');
    $("#nombre").val(data['Nombre']);

    if (tipo == 'Informacion') {
        modal.find('.modal-title').text("Información");
        var tabla = $('<table>').addClass('table table-bordered table-usr');

        for (var k in data) {
            var ocultas = [
                'descarga','empleado_update','bloqueo_viaticos','motivo_bloqueo','contratista',
                'tipo_contrato','updated_at','created_at','id_solicitud','opc_computadora','opc_auto','opc_celular',
                'opc_herramientas','diario_nomina','viable','razon','nomina','movimiento_proyecto_id','tipo_proyecto',
                'tipo_contrato','movimiento_coordinador_id','coordinador_id','movimiento_sueldo_id','movimiento_recurso_id',
                'movimiento_puesto_id','id_puesto'
            ];
            var sueldo = [
                'sueldo_imss','sueldo_alternativo','sueldo_asimilado','sueldo_imss_bruto','sueldo_alternativo_bruto',
                'sueldo_mensual_neto','sueldo_neto',
            ];
            if (ver_sueldo == 0){
                if (sueldo.indexOf(k) != -1)
                    continue;
            }
            if (ocultas.indexOf(k) != -1)
                continue;
            var tr           = document.createElement("tr");
            var nombre       = document.createElement("td");
            var dato         = document.createElement("td");
            var str = k.toUpperCase();
            var title = str.replace("_"," ");
            nombre.innerHTML = title;
            dato.innerHTML   = data[k];
            tr.append(nombre);
            tr.append(dato);
            tabla.append(tr);
        }
        cuerpo.append(tabla);
    }
});
/*
$("#search_nombre" ).autocomplete({
    source: "/incidencias/get_empleados",
    minLength: 2,
    select: function(event, ui) {
        $('#search_nombre').val(ui.item.value);
    }
});
*/

function refreshTable() {
    table.ajax.reload();
}

if(edit_emple != 1)
    table.columns( '.editar_v' ).visible( false );
if(baja_emple != 1)
    table.columns( '.baja_v' ).visible( false );
if(ver_sueldo != 1)
    table.columns( '.sueldo_v' ).visible( false );

var search_id     = $('#search_id');
var num_emp       = $('#num_emp');
var search_nombre = $('#search_nombre');
var search_coord  = $('#search_coord');
var search_pd     = $('#search_pd');

search_id.on('keyup',function () {
    s_id = $(this).val();
    table.draw();
});
num_emp.on('keyup',function () {
    n_emp = $(this).val();
    table.draw();
});
search_nombre.on('keyup change',function () {
    s_nombre = $(this).val();
    table.draw();
});
search_coord.on('keyup',function () {
    s_coord = $(this).val();
    table.draw();
});
search_pd.on('keyup',function () {
    s_pd = $(this).val();
    table.draw();
});

$('#search').on('click', function (e) {
    table.draw();
    e.preventDefault();
});

$('#reset').on('click', function (e) {
    reset      = 1;
    auth       = 0;
    no_auth    = 0;
    rh_auth    = 0;
    rh_no_auth = 0;
    s_id       = null;
    n_emp      = null;
    s_nombre   = null;
    s_coord    = null;
    s_pd       = null;
    search_id.val('');
    num_emp.val('');
    search_nombre.val('');
    search_coord.val('');
    search_pd.val('');
    table.draw();
    e.preventDefault();
    reset = 0;
});

$( function() {
    $( "#empleado_fecha_baja" ).datepicker({
        showOn: "both",
        dateFormat: "yy-mm-dd",
        minDate: 0,
        buttonText: "<i class='fa fa-calendar'></i>"
    }).next(".ui-datepicker-trigger").addClass("btn btn-sm btn-primary").prop('id','btn_cita');
} );

$('#empleados-table tbody').on('click', '.viable', function () {
    data = table.row($(this).parent()).data();
    var vi = parseInt(data.viable);
    switch (vi) {
        case 0:
            $('#lbl_vi_no').addClass('active');
            $('#lbl_vi_si').removeClass('active');
            $('#lbl_vi_res').removeClass('active');
            $('#lbl_vi_na').removeClass('active');
            break;
        case 1:
            $('#lbl_vi_si').addClass('active');
            $('#lbl_vi_no').removeClass('active');
            $('#lbl_vi_res').removeClass('active');
            $('#lbl_vi_na').removeClass('active');
            break;
        case 2:
            $('#lbl_vi_res').addClass('active');
            $('#lbl_vi_si').removeClass('active');
            $('#lbl_vi_no').removeClass('active');
            $('#lbl_vi_na').removeClass('active');
            break;
        default:
            $('#lbl_vi_na').addClass('active');
            $('#lbl_vi_si').removeClass('active');
            $('#lbl_vi_no').removeClass('active');
            $('#lbl_vi_res').removeClass('active');
            break;
    }
    $('#id_empleado_via').val(data.id);
    $('#obs_via').val(data.motivo);
    $('#viable').modal('show');
});

function saveViable() {
    var value = $('input[name=options]:checked').val();
    var id    = $('#id_empleado_via').val();
    var obs   = $('#obs_via').val();
    $.ajax({
        url:'/empleados/viable',
        type: 'POST',
        dataType: 'JSON',
        data:{
            _token: CSRF_TOKEN,
            id:id,
            viable: value,
            obs: obs
        },
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (data) {
            if (data.ok == true){
                Swal.fire({
                    title: "Recurso Actualizado Correctamente",
                    text: "",
                    type: "success"
                });
            }
            else {
                Swal.fire({
                    title: "Ocurrio un error",
                    text: data.data,
                    type: "error"
                });
            }
            $('#viable').modal('toggle');
            table.ajax.reload();
        }
    });
}
