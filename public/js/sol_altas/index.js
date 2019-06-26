var CSRF_TOKEN = $('#token').val();
var auth       = 0;
var no_auth    = 0;
var rh_auth    = 0;
var rh_no_auth = 0;
var reset      = 0;
var s_id       = $('#search_id').val();
var s_nombre   = null;
var s_wbs      = null;
var s_coord    = null;
var table      = $('#altas-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    ajax: {
        url: '/datatables/get_data_altas',
        type: 'GET',
        data: function (data) {
            data.auth          = auth,
            data.no_auth       = no_auth,
            data.rh_auth       = rh_auth,
            data.rh_no_auth    = rh_no_auth,
            data.search_id     = s_id,
            data.search_nombre = s_nombre,
            data.search_wbs    = s_wbs,
            data.search_coord  = s_coord,
            data.reset         = reset
        },
        beforeSend: function () {
        },
        complete: function () {
        },
    },
    order: [[0, "desc"]],
    columns: [
        {data: 'id', name: 'id',className:'id text-center'},
        {name: 'i', orderable: false, searchable: false},
        {name: 'e', orderable: false, searchable: false, className:'editar_v text-center'},
        {name: 'b', orderable: false, searchable: false},
        {data: 'WBS',                           name: 'WBS', className:'width-auto'},
        {data: 'Nombre',                        name: 'Nombre', className:'width-auto'},
        {data: 'fecha solicitud',               name: 'fecha solicitud', className:'width-auto'},
        {data: 'fecha creacion de solicitud',   name: 'fecha creacion de solicitud', className:'width-auto'},
        {data: 'coordinador',                   name: 'coordinador', className:'width-auto'},
        {valores: {data: 'Auth entregables', data: 'Auth direccion', data: 'Auth RH'}, name: 'Auth entregables', orderable: false, searchable: false, className:'dire_v text-center'},
        {data: 'cita',                          name: 'cita', orderable: false, searchable: false, className:'cita_v text-center'},
        {data: 'Computadora',                   name: 'computadora', className:'computadora_v auths text-center', orderable: false, searchable: false,},
        {data: 'Celular',                       name: 'Celular', className:'celular_v auths text-center', orderable: false, searchable: false,},
        {data: 'Coche',                         name: 'Coche', className:'coche_v auths text-center', orderable: false, searchable: false,},
        {data: 'Herramientas',                  name: 'Herramientas', className:'herramientas_v auths text-center', orderable: false, searchable: false,},
        {data: 'Contrato firmado',              name: 'Contrato firmado', className:'cont_f_v auths text-center', orderable: false, searchable: false},
        {data: 'pm',                            name: 'pm', className:'width-auto'},
        {data: 'imss',                          name: 'imss', className:'width-auto'},
        {data: 'variable',                      name: 'variable', className:'width-auto'},
        {data: 'costo',                         name: 'costo', className:'width-auto'},
        {data: 'venta',                         name: 'venta', className:'width-auto'},
        {data: 'margen',                        name: 'margen', className:'width-auto'},
        {data: 'alta',                          name: 'alta'},
        {data: 'Solicitante',                   name: 'Solicitante'}
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
            "targets": 1, // your case first column
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Informacion' class='info btn btn-xs btn-success iconInfo' data-toggle='modal' data-target='#Modal'><i class='fa fa-info nav-icon nav-icon'></i></button>",
        },
        {
            "targets": 2, // your case first column
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Editar' class='Editar btn btn-xs btn-primary iconEdit'><i class=' fa fa-pencil-square-o nav-icon nav-icon'></i></button>",
            "render": function (data, type, row) {
                if (edit == 1) {
                    if (row.status_cita == "EMPLEADO CREADO" || data['Auth direccion'] != 'x'){
                        return '';
                    }
                    else {
                        return "<button data-tipo='Editar' class='Editar btn btn-xs btn-primary iconEdit'><i class=' fa fa-pencil-square-o nav-icon nav-icon'></i></button>";
                    }
                }
                else return '';
            },
        },
        {
            "targets": 3, // your case first column
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Bitacora' class='bitacora btn btn-xs btn-danger iconBitacora'><i class=' fa fa-book nav-icon nav-icon'></i></button>",
        },
        {
            "targets": 9, // your case first column
            "data": null,
            "className": "text-center",
            "render": function (data, type, row) {
                if (row.id_rechazo != null)
                    return '<i class="fas fa-close" style="color:red;font-size:20px"></i>';
                if (auth_sol == 1) {
                    switch (data['Auth direccion']) {
                        case "x"  :
                            return "<button data-tipo='Autorizar' class='Autorizar btn btn-xs btn-success iconAutorizar'><i class='fa fa-thumbs-up nav-icon nav-icon nav-icon'></i></button>";
                            break;
                        default :
                            return '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                    }
                }
                else {
                    if (data['cita'] != null)
                        return '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                    else
                        return '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
            }
        },
        {
            "targets": 10, // your case first column
            "data": null,
            "className": "text-center",
            "render": function (data, type, row) {
                if (row.status_cita == "EMPLEADO CREADO"){
                    return '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                }
                if (row.status_cita == "PENDIENTE" && data == "cita"){
                    return '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                }
                else {
                    if (cita == 1) {
                        switch (data) {
                            case "cita":
                                return "<button data-tipo='CitaFirma' class='cita info btn btn-xs btn-success iconCheckAuths' data-toggle='modal' data-target='#CitaFirma'><i class='fas fa-calendar nav-icon nav-icon nav-icon'></i></button>";
                                break;
                            case "ok":
                                return '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                                break;
                            default :
                                return '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                        }
                    } else {
                        return '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                    }
                }
            }
        },
        {
            "targets": 11,
            "data": null,
            "className": "text-center",
            "render" : function (data, type, row) {
                var view = '';
                if (data == 'ASIGNADA') {
                    view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                }
                else{
                    if (data == 'SOLICITADO'){
                        if (auth_computadora == 1 && row['Auth RH'] != 'x' && row['Auth direccion'] != 'x') {
                            view = "<button  data-tipo='AutorizarHerraCompu' class='AutorizarHerraCompu btn btn-xs btn-success iconAutorizar'><i class='fa fa-thumbs-up nav-icon nav-icon nav-icon'></i></button>";
                        }
                        else
                            view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                    }
                    else
                        view = '<i class="fa fa-minus-circle" style="color:#007bff;font-size:20px"></i>';
                }
                return view;
            }
        },
        {
            "targets": 12,
            "data": null,
            "className": "text-center",
            "render" : function (data, type, row) {
                var view = '';
                if (data == 'ASIGNADA') {
                    view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                }
                else {
                    if (data == 'SOLICITADO'){
                        if (auth_celular == 1 && row['Auth RH'] != 'x' && row['Auth direccion'] != 'x') {
                            view = "<button  data-tipo='AutorizarHerraCel' class='AutorizarHerraCel btn btn-xs btn-success iconAutorizar'><i class='fa fa-thumbs-up nav-icon nav-icon nav-icon'></i></button>";
                        }
                        else
                            view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                    }
                    else
                        view = '<i class="fa fa-minus-circle" style="color:#007bff;font-size:20px"></i>';
                }
                return view;
            }
        },
        {
            "targets": 13,
            "data": null,
            "className": "text-center",
            "render" : function (data, type, row) {
                var view = '';
                if (data == 'ASIGNADA') {
                    view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                }
                else {
                    if (data == 'SOLICITADO'){
                        if (auth_coche == 1 && row['Auth RH'] != 'x' && row['Auth direccion'] != 'x') {
                            view = "<button  data-tipo='AutorizarHerraCoche' class='AutorizarHerraCoche btn btn-xs btn-success iconAutorizar'><i class='fa fa-thumbs-up nav-icon nav-icon nav-icon'></i></button>";
                        }
                        else
                            view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                    }
                    else
                        view = '<i class="fa fa-minus-circle" style="color:#007bff;font-size:20px"></i>';
                }
                return view;
            }
        },
        {
            "targets": 14,
            "data": null,
            "className": "text-center",
            "render" : function (data, type, row) {
                var view = '';
                if (data == 'ASIGNADA') {
                    view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                }
                else {
                    if (data == 'SOLICITADO'){
                        if( auth_herramientas == 1 && row['Auth RH'] != 'x' && row['Auth direccion'] != 'x') {
                            view = "<button  data-tipo='AutorizarHerraHerra' class='AutorizarHerraHerra btn btn-xs btn-success iconAutorizar'><i class='fa fa-thumbs-up nav-icon nav-icon nav-icon'></i></button>";
                        }
                        else
                            view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                    }
                    else
                        view = '<i class="fa fa-minus-circle" style="color:#007bff;font-size:20px"></i>';
                }
                return view;
            }
        },
        {
            "targets": 15,
            "data": null,
            "className": "text-center",
            "render" : function (data, type, row) {
                var view = '';
                if (data == 'OK') {
                    view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                }
                else {
                    if (cont_firm == 1 && row['Auth RH'] != 'x' && row['Auth direccion'] != 'x')
                        view = "<button  data-tipo='ContFirm' class='ContFirm btn btn-xs btn-success iconAutorizar'><i class='fa fa-thumbs-up nav-icon nav-icon nav-icon'></i></button>";
                    else
                        view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
                return view;
            }
        }
    ],
    drawCallback: function (settings) {
        $('#altas-table').resize();
    },
    initComplete: function () {
        $('#altas-table').resize();
    }
});

var data_table;
var iduatCoche;
$('#altas-table tbody').on('click', '.AutorizarHerraCompu', function () {
    data       = table.row($(this).parent()).data();
    data_table = data;
    iduatCoche = data['id'];
    $('#AutorizarcionComputadora').modal('show');
});

$('#altas-table tbody').on('click', '.AutorizarHerraCoche', function () {
    data       = table.row($(this).parent()).data();
    data_table = data;
    iduatCoche = data['id'];
    $('#AutorizarcionAuto').modal('show');
});

$('#altas-table tbody').on('click', '.AutorizarHerraCel', function () {
    data       = table.row($(this).parent()).data();
    data_table = data;
    iduatCoche = data['id'];
    $('#Autorizarcioncelular').modal('show');
});

$('#altas-table tbody').on('click', '.AutorizarHerraHerra', function () {
    data       = table.row($(this).parent()).data();
    data_table = data;
    iduatCoche = data['id'];
    $('#AutorizarcionAlmacen').modal('show');
});

$('#altas-table tbody').on('click', '.cita', function () {
    data       = table.row($(this).parent()).data();
    $('#fecha_cita').val(data['fecha solicitud']);
    data_table = data;
    iduatCoche = data['id'];
});

var celular_check     = false;
var computadora_check = false;
var software_check    = false;
var correo_check      = false;
var bam_check         = false;
var auto_check        = false;
var botas_check       = false;
var playera_check     = false;

$('#CitaFirma').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});

$('#CitaFirma').on('show.bs.modal', function (event) {
    $.ajax({
        url: '/empleados/get_herramientas_empleado/',
        type: 'GET',
        dataType: 'JSON',
        data: {
            id: data_table.id
        },
        success: function (data) {
            if (data.ok == true){
                var herra = data.data;
                if (herra.botas == 1){
                    $('#div_botas').show();
                    $('#val_botas').val(1);
                }
                else
                    $('#div_botas').hide();
                if (herra.playera == 1){
                    $('#div_playera').show();
                    $('#val_playera').val(1);
                }
                else
                    $('#div_playera').hide();
            }
            else
                Swal.fire({
                    title: 'Error',
                    text: 'Ocurrio un error al obtener las herramientas',
                    type: 'error'
                }).then((ok) => {
                    $('#AutorizarcionComputadora').modal('toggle');
                });
        }
    });
});

$('#AutorizarcionComputadora').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});

$('#AutorizarcionComputadora').on('show.bs.modal', function (event) {
    var recurso_label         = $('#name_recurso');
    var solicitud_label       = $('#num_solicitud');
    $('#res_computadora').empty();
    $('#desc_computadora1').empty();
    $('#res_software').empty();
    $('#desc_software1').empty();
    recurso_label.empty();
    solicitud_label.empty();
    recurso_label.append(data_table.Nombre);
    solicitud_label.append(data_table.id);
    $.ajax({
        url: '/empleados/get_herramientas_empleado/',
        type: 'GET',
        dataType: 'JSON',
        data: {
            id: data_table.id
        },
        success: function (data) {
            if (data.ok == true){
                var herra = data.data;
                if (herra.computadora == 1){
                    $('#res_computadora').append('SI');
                    if (herra.desc_computadora == null || herra.desc_computadora == "")
                        $('#desc_computadora1').append('No especificada.');
                    else
                        $('#desc_computadora1').append(herra.desc_computadora);
                }
                else{
                    $('#res_computadora').append('NO');
                }
                if (herra.software == 1) {
                    $('#res_software').append("SI");
                    if (herra.desc_software == null || herra.desc_software == '')
                        $('#desc_software1').append("No especificado.");
                    else
                        $('#desc_software1').append(herra.desc_software);
                } else
                    $('#res_software').append("NO");
            }
            else
                Swal.fire({
                    title: 'Error',
                    text: 'Ocurrio un error al obtener las herramientas',
                    type: 'error'
                }).then((ok) => {
                    $('#AutorizarcionComputadora').modal('toggle');
                });
        }
    });
});

$('#AutorizarcionAlmacen').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});
$('#AutorizarcionAlmacen').on('show.bs.modal', function (event) {
    $('#name_recurso_almacen').empty();
    $('#num_solicitud_a').empty();
    $('#resp_botas').empty();
    $('#resp_playera').empty();
    $('#name_recurso_almacen').append(data_table.Nombre);
    $('#num_solicitud_a').append(data_table.id);
    $.ajax({
        url: '/empleados/get_herramientas_empleado/',
        type: 'GET',
        dataType: 'JSON',
        data: {
            id: data_table.id
        },
        success: function (data) {
            if (data.ok == true){
                var herra = data.data;
                if (herra.botas == 1)
                    $('#resp_botas').append("SI");
                else
                    $('#resp_botas').append("NO");
                if (herra.playera == 1)
                    $('#resp_playera').append("SI");
                else
                    $('#resp_playera').append("NO");
            }
            else
                Swal.fire({
                    title: 'Error',
                    text: 'Ocurrio un error al obtener las herramientas',
                    type: 'error'
                }).then((ok) => {
                    $('#AutorizarcionAlmacen').modal('toggle');
                });
        }
    });
});

$('#AutorizarcionAuto').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});
$('#AutorizarcionAuto').on('show.bs.modal', function (event) {
    $('#name_recurso_auto').empty();
    $('#num_solicitud_c').empty();
    $('#resp_auto').empty();
    $('#name_recurso_auto').append(data_table.Nombre);
    $('#num_solicitud_c').append(data_table.id);
    $.ajax({
        url: '/empleados/get_herramientas_empleado/',
        type: 'GET',
        dataType: 'JSON',
        data: {
            id: data_table.id
        },
        success: function (data) {
            if (data.ok == true){
                var herra = data.data;
                if (herra.auto == 1)
                    $('#resp_auto').append("SI");
                else
                    $('#resp_auto').append("NO");
            }
            else
                Swal.fire({
                    title: 'Error',
                    text: 'Ocurrio un error al obtener las herramientas',
                    type: 'error'
                }).then((ok) => {
                    $('#AutorizarcionAuto').modal('toggle');
                });
        }
    });
});

$('#Autorizarcioncelular').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});
$('#Autorizarcioncelular').on('show.bs.modal', function (event) {
    $('#name_recurso_t').empty();
    $('#num_solicitud_t').empty();
    $('#resp_celular').empty();
    $('#resp_plan').empty();
    $('#resp_bam').empty();
    $('#name_recurso_t').append(data_table.Nombre);
    $('#num_solicitud_t').append(data_table.id);
    $.ajax({
        url: '/empleados/get_herramientas_empleado/',
        type: 'GET',
        dataType: 'JSON',
        data: {
            id: data_table.id
        },
        success: function (data) {
            if (data.ok == true){
                var herra = data.data;
                if (herra.celular == 1)
                    $('#resp_celular').append(" SI");
                else
                    $('#resp_celular').append(" NO");
                if (herra.plan_linea != null)
                    $('#resp_plan').append(" SI - "+herra.linea_nombre);
                else
                    $('#resp_plan').append(" NO");
                if (herra.bam != null && herra.bam != 0)
                    $('#resp_bam').append(" SI - "+herra.bam_nombre);
                else
                    $('#resp_bam').append(" NO");
            }
            else
                Swal.fire({
                    title: 'Error',
                    text: 'Ocurrio un error al obtener las herramientas',
                    type: 'error'
                }).then((ok) => {
                    $('#Autorizarcioncelular').modal('toggle');
                });
        }
    });
});

function saveCheckComputo() {
    var correo          = $("#correo_ind").val();
    var obs_computadora = $("#observaciones_computadora").val();
    var validador       = existe('form_compu',['observaciones_computadora']);
    if (validador == false)
        return false;
    datosRe = {
        _token:                     CSRF_TOKEN,
        id_solicitud:               data_table.id,
        id_checkauth:               'computadora',
        valorCheck:                 'OK',
        correo_nae:                 correo,
        observaciones_computadora:  obs_computadora
    };
    $.ajax({
        url: "/altas/autorizar_solicitud",
        type:'POST',
        dataType:'JSON',
        data:datosRe,
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (data) {
            if (data.ok == true)
                swal("Computadora Auth con éxito", {
                    icon: "success",
                }).then((value) => {
                    $('#AutorizarcionComputadora').modal('toggle');
                    table.ajax.reload();
                });
            else {
                swal("Error!", "Ocurrio un error al actualizar la solicitud!", "error").then((value) => {
                    location.href = '/altas';
                });
            }
        }
    });
}

function saveCheckAlmacen(){
    var obs_almacenamiento = $("#observaciones_almacenamiento").val();
    datosRe = {
        _token:                       CSRF_TOKEN,
        id_solicitud:                 data_table.id,
        id_checkauth:                 'herramientas',
        valorCheck:                   'OK',
        observaciones_almacenamiento: obs_almacenamiento
    };
    $.ajax({
        url: "/altas/autorizar_solicitud",
        type:'POST',
        dataType:'JSON',
        data:datosRe,
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (data) {
            if (data.ok == true)
                swal("Almacen Auth con éxito", {
                    icon: "success",
                }).then((value) => {
                    $('#AutorizarcionAlmacen').modal('toggle');
                    table.ajax.reload();
                });
            else {
                swal("Error!", "Ocurrio un error al actualizar la solicitud!", "error").then((value) => {
                    location.href = '/altas';
                });
            }
        }
    });
}

function saveCheckCelular() {
    var obs_varios = $("#observaciones_varios").val();
    datosRe = {
        _token:               CSRF_TOKEN,
        id_solicitud:         data_table.id,
        id_checkauth:         'celular',
        valorCheck:           'OK',
        observaciones_varios: obs_varios
    };
    $.ajax({
        url: "/altas/autorizar_solicitud",
        type:'POST',
        dataType:'JSON',
        data:datosRe,
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (data) {
            if (data.ok == true)
                swal("Celular Auth con éxito", {
                    icon: "success",
                }).then((value) => {
                    $('#Autorizarcioncelular').modal('toggle');
                    table.ajax.reload();
                });
            else {
                swal("Error!", "Ocurrio un error al actualizar la solicitud!", "error").then((value) => {
                    location.href = '/altas';
                });
            }
        }
    });
}

function saveCheckCoche() {
    var obs_auto = $("#observaciones_auto").val();
    datosRe = {
        _token:               CSRF_TOKEN,
        id_solicitud:         data_table.id,
        id_checkauth:         'coche',
        valorCheck:           'OK',
        observaciones_varios: obs_auto
    };
    $.ajax({
        url: "/altas/autorizar_solicitud",
        type:'POST',
        dataType:'JSON',
        data:datosRe,
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (data) {
            if (data.ok == true)
                swal("Auto Auth con éxito", {
                    icon: "success",
                }).then((value) => {
                    $('#AutorizarcionAuto').modal('toggle');
                    table.ajax.reload();
                });
            else {
                swal("Error!", "Ocurrio un error al actualizar la solicitud!", "error").then((value) => {
                    location.href = '/altas';
                });
            }
        }
    });
}


function sendCheck1(id_solicitante, id_solicitud, id_checkauth, valorCheck, data_opcional, callBack) {

    if (valorCheck != undefined) {
        var val_check_text = "";
        var textSuccess    = "";

        if (valorCheck == true) {
            val_check_text = "OK";
            textSuccess    = "autorizada";
        } else {
            val_check_text = "X";
            textSuccess    = "deshautorzida";
        }
        var datosRe = {
            _token:         CSRF_TOKEN,
            id_solicitante: id_solicitante,
            id_solicitud:   id_solicitud,
            id_checkauth:   id_checkauth,
            valorCheck:     val_check_text
        };
        if (id_checkauth == 'computadora') {
            datosRe = {
                _token:                     CSRF_TOKEN,
                id_solicitante:             id_solicitante,
                id_solicitud:               id_solicitud,
                id_checkauth:               id_checkauth,
                valorCheck:                 val_check_text,
                correo_nae:                 data_opcional.correo_nae,
                observaciones_computadora:  data_opcional.observaciones_computadora
            };
        }
        if (id_checkauth == 'coche') {
            datosRe = {
                _token:               CSRF_TOKEN,
                id_solicitante:       id_solicitante,
                id_solicitud:         id_solicitud,
                id_checkauth:         id_checkauth,
                valorCheck:           val_check_text,
                observaciones_varios: data_opcional.observaciones_varios
            };
        }

        if (id_checkauth == 'celular') {
            datosRe = {
                _token:               CSRF_TOKEN,
                id_solicitante:       id_solicitante,
                id_solicitud:         id_solicitud,
                id_checkauth:         id_checkauth,
                valorCheck:           val_check_text,
                observaciones_varios: data_opcional.observaciones_varios
            };
        }

        if (id_checkauth == 'herramientas') {
            datosRe = {
                _token:                       CSRF_TOKEN,
                id_solicitante:               id_solicitante,
                id_solicitud:                 id_solicitud,
                id_checkauth:                 id_checkauth,
                valorCheck:                   val_check_text,
                observaciones_almacenamiento: data_opcional.observaciones_almacenamiento
            };
        }
        $.ajax({
            url: "/altas/autorizar_solicitud",
            type:'POST',
            dataType:'JSON',
            data:datosRe,
            beforeSend: function () {
                $().loader("show");
            },
            complete: function () {
                $().loader("hide");
            },
            success: function (data) {
                if (data.ok == true)
                    return callBack();
                else {
                    swal("Error!", "Ocurrio un error al actualizar la solicitud!", "error").then((value) => {
                        location.href = '/altas';
                    });
                }
            }
        });
    }
}


$('#AutorizarcionAuto').on('hidden.bs.modal', function (event) {
});

function ExcelSolicitudes() {
    location.href = "/export-altas";
}

var DatasTable = table.row($(this).parent()).data();

var data;
$('#altas-table tbody').on('click', '.btn', function () {
    data = table.row($(this).parent()).data();
});

$('#altas-table tbody').on('click', '.bitacora', function () {
    data = table.row($(this).parent()).data();
    MostrarBitacora(data);
});


$('#altas-table tbody').on('click', '.info', function () {
    data = table.row($(this).parent()).data();
});

$('#altas-table tbody').on('click', '.Autorizar', function () {
    data           = table.row($(this).parent()).data();
    id_solicitante = document.getElementById("#index_user");
    swal({
        title: "¿ Deseas autorizar la solicitud ?",
        text: "",
        icon: "warning",
        buttons: true,
        dangerMode: true
    })
        .then((willDelete) => {
            if (willDelete) {
                var datosRe = {
                    _token: CSRF_TOKEN,
                    id_solicitante: $("#index_user").val(),
                    id_solicitud: data["id"],
                    id_checkauth: "x"
                };
                $.ajax({
                    url:'/altas/autorizar_solicitud',
                    type:'POST',
                    dataType:'JSON',
                    data:datosRe,
                    beforeSend: function () {
                        $().loader("show");
                    },
                    complete: function () {
                        $().loader("hide");
                    },
                    success: function (data) {
                        if (data.ok == true){
                            swal("Solicitud autorizada con éxito", {
                                icon: "success",
                            });
                        }
                        else {
                            swal("Error!", "Ocurrio un error al actualizar la solicitud!", "error");
                        }
                        table.ajax.reload();
                    }
                });
            }
        });
});

$('#altas-table tbody').on('click', '.Editar', function () {
    data          = table.row($(this).parent()).data();
    location.href = "/altas/update_solicitud/" + data["id"];
});

function MostrarBitacora(data) {
    var html    = '<div class="card-body"><table class="table table-active" style="font-size:12px;width:100%;" id="BITACORAS"><thead><tr><th>CLAVE</th><th>USUARIO</th><th>DETALLES</th><th>FECHA</th><th>HORA</th><th>AUTORIZACION</th></tr></thead></table></div>';
    $('#datosss').append(html);
    $('#ModalBitacoras').modal('show');
    var button  = $(event.relatedTarget);
    var tipo    = button.data('tipo');
    var modal   = $('#ModalBitacoras');
    var cuerpo  = modal.find('.modal-body');
    var pie     = modal.find('.modal-footer');
    modal.find('.modal-title').text(tipo);

    var tabla   = $('#BITACORAS');
    var id_alta = data.id;
    tabla.DataTable({
        processing: true,
        serverSide: true,
        responsive: true,
        ajax: {
            url: '/autorizar/get_bitacora_incidentes',
            type: 'GET',
            data: function (data) {
                data.id = id_alta;
                data.tipo = "solicitud_alta"
            }
        },
        columns: [
            {data: 'CLAVE',     name: 'CLAVE'},
            {data: 'USUARIO',   name: 'USUARIO'},
            {data: 'DETALLES',  name: 'DETALLES'},
            {data: 'FECHA',     name: 'FECHA'},
            {data: 'HORA',      name: 'HORA'},
            {data: 'ESTADO',    name: 'ESTADO'},
        ]
    });
    cuerpo.append(tabla);
}

function DestruirMOdal() {
    var modal  = $('#ModalBitacoras');
    var cuerpo = modal.find('.modal-body');
    cuerpo.children().remove();
    $('#ModalBitacoras').modal('hide');
}


$('#Modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var tipo   = button.data('tipo');
    var modal  = $(this);
    var cuerpo = modal.find('.modal-body');
    var pie    = modal.find('.modal-footer');
    $("#nombre").val(data['Nombre']);

    if (tipo == 'Informacion') {
        modal.find('.modal-title').text("Información");
        var tabla = $('<table>').addClass('table table-bordered');

        for (var k in data) {
            var ocultas = [
                'id_puesto','lugar_trabajo','id_rechazo','computadora_check','celular_check','coche_check','herramientas_check',
                'cita','id_solicitante','status_cita','coordinador_id','descargado','alta','Contrato firmado'
            ];
            if (ocultas.indexOf(k) != -1)
                continue;
            var tr           = document.createElement("tr");
            var nombre       = document.createElement("td");
            var dato         = document.createElement("td");
            nombre.innerHTML = k;
            switch (k) {
                case 'cotizacion_url':
                    var value = data[k];
                    if (value != null){
                        dato.innerHTML   = '<a href="/files/'+value+'" title="Descargar"><i class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>';
                    }
                    else
                        dato.innerHTML = '';
                    break;
                case 'caso_negocio_url':
                    var value = data[k];
                    if (value != null){
                        dato.innerHTML   = '<a href="/files/'+value+'" title="Descargar"><i class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>';
                    }
                    else
                        dato.innerHTML = '';
                    break;
                case 'vobo_url':
                    var value = data[k];
                    if (value != null){
                        dato.innerHTML   = '<a href="/files/'+value+'" title="Descargar"><i class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>';
                    }
                    else
                        dato.innerHTML = '';
                    break;
                case 'curriculum_url':
                    var value = data[k];
                    if (value != null){
                        dato.innerHTML   = '<a href="/files/'+value+'" title="Descargar"><i class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>';
                    }
                    else
                        dato.innerHTML = '';
                    break;
                default:
                    dato.innerHTML   = data[k];
                    break;
            }
            tr.append(nombre);
            tr.append(dato);
            tabla.append(tr);
        }
        cuerpo.append(tabla);
    }
});


$('#ModalBitacoras').on('hidden.bs.modal', function (event) {
    DestruirMOdal();
});


$('#Modal').on('hidden.bs.modal', function (event) {
    var modal  = $(this);
    var cuerpo = modal.find('.modal-body');
    var pie    = modal.find('.modal-footer');
    cuerpo.children().remove();
    pie.children('.btn2').remove();
});

$('#modalEditSolicitud').on('show.bs.modal', function (event) {
    var id_solicitud   = data['id'];
    var wbs_completo   = data['WBS'];
    var wbs_div        = document.getElementById('wbs_completa');
    wbs_div.innerHTML += wbs_completo;

    $('#wbs_completa').val(wbs_completo);
    $.post("/api/getSolicitud/" + id_solicitud,
        {},
        function (data) {
            var o = JSON.parse(data);
            $('#id').val(o.id);
            $('#nombre').val(o.nombre);
            $('#apaterno').val(o.apaterno);
            $('#amaterno').val(o.amaterno);
            $('#fecha_inicio').val(o.fecha_inicio);
            $('#actividad').val(o.actividad);
            $('#cliente').val(o.cliente);
            $('#coordinador_id').val(o.coordinador_id);
            $('#costo').val(o.costo);
            $('#desc_computadora').val(o.desc_computadora);
            $('#desc_software').val(o.desc_software);
            $('#direccion').val(o.direccion);
            $('#esquema').val(o.esquema);
            $('#grupo').val(o.grupo);
            $('#lugar_trabajo').val(o.lugar_trabajo);
            $('#motivo').val(o.motivo);
            $('#pm').val(o.pm);
            $('#puesto').val(o.puesto);
            $('#region').val(o.region);
            $('#riesgo').val(o.riesgo);
            $('#servicio').val(o.servicio);
            $('#sueldo_imss').val(o.sueldo_imss);
            $('#sueldo_variable').val(o.sueldo_variable);
            $('#sueldo_venta').val(o.sueldo_venta);
            $('#talla_botas').val(o.talla_botas);
            $('#talla_playera').val(o.talla_playera);
            $('#tecnologia').val(o.tecnologia);
            $('#tipo_correo').val(o.tipo_correo);
            $('#tipo_proyecto').val(o.tipo_proyecto);
            $('#updated_at').val(o.updated_at);
            $('#venta').val(o.venta);
            $('#vobo_url').val(o.vobo_url);
            $('#coordinador_id').val(o.coordinador_id);
            $('#codigo_bam').val(o.codigo_bam);

            if (o.celular == 1) {
                $('#celular').prop('checked', true).change();
                $('#celular').is(':checked');
            } else {
                $('#celular').prop('checked', false).change();
            }

            if (o.computadora == 1) {
                $('#computadora').prop('checked', true).change();
                $('#computadora').is(':checked');
            } else {
                $('#computadora').prop('checked', false).change();
            }

            if (o.software == 1) {
                $('#software').prop('checked', true).change();
                $('#software').is(':checked');
            } else {
                $('#software').prop('checked', false).change();
            }

            if (o.tipo_correo != null && o.tipo_correo != undefined) {
                $('#correo').prop('checked', true).change();
                $('#correo').is(':checked');
                $('#tipo_correo').val(1)
            } else {
                $('#correo').prop('checked', false).change();
            }

            if (o.auto == 1) {
                $('#auto').prop('checked', true).change();
                $('#auto').is(':checked');
            } else {
                $('#auto').prop('checked', false).change();
            }

            if (o.botas == 1) {
                $('#botas').prop('checked', true).change();
                $('#botas').is(':checked');
            } else {
                $('#botas').prop('checked', false).change();
            }

            if (o.playera == 1) {
                $('#playera').prop('checked', true).change();
                $('#playera').is(':checked');
            } else {
                $('#playera').prop('checked', false).change();
            }

            if (o.bam == 1) {
                $('#bam').prop('checked', true).change();
                $('#bam').is(':checked');
            } else {
                $('#bam').prop('checked', false).change();
            }
        }
    )
});


$('#modalEditSolicitud').on('hidden.bs.modal', function (event) {
    var modal         = $(this);
    var cuerpo        = modal.find('.modal-body');
    var pie           = modal.find('.modal-footer');
    var wbs_div       = document.getElementById('wbs_completa')
    wbs_div.innerHTML = "";
    pie.children('.btn2').remove();

    $('#id').empty();
    $('#nombre').empty();
    $('#apaterno').empty();
    $('#amaterno').empty();
    $('#fecha_inicio').empty();
    $('#actividad').empty();
    $('#cliente').empty();
    $('#coordinador_id').empty();
    $('#costo').empty();
    $('#desc_computadora').empty();
    $('#desc_software').empty();
    $('#direccion').empty();
    $('#esquema').empty();
    $('#grupo').empty();
    $('#lugar_trabajo').empty();
    $('#motivo').empty();
    $('#pm').empty();
    $('#puesto').empty();
    $('#region').empty();
    $('#riesgo').empty();
    $('#servicio').empty();
    $('#sueldo_imss').empty();
    $('#sueldo_variable').empty();
    $('#sueldo_venta').empty();
    $('#talla_botas').empty();
    $('#talla_playera').empty();
    $('#tecnologia').empty();
    $('#tipo_correo').empty();
    $('#tipo_proyecto').empty();
    $('#updated_at').empty();
    $('#venta').empty();
    $('#vobo_url').empty();
    $('#coordinador_id').empty();
    $('#codigo_bam').empty();
});
new $.fn.dataTable.FixedHeader(table);

function editarSolicitud(id) {
    $('#modalEditSolicitud').modal('show');
    $('#titulomodal').text("Editar solicitud");
    $("#id").val(id);
    $.post("/api/getSolicitud/" + id,
        {},
        function (data) {
            var o      = JSON.parse(data);
            var select = document.getElementById('nombre');
            $("#nombre").empty();
            for (value in o.nombre) {
                var option   = document.createElement("option");
                option.text  = o.nombre[value];
                option.value = value;
            }
            $('#id').val(o.id);
            $('#nombre').val(o.nombre);
            $('#apaterno').val(o.apaterno);
            $('#amaterno').val(o.amaterno);
            $('#fecha_inicio').val(o.fecha_inicio)
        }
    )
}

var auto         = false;
var computadora  = false;
var alta         = false;
var herramientas = false;
var solicitante  = false;
var contrato     = false;
$('#AutorizarcionesChecks').on('show.bs.modal', function (event) {
    if (data["Coche"] == 'ok' || data["Coche"] == 'OK') {
        $('#carro_check').bootstrapToggle('on');
        auto = true;
    } else {
        $('#carro_check').bootstrapToggle('off');
        auto = false;
    }

    if (data["Herramientas almacen"] == 'ok' || data["Herramientas almacen"] == 'OK') {
        $('#herramientas_check').bootstrapToggle('on');
        herramientas = true;
    } else {
        $('#herramientas_check').bootstrapToggle('off');
        herramientas = false;
    }

    if (data["Solicitante"] == 'ok' || data["Solicitante"] == 'OK') {
        $('#solicitante_check').bootstrapToggle('on');
        solicitante = true;
    } else {
        $('#solicitante_check').bootstrapToggle('off');
        solicitante = false;
    }

    if (data["computadora"] == 'ok' || data["computadora"] == 'OK') {
        $('#computadora_check').bootstrapToggle('on');
        computadora = true;
    } else {
        $('#computadora_check').bootstrapToggle('off');
        computadora = false;
    }

    if (data["alta"] == 'ok' || data["alta"] == 'OK') {
        $('#alta_check').bootstrapToggle('on');
        alta = true;
    } else {
        $('#alta_check').bootstrapToggle('off');
        alta = false;
    }

    if (data["Contrato firmado"] == 'ok' || data["Contrato firmado"] == 'OK') {
        $('#contrato_check').bootstrapToggle('on');
        contrato = true;
    } else {
        $('#contrato_check').bootstrapToggle('off');
        contrato = false;
    }
});

function saveChecks() {
    sendCheck($("#index_user").val(), data["id"], 'computadora', computadora, function () {
        sendCheck($("#index_user").val(), data["id"], 'alta', alta, function () {
            sendCheck($("#index_user").val(), data["id"], 'coche', auto, function () {
                sendCheck($("#index_user").val(), data["id"], 'herramientas', herramientas, function () {
                    sendCheck($("#index_user").val(), data["id"], 'solicitante', solicitante, function () {
                        sendCheck($("#index_user").val(), data["id"], 'contrato', contrato, function () {
                            swal("Autorizaciones actualizadas con éxito", {
                                icon: "success",
                            }).then((value) => {
                                location.href = "/altas"
                            });
                            setTimeout(function () {
                                location.href = "/altas"
                            }, 3000);
                        });
                    });
                });
            });
        });
    });
}

$('#computadora_check').change(function () {
    computadora = $(this).prop('checked')
});
$('#alta_check').change(function () {
    alta = $(this).prop('checked')
});
$('#carro_check').change(function () {
    auto = $(this).prop('checked')
});
$('#herramientas_check').change(function () {
    herramientas = $(this).prop('checked')
});
$('#solicitante_check').change(function () {
    solicitante = $(this).prop('checked')
});
$('#contrato_check').change(function () {
    contrato = $(this).prop('checked')
});

function sendCheck(id_solicitante, id_solicitud, id_checkauth, valorCheck, callBack) {
    if (valorCheck != undefined) {
        var val_check_text = "";
        var textSuccess    = "";

        if (valorCheck == true) {
            val_check_text = "OK";
            textSuccess    = "autorizada";
        } else {
            val_check_text = "X";
            textSuccess    = "deshautorzida";
        }
        var datosRe = {
            id_solicitante: id_solicitante,
            id_solicitud:   id_solicitud,
            id_checkauth:   id_checkauth,
            valorCheck:     val_check_text
        };
        $.post("/api/autorizarCheckSolicitud", datosRe, function (data) {
            return callBack();
        });
    }
}


function darBajaCliente(id) {
    swal({
        title: "¿ Deseas eliminar la solicitud ?",
        text: "La solicitud sera movida a la lista de bajas RH.",
        icon: "warning",
        buttons: true,
        dangerMode: true
    })
        .then((willDelete) => {
            if (willDelete) {
                $.post("/api/darBajaCliente/" + id,
                    {},
                    function (data) {
                        swal("Solicitud eliminada con éxito", {
                            icon: "success",
                        }).then((value) => {
                            table.ajax.reload();
                        });
                        var datanotificacion = {
                            asunto: "Notificacion solicitud de baja",
                            puesto: $("#Area").val(),
                            recurso: "s/n",
                            mensaje: "Se ha cancelado una solicitud por:  " + $("#NombreUsuario").val() + "  " +
                                     "<a href='" + location.origin + "/bajas'>  Clic aqui para ver mas detalles</a>",
                            name: $("#NombreUsuario").val(),
                            cc: "SolBaja",
                            para: $("#CorreoUser").val(),
                            de: $("#CorreoUser").val(),
                            usuario: $("#NombreUsuario").val(),
                        };
                        EnviarCorreos(datanotificacion, "/bajas");
                    }
                )
            } else {
                return false;
            }
        });
}

function validarteFormEditar() {
    var id           = $("#id").val();
    var nombre       = $("#nombre").val();
    var apaterno     = $("#apaterno").val();
    var amaterno     = $("#amaterno").val();
    var fecha_inicio = $("#fecha_inicio").val();

    var data = {
        nombre: "",
        apaterno: "",
        amaterno: "",
        fecha_inicio: "",
        id: 4
    };
    if (id != undefined && id != '') {
        data.id = id;
    } else {
        alert("El id no puede ser vacio.");
        return false;
    }

    if (nombre != undefined && nombre != '') {
        data.nombre = nombre;
    } else {
        alert("El nombre no puede ser vacio.");
        return false;
    }

    if (apaterno != undefined && apaterno != '') {
        data.apaterno = apaterno;
    } else {
        alert("El apellido no puede ser vacio.");
        return false;
    }

    if (amaterno != undefined && amaterno != null) {
        data.amaterno = amaterno;
    } else {
        alert("apellido invalido.");
        return false;
    }
    if (fecha_inicio != undefined && fecha_inicio != null) {
        data.fecha_inicio = fecha_inicio
    } else {
        alert("fecha invalida.");
        return false;
    }


    $.post("/api/updateSolicitud/" + data.id, {
            id: data.id,
            nombre: data.nombre,
            apaterno: data.apaterno,
            amaterno: data.amaterno,
            fecha_inicio: data.fecha_inicio
        },
        function (data) {
            swal("Solicitud actualizada con éxito", {
                icon: "success",
            }).then((value) => {

                var datanotificacion = {
                    asunto: "Notificacion solicitud de baja",
                    puesto: $("#Area").val(),
                    recurso: "s/n",
                    mensaje: "Se ha cancelado una solicitud por:  " + $("#NombreUsuario").val() + "  " +
                             "<a href='" + location.origin + "/altas'>  Clic aqui para ver mas detalles</a>",
                    name: $("#NombreUsuario").val(),
                    cc: "SolBaja",
                    // datos necesarios para el elvio de correo
                    para: $("#CorreoUser").val(),
                    de: $("#CorreoUser").val(),
                    usuario: $("#NombreUsuario").val(),
                };
                EnviarCorreos(datanotificacion, "/altas");
            });
        }
    )
}


$('#altas-table tbody').on('click', '.ContFirm', function () {
    data = table.row($(this).parent()).data();
    swal({
        title: "Contrato Firmado",
        text: "Confirmar que se firmo el contrato",
        icon: "warning",
        buttons: true
    }).then((willDelete) => {
        if (willDelete) {
            var datosRe = {
                _token: CSRF_TOKEN,
                id_solicitud: data.id,
                id_checkauth: "firmado"
            };
            $.ajax({
                url:'/altas/autorizar_solicitud',
                type:'POST',
                dataType:'JSON',
                data:datosRe,
                beforeSend: function () {
                    $().loader("show");
                },
                complete: function () {
                    $().loader("hide");
                },
                success: function (data) {
                    if (data.ok == true){
                        swal("Solicitud autorizada con éxito", {
                            icon: "success",
                        });
                    }
                    else {
                        swal("Error!", "Ocurrio un error al actualizar la solicitud!", "error");
                    }
                    table.ajax.reload();
                }
            });
        }
    });
});


function caracteresCorreo(email) {
    var caract = new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/);
    if (caract.test(email) == false) {
        return false;
    } else {
        return true;
    }
}


function saveCitaFirma() {
    var array = ['btn_cita'];
    if ($('#val_botas').val() == 0)
        array.push('botas1');
    if ($('#val_playera').val() == 0)
        array.push('playera1');
    var validador      = existe('cita_div',array);

    if (validador == false)
        return false;

    var id_solicitud   = data['id'];
    var fecha_cita     = $("#fecha_cita").val();
    var hora_cita      = $("#hora_cita").val();
    var detalles_cita  = $("#detalles_cita").val();
    var correo_cita    = $("#correo_cita").val();
    var id_solicitante = $("#index_user").val();

    if (caracteresCorreo(correo_cita) == false) {
        swal({
            title: "Mensaje",
            type: "error",
            text: "El correo no es valido",
        });
        return false
    }

    var dataRes = {
        _token:         CSRF_TOKEN,
        fecha_cita:     fecha_cita,
        hora_cita:      hora_cita,
        detalles_cita:  detalles_cita,
        id_solicitud:   id_solicitud,
        id_solicitante: id_solicitante,
        correo_cita:    correo_cita,
        estatus:        'ok'
    };

    if ($('#val_botas').val() == 1)
        dataRes.num_botas = $("#botas1").val();
    if ($('#val_playera').val() == 1)
        dataRes.num_playera = $('#playera1').val();

    $.ajax({
        url:'/altas/agendar_cita_firma',
        type: 'POST',
        dataType: 'JSON',
        data: dataRes,
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (data) {
            if (data.ok == true){
                swal("Cita guardada con éxito", {
                    icon: "success",
                }).then((value) => {
                });
            }
            $('#CitaFirma').modal('toggle');
            table.ajax.reload();
        }
    });
}

$('#botas1').on('change keyup', function () {
    var botas = $(this);
    if (botas.val() < 0)
        botas.val(0);
});

$('#playera1').on('change keyup', function () {
    var playera = $(this);
    if (playera.val() < 0)
        playera.val(0);
});

function ExcelAltas() {
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
            title: "Descargar Solicitudes de alta",
            text: "¿Desea descargar los datos de las solicitudes?",
            icon: "warning",
            buttons: true,
            dangerMode: true
        })
            .then((willDelete) => {
                if (willDelete) {
                    location.href = "/excel/export_altas/" + fechas.inicio + "/" + fechas.fin;
                }
            });
    }
}

var autorizados      = $('#auth');
var sin_autorizar    = $('#no_auth');
var rh_autorizados   = $('#rh_auth');
var rh_sin_autorizar = $('#rh_no_auth');
var search_id        = $('#search_id');
var search_nombre    = $('#search_nombre');
var search_wbs       = $('#search_wbs');
var search_coord     = $('#search_coord');

search_id.on('keyup',function () {
    s_id = $(this).val();
    table.draw();
});

search_nombre.on('keyup',function () {
    s_nombre = $(this).val();
    table.draw();
});

search_wbs.on('keyup',function () {
    s_wbs = $(this).val();
    table.draw();
});

search_coord.on('keyup',function () {
    s_coord = $(this).val();
    table.draw();
});

autorizados.on('click', function (e) {
    auth = 1;
    no_auth = 0;
    table.draw();
    e.preventDefault();
    autorizados.prop('disabled',true);
    sin_autorizar.prop('disabled',false);
});

sin_autorizar.on('click', function (e) {
    no_auth = 1;
    auth = 0;
    table.draw();
    e.preventDefault();
    autorizados.prop('disabled',false);
    sin_autorizar.prop('disabled',true);
});

rh_autorizados.on('click', function (e) {
    rh_auth    = 1;
    rh_no_auth = 0;
    table.draw();
    e.preventDefault();
    rh_autorizados.prop('disabled',true);
    rh_sin_autorizar.prop('disabled',false);
});

rh_sin_autorizar.on('click', function (e) {
    rh_no_auth = 1;
    rh_auth    = 0;
    table.draw();
    e.preventDefault();
    rh_autorizados.prop('disabled',false);
    rh_sin_autorizar.prop('disabled',true);
});

$('#reset').on('click', function (e) {
    if (id_post != 0)
        window.location = '/altas';
    reset      = 1;
    auth       = 0;
    no_auth    = 0;
    rh_auth    = 0;
    rh_no_auth = 0;
    s_id       = null;
    s_nombre   = null;
    s_wbs      = null;
    s_coord    = null;
    table.draw();
    e.preventDefault();
    reset = 0;
    autorizados.prop('disabled',false);
    sin_autorizar.prop('disabled',false);
    rh_autorizados.prop('disabled',false);
    rh_sin_autorizar.prop('disabled',false);
    search_id.val("");
    search_nombre.val("");
    search_wbs.val("");
    search_coord.val("");
});

if (cita != 1 && ver_checks == 1)
    table.columns( '.cita_v' ).visible( false );
if (auth_computadora != 1 && ver_checks == 1)
    table.columns( '.computadora_v' ).visible( false );
if (auth_celular != 1 && ver_checks == 1)
    table.columns( '.celular_v' ).visible( false );
if (auth_coche != 1 && ver_checks == 1)
    table.columns( '.coche_v' ).visible( false );
if (auth_herramientas != 1 && ver_checks == 1)
    table.columns( '.herramientas_v' ).visible( false );
if (cont_firm != 1 && ver_checks == 1)
    table.columns( '.cont_f_v' ).visible( false );
if (edit != 1)
    table.columns( '.editar_v' ).visible( false );

$( function() {
    $( "#fecha_cita" ).datepicker({
        showOn: "button",
        dateFormat: "yy-mm-dd",
        minDate: 0,
        buttonText: "<i class='fa fa-calendar'></i>"
    }).next(".ui-datepicker-trigger").addClass("btn btn-sm btn-primary").prop('id','btn_cita');
} );