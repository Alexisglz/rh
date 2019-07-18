var tabla;
var CSRF_TOKEN = $('#token').val();
var s_id       = $('#search_id').val();
var s_rec      = null;
var s_wbs      = null;
var s_est      = null;
var reset      = 0;
var table      = $('#darbaja-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    ajax: {
        url:'/datatables/get_bajas_nom',
        type: 'GET',
        data: function (data) {
            data.id    = s_id;
            data.rec   = s_rec;
            data.wbs   = s_wbs;
            data.est   = s_est;
            data.reset = reset;
        }
    },
    order: [[0, "desc"]],
    columns: [
        {data: 'id',name: 'id', className: 'id'},
        {data: 'baja_definitiva',orderable: false, searchable: false, className: "cancel_v text-center"},
        {data: null, name:'info',orderable: false, searchable: false, className: "text-center info"},
        {data: 'baja_definitiva',name: 'baja_definitiva',orderable: false, searchable: false, className: "baja_v text-center"},
        {data: 'Recurso',name: 'Recurso', className:'text-center common'},
        {data: 'WBS',name: 'WBS', className:'text-center common'},
        {data: 'fecha_cita',name: 'fecha_cita', orderable: false, searchable: false, className: "cita_v text-center common"},
        {data: 'baja_computo',name: 'baja_computo',orderable: false, searchable: false, className: "comp_v text-center common"},//6
        {data: 'baja_celular',name: 'baja_celular',orderable: false, searchable: false, className: "cel_v text-center common"},
        {data: 'baja_auto',name: 'baja_auto',orderable: false, searchable: false, className: "auto_v text-center common"},
        {data: 'baja_almacen',name: 'baja_almacen',orderable: false, searchable: false, className: " alma_v text-center common"},
        {data: 'baja_credencial',name: 'baja_credencial',orderable: false, searchable: false, className: "cred_v text-center common"},
        {data: 'pago_finiquito',name: 'pago_finiquito',orderable: false, searchable: false, className: "fini_v text-center common"},
        {data: null, name: 'adeudos',orderable: false, searchable: false, className:'text-center common'},
        {data: 'baja_definitiva',name: 'baja_definitiva', className:'text-center common'},
        {data: 'coordinador',name: 'coordinador', className:'text-center common'},
        {data: 'coordinador nokia',name: 'coordinador nokia', className:'text-center common'},
        {data: 'solicitante',name: 'solicitante', className:'text-center common'},
        {data: 'fecha_emision',name: 'fecha_emision', className:'text-center common'},
        {data: 'fecha_baja_sol',name: 'fecha_baja_sol', className:'text-center common'},
        {data: 'fecha_baja_nom',name: 'fecha_baja_nom', className:'text-center common'},
        {data: 'tiempo_retraso_her',name: 'tiempo_retraso_her', className:'text-center common'},
        {data: 'vobo',name: 'vobo', className:'text-center common'}
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
            "render": function (data, type, row) {
                if (cancel_baja == 1) {
                    switch (data) {
                        case "PENDIENTE"  :
                            return "<button data-tipo='cancel' class='cancel btn btn-xs btn-success iconInfo'><i class='fas fa-ban'></i></button>";
                            break;
                        default :
                            return '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                    }
                } else {
                    return '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
            }
        },
        {
            "targets": 2,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Informacion'class='info btn btn-xs btn-success iconInfo'><i class='fa fa-info nav-icon nav-icon'></i></button>",

        },
        {
            "targets": 3,
            "data": null,
            "render": function (data, type, row) {
                if (baja_def == 1) {
                    switch (data) {
                        case "PENDIENTE"  :
                            var adeudos = 0;
                            if (row.baja_computo == 'NO')
                                adeudos += 1;
                            if (row.baja_celular == 'NO')
                                adeudos += 1;
                            if (row.baja_auto == 'NO')
                                adeudos += 1;
                            if (row.baja_almacen == 'NO')
                                adeudos += 1;
                            if (row.baja_credencial == 'NO')
                                adeudos += 1;
                            if (adeudos == 0)
                                return "<button data-tipo='BtnBaja'class='BtnBaja btn btn-xs btn-success iconInfo'><i class='fas fa-user-minus'></i></button>";
                            else
                                return '<i class="fa fa-ban" style="color:red;font-size:20px"></i>';
                            break;
                        default :
                            return '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                    }
                } else {
                    return '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
            }
        },
        {
            "targets": 6,
            "data": null,
            "render": function (data, type, row) {
                var view = '';
                if (data != null){
                    view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i><br>'+data;
                    view += '<br><a class="btn btn-outline-primary text-primary btn-sm comment_n" data-comment="Cita"><i class="fa fa-comment"></i></a>';
                }
                else {
                    if (cita_baja == 1){
                        view = "<button data-tipo='Autorizar' class='Cita btn btn-xs btn-warning iconAutorizarOrange'><i class='fa fa-wrench nav-icon nav-icon nav-icon'></i></button>";
                    }
                    else
                        view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
                return view;
            }
        },
        {
            "targets": 7,
            "data": null,
            "render": function (data, type, row) {
                var view = '';
                if (data == 'OK'){
                    if(row.adeudo_accesorios == 'SI' || row.adeudo_compu == 'SI') {
                        view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                        view += '<br><a class="btn btn-outline-primary text-primary btn-sm comment_n" data-comment="Computo"><i class="fa fa-comment"></i></a>';
                    }
                    else
                        view = '<i class="fa fa-check-circle" style="color:#007bff;font-size:20px"></i>';
                }
                else {
                    if (baja_compu == 1){
                        if (row.fecha_cita != null)
                            if(row.adeudo_accesorios == 'SI' || row.adeudo_compu == 'SI')
                                view = "<button data-tipo='Autorizar' class='Compu btn btn-xs btn-success iconAutorizar'><i class='fa fa-wrench nav-icon nav-icon nav-icon'></i></button>";
                            else
                                view = '<i class="fa fa-check-circle" style="color:#007bff;font-size:20px"></i>';
                        else
                            view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                    }
                    else
                        view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
                return view;
            }
        },
        {
            "targets": 8,
            "data": null,
            "render": function (data, type, row) {
                var view = '';
                if (data == 'OK'){
                    if(row.adeudo_celular == 'SI' || row.adeudo_lin == 'SI') {
                        view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                        view += '<br><a class="btn btn-outline-primary text-primary btn-sm comment_n" data-comment="Celular"><i class="fa fa-comment"></i></a>';
                    }                    else
                        view = '<i class="fa fa-check-circle" style="color:#007bff;font-size:20px"></i>';
                }
                else {
                    if(baja_cel == 1){
                        if (row.fecha_cita != null)
                            if(row.adeudo_celular == 'SI' || row.adeudo_lin == 'SI')
                                view = "<button data-tipo='Autorizar' class='Celu btn btn-xs btn-success iconAutorizar'><i class='fa fa-wrench nav-icon nav-icon nav-icon'></i></button>";
                            else
                                view = '<i class="fa fa-check-circle" style="color:#007bff;font-size:20px"></i>';
                        else
                            view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                    }
                    else
                        view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
                return view;
            }
        },
        {
            "targets": 9,
            "data": null,
            "render": function (data, type, row) {
                var view = '';
                if (data == 'OK'){
                    if(row.adeudo_auto == 'SI') {
                        view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                        view += '<br><a class="btn btn-outline-primary text-primary btn-sm comment_n" data-comment="Auto"><i class="fa fa-comment"></i></a>';
                    }
                    else
                        view = '<i class="fa fa-check-circle" style="color:#007bff;font-size:20px"></i>';
                }
                else {
                    if (baja_coche == 1){
                        if (row.fecha_cita != null)
                            if(row.adeudo_auto == 'SI')
                                view = "<button data-tipo='Autorizar' class='Auto btn btn-xs btn-success iconAutorizar'><i class='fa fa-wrench nav-icon nav-icon nav-icon'></i></button>";
                            else
                                view = '<i class="fa fa-check-circle" style="color:#007bff;font-size:20px"></i>';
                        else
                            view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                    }
                    else
                        view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
                return view;
            }
        },
        {
            "targets": 10,
            "data": null,
            "render": function (data, type, row) {
                var view = '';
                if (data == 'OK'){
                    if(row.adeudo_herra == 'SI' ) {
                        view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                        view += '<br><a class="btn btn-outline-primary text-primary btn-sm comment_n" data-comment="Almacen"><i class="fa fa-comment"></i></a>';
                    }
                    else
                        view = '<i class="fa fa-check-circle" style="color:#007bff;font-size:20px"></i>';
                }
                else {
                    if (baja_herra == 1){
                        if (row.fecha_cita != null)
                            if(row.adeudo_herra == 'SI' )
                                view = "<button data-tipo='Autorizar' class='Herra btn btn-xs btn-success iconAutorizar'><i class='fa fa-wrench nav-icon nav-icon nav-icon'></i></button>";
                            else
                                view = '<i class="fa fa-check-circle" style="color:#007bff;font-size:20px"></i>';
                        else
                            view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                    }
                    else
                        view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
                return view;
            }
        },
        {
            "targets": 11,
            "data": null,
            "render": function (data, type, row) {
                var view = '';
                if (data == 'OK'){
                    view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                    view += '<br><a class="btn btn-outline-primary text-primary btn-sm comment_n" data-comment="Credencial"><i class="fa fa-comment"></i></a>';
                }
                else {
                    if (baja_crede == 1 && (row.fecha_cita != null))
                        view = "<button data-tipo='Autorizar' class='Cred btn btn-xs btn-success iconAutorizar'><i class='fa fa-wrench nav-icon nav-icon nav-icon'></i></button>";
                    else
                        view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
                return view;
            }
        },
        {
            "targets": 12,
            "data": null,
            "render": function (data, type, row) {
                var view = '';
                if (data == 'OK'){
                    view = '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                }
                else {
                    if (baja_rh == 1 && (row.fecha_cita != null))
                        view = "<button data-tipo='Autorizar' class='Fini btn btn-xs btn-success iconAutorizar'><i class='fa fa-wrench nav-icon nav-icon nav-icon'></i></button>";
                    else
                        view = '<i class="fa fa-ban" style="color:orange;font-size:20px"></i>';
                }
                return view;
            }
        },
        {
            'targets': 13,
            'data':null,
            'render': function (data, type, row) {
                var view = '';
                if (row.deuda_compu > 0)
                    view += 'computo: $'+row.deuda_compu+'<br>';
                if (row.deuda_cel> 0)
                    view += 'celular: $'+row.deuda_cel+'<br>';
                if (row.deuda_auto > 0)
                    view += 'auto: $'+row.deuda_auto+'<br>';
                if (row.deuda_alma > 0)
                    view += 'almacen: $'+row.deuda_alma+'<br>';
                if (row.deuda_cred > 0)
                    view += 'credencial: $'+row.deuda_cred;
                return view;
            }
        },
        {
            'targets': 20,
            'data':null,
            'render': function (data, type, row) {
                var view = data == null ? '':data;
                view += '<a class="btn btn-outline-primary text-primary btn-sm cambio_nom ml-2" title="Cambiar la fecha de baja nomina"><i class="fa fa-refresh"></i></a>';
                return view;
            }
        },
        {
            'targets': 22,
            'data':null,
            'render': function (data, type, row) {
                var view = '';
                if (data != null)
                    view = '<a href="/files/'+data+'" title="Descargar"><i class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>';
                return view;
            }
        }
    ],

});

new $.fn.dataTable.FixedHeader(table);

tabla = table;

$('#darbaja-table tbody').on('click', '.cancel', function () {
    data = table.row($(this).parent()).data();
    var id = data['id'];
    EliminarSolicitud(id);
});


$('#darbaja-table tbody').on('click', '.info', function () {
    data = table.row($(this).parent()).data();
    MostrarInfo(data);

});


$('#darbaja-table tbody').on('click', '.Autorizar', function () {
    data = table.row($(this).parent()).data();
});

$('#myModzal').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});
var data = null;
var IdSolBaja;
$('#darbaja-table tbody').on('click', '.BtnBaja', function () {
    data      = tabla.row($(this).parent()).data();
    IdSolBaja = data['id'];
    $('#myModzal').modal('show');
    $('#titulomodal').text("Baja Definitiva");
});


function cancelarSolicitud(opciones, id_empleado) {
    var opc = "";
    if (opciones === 0) {
        OPC = "INFORMACION";
        var data;
        $('#darbaja-table tbody').on('click', '.btn', function () {
            data    = tabla.row($(this).parent()).data();
            opc     = "INFORMACION";
            var id  = data['id'];
        });
    } else if (opciones === 1) {
        $('#darbaja-table tbody').on('click', '.btn', function () {
            data = table.row($(this).parent()).data();
            opc  = "BITACORA";
            $('#ModalBitacora').on('show.bs.modal', function (event) {
                var modal  = $(this);
                var cuerpo = modal.find('.modal-body');
                var pie    = modal.find('.modal-footer');
                modal.find('.modal-title').text("BITACORA DE SOLICITUD DE BAJA");
                var tabla = $('#BITACORAS');
                var VariableConcat = data['id'] + '-' + "'solicitud_baja_nomina'";
                tabla.DataTable({
                    processing: true,
                    serverSide: true,
                    responsive: true,
                    ajax: '/getBitacoraBaja/' + VariableConcat,
                    columns: [{
                        data: 'CLAVE',
                        name: 'CLAVE'
                    }, {
                        data: 'USUARIO',
                        name: 'USUARIO'
                    }, {
                        data: 'EMPLEADO',
                        name: 'EMPLEADO'
                    }, {
                        data: 'DETALLES',
                        name: 'DETALLES'
                    }, {
                        data: 'FECHA',
                        name: 'FECHA'
                    }, {
                        data: 'HORA',
                        name: 'HORA'
                    }, {
                        data: 'ESTADO',
                        name: 'ESTADO'
                    },]
                });
                cuerpo.append(tabla);
            });
            $('#ModalBitacora').on('hidden.bs.modal', function (event) {
                window.location.reload();
            })


        });
    } else if (opciones === 2) {

    } else if (opciones === 3) {
        var DatosBaja = {
            _token:           CSRF_TOKEN,
            id_empleado:      id_empleado,
            fecha_emision:    $("#fechaemi").val(),
            fecha_baja_nom:   $("#fechabaj").val(),
            fecha_baja_sol:   $("#fechabajsol").val(),
            fecha_cita:       $("#fechacita").val(),
            computadora:      $  ("#computadora").prop('checked'),
            celular:          $("#celular").prop('checked'),
            almacen:          $("#almacen").prop('checked'),
            credencial:       $("#credencial").prop('checked'),
            auto:             $("#auto").prop('checked'),
            pago_finiquito:   $("#pago_finiquito").prop('checked'),
            Baja:             $("#Baja").prop('checked'),
            adeudos:          $("#adeudos").val(),
            retraso:          $("#retraso").val(),
            obs_herramientas: $("#herramientas_observacion").val(),
            id_comment:       $("#id_comment").val(),
            area:             $("#Area").val()
        };
        $.ajax({
            url: '/bajas/solicitud_baja',
            type: "POST",
            dataType: 'JSON',
            data: DatosBaja,
            success: function (response) {
                Swal(
                    'Hecho!!',
                    'Solicitud guardada con exito.',
                    'success'
                );
                $('#AutorizarcionesHerramientas').modal('toggle');
                table.ajax.reload();
            }
        });
    }
}

function EliminarSolicitud(id) {
    Swal({
        title: "¿ Deseas eliminar la Solicitud ?",
        text: "El empleado sera borrado de la solicitud de baja.",
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.value) {
            $.post("/bajas/eliminar_solicitud/" + id,{
                    _token: CSRF_TOKEN,
                },
                function (data) {
                    const toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 3000
                    });
                    toast({
                        type: 'success',
                        title: 'Solicitud eliminada con exito'
                    }).then((value) => {
                        location.href = "/bajas"
                    })


                }
            )
        }
    });
}

function MostrarInfo(data) {
    var tabla = $('<table>').addClass('table table-bordered');
    var array = [
        'antiguo','tiempo_retraso_her','adeudo_compu','adeudo_celular','adeudo_auto',
        'adeudo_bam','adeudo_software','adeudo_botas','adeudo_playera'
    ];
    for (var k in data) {
        if (array.indexOf(k) != -1)
            continue;
        var tr      = document.createElement("tr");
        var nombre  = document.createElement("th");
        var dato    = document.createElement("td");
        var str = k.toUpperCase();
        var title = str.replace("_"," ");
        nombre.innerHTML = title;
        if (title == "VOBO" && data[k] != null){
            dato.innerHTML = '<a href="/files/'+data[k]+'" title="Descargar"><i class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>';
        }
        else
            dato.innerHTML = data[k];
        tr.append(nombre);
        tr.append(dato);
        tabla.append(tr);
        Swal({
            title: 'Información ',
            html: tabla,
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'Aceptar'
        }).then((result) => {
            if (result.value) {
                tabla = null;
            }
        });
        $('#swal2-content').addClass('body-permisos');
    }
}


function guardarHerramientas() {
    var id_empleado = data['id'];
    cancelarSolicitud(3, id_empleado);
}

function funBajadefinitiva() {
    var DatosBajaDefinitiva = {
        _token: CSRF_TOKEN,
        id: IdSolBaja,
        fecha_baja_definitiva: $("#fehabaja").val(),
        observaciones: $("#observaciones").val()
    };

    $.ajax({
        url: '/bajas/baja_def_nom',
        type: 'POST',
        dataType: 'JSON',
        data: DatosBajaDefinitiva,
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success:function (data) {
            if (data.ok == true){
                swal("Empleado dado de baja", {
                    icon: "success",
                }).then((value) => {
                    $('#myModzal').modal('toggle');
                    table.ajax.reload();
                });
            }
            else {
                swal("Ocurrio un error", {
                    icon: "error",
                }).then((value) => {});
            }
        }
    });
}

$('#darbaja-table tbody').on('click', '.Autorizar', function () {
    data = table.row($(this).parent()).data();
    llenarHerramientas(data);
});

function llenarHerramientas(data) {
    var id                       = data.id;
    var fechaemi                 = $('#fechaemi');
    var fechabaj                 = $('#fechabaj');
    var fechabajsol              = $('#fechabajsol');
    var fechacita                = $('#fechacita');
    var computadora              = $('#computadora');
    var desc_computadora         = $('#desc_computadora');
    var codigo_computadora       = $('#codigo_computadora');
    var auto                     = $('#auto');
    var celular                  = $('#celular');
    var almacen                  = $('#almacen');
    var desc_almacen             = $('#desc_almacen');
    var codigo_almacen           = $('#codigo_almacen');
    var credencial               = $('#credencial');
    var pago_finiquito           = $('#pago_finiquito');
    var adeudos                  = $('#adeudos');
    var retraso                  = $('#retraso');
    var herramientas_observacion = $('#herramientas_observacion');
    var id_comment               = $('#id_comment');
    $.ajax({
        url: '/bajas/get_baja',
        type: "POST",
        dataType: 'JSON',
        data: {
            _token: CSRF_TOKEN,
            id: id
        },
        success: function (response) {
            fechaemi.val(formatDate(response.fecha_emision));
            fechabaj.val(formatDate(response.fecha_baja_nom));
            fechabajsol.val(formatDate(response.fecha_baja_sol));
            fechacita.val(formatDate(response.fecha_cita));
            if (response.area == 'Recursos Humanos'){
                adeudos.val(response.adeudos);
                retraso.val(response.tiempo_herra);
                herramientas_observacion.val(response.obs_herramientas);
            }
            else if(response.comments != 0) {
                adeudos.val(response.comments.adeudo);
                retraso.val(response.comments.retraso);
                herramientas_observacion.val(response.comments.observaciones);
            }
            id_comment.val(response.comments.id);
            if (response.baja_credencial == "true")
                credencial.bootstrapToggle('on');
            if (response.baja_almacen == "true")
                almacen.bootstrapToggle('on');
            if (response.baja_auto == "true")
                auto.bootstrapToggle('on');
            if (response.baja_celular == "true")
                celular.bootstrapToggle('on');
            if (response.baja_computo == "true")
                computadora.bootstrapToggle('on');
            if (response.pago_finiquito == "true")
                pago_finiquito.bootstrapToggle('on');
        }
    });
}

function formatDate(date) {
    if (date != null && date != ""){
        var now   = new Date(date);
        var day   = ("0" + now.getDate()).slice(-2);
        var month = ("0" + (now.getMonth() + 1)).slice(-2);
        var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
        return today;
    }
    else return "";
}


$('#modalCita').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});
$('#darbaja-table tbody').on('click', '.Cita', function () {
    data    = tabla.row($(this).parent()).data();
    var modal = $('#modalCita');
    $('#fecha_cita').val(data.fecha_baja_sol);
    $('#fecha_baja_nom').val(data.fecha_baja_sol);
    modal.modal('toggle');
});

function enviarCita() {
    var comment  = $('#obs_cita').val();
    var cita     = $('#fecha_cita');
    var baja_nom = $('#fecha_baja_nom');
    var hora     = $('#hora_cita');
    if (cita.val() == null || cita.val() == ""){
        cita.css('border-color','red');
        return false;
    }
    else
        cita.css('border','1px solid #ced4da');
    if (hora.val() == "" || hora.val() == null){
        hora.css('border-color','red');
        return false;
    }
    else
        hora.css('border','1px solid #ced4da');
    var fecha = cita.val() +' '+hora.val();
    $.ajax({
        url: '/bajas/save_cita',
        type: "POST",
        dataType: 'JSON',
        data: {
            _token: CSRF_TOKEN,
            id: data.id,
            obs: comment,
            cita: fecha,
            fecha_baja_nom: baja_nom.val()
        },
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (response) {
            if (response.ok == true){
                Swal.fire({
                    title:"Fecha registrada con éxito",
                    type: "success"
                });
                $('#modalCita').modal('toggle');
                table.ajax.reload();
            }
        }
    });
}

$( function() {
    $( "#fecha_cita" ).datepicker({
        showOn: "both",
        dateFormat: "yy-mm-dd",
        minDate: 0,
        buttonText: "<i class='fa fa-calendar'></i>"
    }).next(".ui-datepicker-trigger").addClass("btn btn-sm btn-primary").prop('id','btn_cita');
    $( "#fecha_baja_nom" ).datepicker({
        showOn: "both",
        dateFormat: "yy-mm-dd",
        buttonText: "<i class='fa fa-calendar'></i>"
    }).next(".ui-datepicker-trigger").addClass("btn btn-sm btn-primary").prop('id','btn_cita');
} );

$('#modalCompu').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});

$('#darbaja-table tbody').on('click', '.Compu', function () {
    data      = tabla.row($(this).parent()).data();
    var modal = $('#modalCompu');
    modal.modal('toggle');
});

function bajaCompu() {
    var comment  = $('#obs_compu').val();
    var cantidad = $('#compu_cant');
    $.ajax({
        url: '/bajas/baja_compu',
        type: "POST",
        dataType: 'JSON',
        data: {
            _token: CSRF_TOKEN,
            id: data.id,
            obs: comment,
            cantidad: cantidad.val()
        },
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (response) {
            if (response.ok == true){
                Swal.fire({
                    title:"Computo actualizado correctamente",
                    type: "success"
                });
                $('#modalCompu').modal('toggle');
                table.ajax.reload();
            }
        }
    });
}

$('#modalCelu').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});
$('#darbaja-table tbody').on('click', '.Celu', function () {
    data      = tabla.row($(this).parent()).data();
    var modal = $('#modalCelu');
    modal.modal('toggle');
});

function bajaCelu() {
    var comment  = $('#obs_cel').val();
    var cantidad = $('#cel_cant');
    $.ajax({
        url: '/bajas/baja_celu',
        type: "POST",
        dataType: 'JSON',
        data: {
            _token: CSRF_TOKEN,
            id: data.id,
            obs: comment,
            cantidad: cantidad.val()
        },
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (response) {
            if (response.ok == true){
                Swal.fire({
                    title:"Equipo celular actualizado correctamente",
                    type: "success"
                });
                $('#modalCelu').modal('toggle');
                table.ajax.reload();
            }
        }
    });
}

$('#modalAuto').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});
$('#darbaja-table tbody').on('click', '.Auto', function () {
    data      = tabla.row($(this).parent()).data();
    var modal = $('#modalAuto');
    modal.modal('toggle');
});

function bajaAuto() {
    var comment  = $('#obs_auto').val();
    var cantidad = $('#auto_cant');
    $.ajax({
        url: '/bajas/baja_auto',
        type: "POST",
        dataType: 'JSON',
        data: {
            _token: CSRF_TOKEN,
            id: data.id,
            obs: comment,
            cantidad: cantidad.val()
        },
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (response) {
            if (response.ok == true){
                Swal.fire({
                    title:"Auto actualizado correctamente",
                    type: "success"
                });
                $('#modalAuto').modal('toggle');
                table.ajax.reload();
            }
        }
    });
}

$('#modalHerra').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});
$('#darbaja-table tbody').on('click', '.Herra', function () {
    data      = tabla.row($(this).parent()).data();
    var modal = $('#modalHerra');
    modal.modal('toggle');
});

function bajaHerra() {
    var comment  = $('#obs_herra').val();
    var cantidad = $('#herra_cant');
    $.ajax({
        url: '/bajas/baja_herra',
        type: "POST",
        dataType: 'JSON',
        data: {
            _token: CSRF_TOKEN,
            id: data.id,
            obs: comment,
            cantidad: cantidad.val()
        },
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (response) {
            if (response.ok == true){
                Swal.fire({
                    title:"Herramienta actualizada correctamente",
                    type: "success"
                });
                $('#modalHerra').modal('toggle');
                table.ajax.reload();
            }
        }
    });
}

$('#modalCred').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});
$('#darbaja-table tbody').on('click', '.Cred', function () {
    data      = tabla.row($(this).parent()).data();
    var modal = $('#modalCred');
    modal.modal('toggle');
});

function bajaCred() {
    var comment  = $('#obs_cred').val();
    var cantidad = $('#cred_cant');
    $.ajax({
        url: '/bajas/baja_cred',
        type: "POST",
        dataType: 'JSON',
        data: {
            _token: CSRF_TOKEN,
            id: data.id,
            obs: comment,
            cantidad: cantidad.val()
        },
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (response) {
            if (response.ok == true){
                Swal.fire({
                    title:"Herramienta actualizada correctamente",
                    type: "success"
                });
                $('#modalCred').modal('toggle');
                table.ajax.reload();
            }
        }
    });
}

$('#modalFin').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});
$('#darbaja-table tbody').on('click', '.Fini', function () {
    data      = tabla.row($(this).parent()).data();
    var modal = $('#modalFin');
    modal.modal('toggle');
});

function pagoFin() {
    var comment  = $('#obs_fin').val();
    var cantidad = $('#fin_cant');
    $.ajax({
        url: '/bajas/pago_fin',
        type: "POST",
        dataType: 'JSON',
        data: {
            _token: CSRF_TOKEN,
            id: data.id,
            obs: comment,
            cantidad: cantidad.val()
        },
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (response) {
            if (response.ok == true){
                Swal.fire({
                    title:"Actualizado correctamente",
                    type: "success"
                });
                $('#modalFin').modal('toggle');
                table.ajax.reload();
            }
        }
    });
}

$('#darbaja-table tbody').on('click', '.cambio_nom', function () {
    data = table.row($(this).parent()).data();
    Swal.fire({
        title: 'Selecciona la nueva fecha',
        html: '<div class="row"><label for="change_date" class="col-md-12">Fecha Baja Nómina</label>' +
            '<input type="text" name="change_date" id="change_date" class="form-control col-md-11"></div>',
        showCancelButton: true,
        onOpen: function() {
            $('#change_date').datepicker({
                showOn: "both",
                dateFormat: "yy-mm-dd",
                minDate: 0,
                buttonText: "<i class='fa fa-calendar'></i>"
            }).next(".ui-datepicker-trigger").addClass("btn btn-sm btn-primary").prop('id','btn_cita');
        },
    }).then(function(result) {
        if (result.value == true){
            var date = $('#change_date').val();
            if (date == null || date == ''){
                Swal.fire({
                    title:"Fecha no valida",
                    type: "error"
                });
                return false;
            }
            else {
                $.ajax({
                    url: '/bajas/cambio_nom',
                    type: 'POST',
                    dataType: 'JSON',
                    data:{
                        _token: CSRF_TOKEN,
                        id: data.id,
                        date: date
                    },
                    beforeSend: function () {
                        $().loader("show");
                    },
                    complete: function () {
                        $().loader("hide");
                    },
                    success: function (response) {
                        if (response.ok == true){
                            Swal.fire({
                                title: "Cambio realizado Correctamente",
                                type: "success"
                            });
                        }
                        else
                            Swal.fire({
                                title: "Ocurrio un error",
                                type: "error"
                            });
                        table.ajax.reload();
                    }
                });
            }
        }
    });
});

$('#darbaja-table tbody').on('click', '.comment_n', function () {
    data = table.row($(this).parent()).data();
    var type = $(this).data().comment;
    var values = '';
    var ade = '';
    var obs;
    var template = '<div class="row">';
    var editar = false;
    switch (type) {
        case 'Cita':
            values    = '<span class="col-md-12 font-weight-bold">Fecha Baja Nomina: '+data.fecha_baja_nom+'</span>' +
                        '<br><span class="col-md-12 font-weight-bold">Fecha cita: '+data.fecha_cita+'</span>';
            obs       = data.observaciones_cita == null ? '':data.observaciones_cita;
            template += values;
            editar    = cita_baja == 1 ? true:false;
            break;
        case 'Computo':
            ade = '<span class="col-md-12 font-weight-bold">Adeudo: '+(data.deuda_compu==0 ? 0:data.deuda_compu)+'</span>';
            obs = data.obs_compu == null ? '':data.obs_compu;
            editar    = baja_compu == 1 ? true:false;
            break;
        case 'Celular':
            ade = '<span class="col-md-12 font-weight-bold">Adeudo: '+(data.deuda_cel==0 ? 0:data.deuda_cel)+'</span>';
            obs = data.obs_cel == null ? '':data.obs_cel;
            editar    = baja_cel == 1 ? true:false;
            break;
        case 'Auto':
            ade = '<span class="col-md-12 font-weight-bold">Adeudo: '+(data.deuda_auto==0 ? 0:data.deuda_auto)+'</span>';
            obs = data.obs_auto == null ? '':data.obs_auto;
            editar    = baja_coche == 1 ? true:false;
            break;
        case 'Almacen':
            ade = '<span class="col-md-12 font-weight-bold">Adeudo: '+(data.deuda_alma==0 ? 0:data.deuda_alma)+'</span>';
            obs = data.obs_alma == null ? '':data.obs_alma;
            editar    = baja_herra == 1 ? true:false;
            break;
        case 'Credencial':
            ade = '<span class="col-md-12 font-weight-bold">Adeudo: '+(data.deuda_cred==0 ? 0:data.deuda_cred)+'</span>';
            obs = data.obs_cred == null ? '':data.obs_cred;
            editar    = baja_crede == 1 ? true:false;
            break;
    }
    template += ade;
    template += '<textarea type="text" name="comment_n" id="comment_n" class="form-control ">'+obs+'</textarea>';
    template += '</div>';
    Swal.fire({
        title: 'Observaciones '+type,
        html: template,
        showCancelButton: true,
        showConfirmButton: editar,
        confirmButtonText: 'Actualizar',
        cancelButtonText: 'Cancelar'
    }).then(function(result) {
        if (result.value == true){
            $.ajax({
                url: '/bajas/cambio_comment',
                type: 'POST',
                dataType: 'JSON',
                data:{
                    _token: CSRF_TOKEN,
                    id: data.id,
                    comment: $('#comment_n').val(),
                    type: type
                },
                beforeSend: function () {
                    $().loader("show");
                },
                complete: function () {
                    $().loader("hide");
                },
                success: function (response) {
                    if (response.ok == true){
                        Swal.fire({
                            title: "Comentario Actualizado Correctamente",
                            type: "success"
                        });
                    }
                    else
                        Swal.fire({
                            title: "Ocurrio un error",
                            type: "error"
                        });
                    table.ajax.reload();
                }
            });
        }
    });
});

if(cancel_baja != 1)
    table.columns( '.cancel_v' ).visible( false );
if(cita_baja != 1 && ver_checks == 1)
    table.columns( '.cita_v' ).visible( false );
if(baja_compu != 1 && ver_checks == 1)
    table.columns( '.comp_v' ).visible( false );
if(baja_coche != 1 && ver_checks == 1)
    table.columns( '.auto_v' ).visible( false );
if(baja_cel != 1 && ver_checks == 1)
    table.columns( '.cel_v' ).visible( false );
if(baja_herra != 1 && ver_checks == 1)
    table.columns( '.alma_v' ).visible( false );
if(baja_crede != 1 && ver_checks == 1)
    table.columns( '.cred_v ' ).visible( false );
if(baja_rh != 1 && ver_checks == 1)
    table.columns( '.fini_v' ).visible( false );
if(baja_def != 1 && ver_checks == 1)
    table.columns( '.baja_v' ).visible( false );

var search_id  = $('#search_id');
var search_rec = $('#search_rec');
var search_wbs = $('#search_wbs');
var search_est = $('#search_est');

search_id.on('keyup', function () {
    s_id = $(this).val();
    table.draw();
});
search_rec.on('keyup', function () {
    s_rec = $(this).val();
    table.draw();
});
search_wbs.on('keyup', function () {
    s_wbs = $(this).val();
    table.draw();
});
search_est.on('change', function () {
    s_est = $(this).val();
    table.draw();
});

$('#reset').on('click', function (e) {
    if (id_post != 0)
        window.location = '/bajas';
    reset    = 1;
    s_id     = null;
    s_rec    = null;
    s_wbs    = null;
    s_est   = null;
    search_id.val("");
    search_rec.val("");
    search_wbs.val("");
    search_est.val("");
    table.draw();
    e.preventDefault();
    reset = 0;
});