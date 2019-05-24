// ==========================tablas================================
var CSRF_TOKEN = $('#token').val();
var table = $('#catalogosCodigos-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    order: [[0, "desc"]],
    ajax: '/datatables/get_catalogo_codigos',
    columns: [
        {data: 'id', name: 'id'},
        {data: 'codigo', name: 'codigo'},
        {data: 'concepto', name: 'concepto'},
        {data: 'precio', name: 'precio'},
        {data: 'costo', name: 'costo'},
        {data: 'incluye', name: 'incluye'},
        {data: 'tipo', name: 'tipo'},
        {data: 'diario', name: 'diario'},
        {data: 'pd', name: 'pd'},
        {data: 'diario_gasolina', name: 'diario_gasolina'},
        {data: 'monto_viatico', name: 'monto_viatico'},
        {data: 'incluye_viaticos', name: 'incluye_viaticos'},
        {data: 'incluye_equipo', name: 'incluye_equipo'},
        {data: 'descripcion', name: 'descripcion'},
        {data: 'horas', name: 'horas'},
        {data: 'caduca', name: 'caduca'},
        {},
        {},
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
            "last": "Última",
        },
        processing: '<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>'
    },
    'columnDefs': [
        {
            "targets": 16,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Editar' onclick='OcultaBtnEdit();' class='Editar btn-xs btn-primary iconEdit' style='margin-rigth: 5px;margin-left: 5px'><i class='fa fa-pencil-square-o'></i></button>"

        },


        {
            "targets": 17,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Eliminar' class='Eliminar btn-xs btn-primary iconEdit'  style='margin-rigth: 5px;margin-left: 5px'><i class='fa fa-trash'></i></button>"

        }

    ],
});

new $.fn.dataTable.FixedHeader(table);

var tableCoordinador = $('#Coordinador-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    order: [[0, "desc"]],
    ajax: '/datatables/get_catalogo_coordinador',
    columns: [
        {data: 'id', name: 'id'},
        {data: 'nombre', name: 'nombre'},
        {data: 'apellido', name: 'apellido'},
        {data: 'correo', name: 'correo'},
        {},
        {},
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
            "last": "Última",
        },
        processing: '<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>'
    },
    'columnDefs': [
        {
            "targets": 4,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Editar'  onclick='OcultaBtnEdit();' class='Editar btn-xs btn-primary iconEdit' style='margin-rigth: 5px;margin-left: 5px'><i class='fa fa-pencil-square-o'></i></button>"

        },


        {
            "targets": 5,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Eliminar' class='Eliminar btn-xs btn-primary iconEdit'  style='margin-rigth: 5px;margin-left: 5px'><i class='fa fa-trash'></i></button>"

        }

    ],
});


var tableplanes = $('#planes-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    order: [[0, "desc"]],
    ajax: '/datatables/get_catalogo_planes',
    columns: [
        {data: 'plan_id', name: 'plan_id'},
        {data: 'plan_codigo', name: 'plan_codigo'},
        {data: 'plan_nombre', name: 'plan_nombre'},
        {data: 'plan_tipo', name: 'plan_tipo'},
        {data: 'plan_descripion', name: 'plan_descripion'},
        {data: 'plan_costo', name: 'plan_costo'},
        {data: 'plan_precio', name: 'plan_precio'},
        {data: 'plan_empresa', name: 'plan_empresa'},
        {data: 'plan_proveedor', name: 'plan_proveedor'},
        {},
        {},
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
            "last": "Última",
        },
        processing: '<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>'
    },
    'columnDefs': [
        {
            "targets": 9,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Editar' onclick='OcultaBtnEdit();' class='Editar btn-xs btn-primary iconEdit' style='margin-rigth: 5px;margin-left: 5px'><i class='fa fa-pencil-square-o'></i></button>"

        },


        {
            "targets": 10,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Eliminar' class='Eliminar btn-xs btn-primary iconEdit'  style='margin-rigth: 5px;margin-left: 5px'><i class='fa fa-trash'></i></button>"

        }

    ],
});

new $.fn.dataTable.FixedHeader(tableplanes);

var tablewbs = $('#wbs-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    order: [[0, "desc"]],
    ajax: '/datatables/get_catalogo_wbs',
    columns: [
        {data: 'id', name: 'id'},
        {data: 'cliente', name: 'cliente'},
        {data: 'servicio', name: 'servicio'},
        {data: 'region', name: 'region'},
        {data: 'tecnologia', name: 'aptecnologiaellido'},
        {data: 'grupo', name: 'grupo'},
        {},
        {},
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
            "last": "Última",
        },
        processing: '<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>'
    },
    'columnDefs': [
        {
            "targets": 6,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Editar' onclick='OcultaBtnEdit();' class='Editar btn-xs btn-primary iconEdit' style='margin-rigth: 5px;margin-left: 5px'><i class='fa fa-pencil-square-o'></i></button>"

        },


        {
            "targets": 7,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Eliminar' class='Eliminar btn-xs btn-primary iconEdit'  style='margin-rigth: 5px;margin-left: 5px'><i class='fa fa-trash'></i></button>"

        }

    ],
});

new $.fn.dataTable.FixedHeader(tablewbs);

var DataFormEditCodigo;

function fecha() {
    var fecha = new Date();
    var date = fecha.getFullYear() + '-' + (fecha.getMonth() + 1) + '-' + fecha.getDate() + ' ' + fecha.getHours() + ':' + fecha.getMinutes() + ':' + fecha.getSeconds();
    return date;

}

function OcultaBtnEdit() {
// Codigos
    $("#CEditar").css('visibility', 'hidden'); //Cambio de propiedad CSS
    $("#CAgregar").css('visibility', 'visible'); //Cambio de propiedad CSS

// Coordinadores
    $("#CoEditar").css('visibility', 'hidden'); //Cambio de propiedad CSS
    $("#CoAgregar").css('visibility', 'visible'); //Cambio de propiedad CSS

// planes
    $("#PlEditar").css('visibility', 'hidden'); //Cambio de propiedad CSS
    $("#PlNuevo").css('visibility', 'visible'); //Cambio de propiedad CSS

//WBS
    $('#addcodigoplan').text("Nuevo plan");
    $('#ModalNuevoWBS').text("Nuevo WBS");


    $("#Ccodigo").removeAttr('disabled');
    $("#CoNombre").removeAttr('disabled');
    $("#Pcodigo").removeAttr('disabled');
    $("#Pnombre").removeAttr('disabled');
    $("#Cconsepto").removeAttr('disabled');
}


var idCodigo = 0;


$('#catalogosCodigos-table tbody').on('click', '.Editar', function () {

    $("#CAgregar").css('visibility', 'hidden'); //Cambio de propiedad CSS
    $("#CEditar").css('visibility', 'visible'); //Cambio de propiedad CSS


    data = table.row($(this).parent()).data();
    idCodigo = data['id'];
    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        id: data['id'],
        opcion: 2,
        MontoViatico: 0,
        Ccodigo: 0,
        Cconsepto: 0,
        Cprecio: 0,
        Ccosto: 0,
        Cincluye: 0,
        Ctipo: 0,
        Cdiario: 0,
        Cpd: 0,
        CdiarioGasolina: 0,
        Horas: 0,
        CincluyeViaticos: 0,
        CincluyeEquipo: 0,
        cDescripcion: 0,
        Ccaduca: fecha(),
    };


    $.post("/configuracion/funcion_codigos", DataFormEditCodigo,
        function (data, status) {
            $('#ModalNuevoCodigo').modal('show');
            $('#addcodigo').text("Editar Codigo " + data[0].codigo);
            document.getElementById("Ccodigo").value = data[0].codigo;
            document.getElementById("Cconsepto").value = data[0].concepto;


            document.getElementById("Ccosto").value = data[0].costo;
            document.getElementById("Cincluye").value = data[0].incluye;
            document.getElementById("Ctipo").value = data[0].tipo;
            document.getElementById("Cdiario").value = data[0].diario;
            document.getElementById("Cpd").value = data[0].pd;
            document.getElementById("Horas").value = data[0].horas;
            document.getElementById("CincluyeViaticos").value = data[0].incluye_viaticos;
            document.getElementById("CincluyeEquipo").value = data[0].incluye_equipo;
            document.getElementById("cDescripcion").value = data[0].descripcion;
            document.getElementById("Ccaduca").value = data[0].caduca;
            document.getElementById("Cprecio").value = data[0].precio;
            $("#Ccodigo").attr('disabled', 'disabled');
            $("#Cconsepto").attr('disabled', 'disabled');
        }
    );

});


$('#ModalNuevoCodigo').on('hidden.bs.modal', function (event) {
    document.getElementById("Ccodigo").value = null
    document.getElementById("Cconsepto").value = null;
    document.getElementById("Ccosto").value = null
    document.getElementById("Cincluye").value = null
    document.getElementById("Ctipo").value = null
    document.getElementById("Cdiario").value = null
    document.getElementById("Cpd").value = null
    document.getElementById("Horas").value = null
    document.getElementById("CincluyeViaticos").value = null;
    document.getElementById("CincluyeEquipo").value = null;
    document.getElementById("cDescripcion").value = null;
    document.getElementById("Ccaduca").value = fecha()
    document.getElementById("Cprecio").value = null
})


$("Codigos").submit(function () {

    CodigoNuevo()
});


$('#Modal').on('show.bs.modal', function (event) {

})


function ActualizarCodigo() {

    var descr = $("#cDescripcion").val();
    var hora = $("#Horas").val();
    if (descr == '' || hora == '') {
        descr = '--';
        hora = 0;
    }

    DataFormEditCodigo = {
        id: idCodigo,
        opcion: 0,
        MontoViatico: 0,
        Ccodigo: $("#Ccodigo").val(),
        Cconsepto: $("#Cconsepto").val(),
        Cprecio: $("#Cprecio").val(),
        Ccosto: $("#Ccosto").val(),
        Cincluye: $("#Cincluye").val(),
        Ctipo: $("#Ctipo").val(),
        Cdiario: $("#Cdiario").val(),
        Cpd: $("#Cpd").val(),
        CdiarioGasolina: 0,
        Horas: $("#Horas").val(),
        CincluyeViaticos: $("#CincluyeViaticos").val(),
        CincluyeEquipo: $("#CincluyeEquipo").val(),
        cDescripcion: descr,
        Ccaduca: $("#Ccaduca").val(),

    }
    swal({
        title: 'Codigo',
        text: "Desea guardar cambios",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/api/funcionCodigos", DataFormEditCodigo,
            function (data) {
                table.ajax.reload();
                swal({
                    title: "Actualizacion correcta",
                    text: data[0].MENSAJE,
                });


                $('#ModalNuevoCodigo').modal('hide');
            }
        );
    })
}


function Validatecodigo() {

    if (
        $("#Ccodigo").val() == '' ||
        $("#Cconsepto").val() == '' ||
        $("#Cprecio").val() == '' ||
        $("#Ccosto").val() == '' ||
        $("#Cincluye").val() == '' ||
        $("#Ctipo").val() == '' ||
        $("#Cdiario").val() == '' ||
        $("#Cpd").val() == '' ||
        $("#Horas").val() == '' ||
        $("#CincluyeViaticos").val() == '' ||
        $("#CincluyeEquipo").val() == '' ||
        $("#cDescripcion").val() == '') {
        return false
    } else {
        return true
    }


}


function CodigoNuevo() {
    if (Validatecodigo()) {
        DataFormEditCodigo = {
            id: idCodigo,
            opcion: 3,
            MontoViatico: 0,
            Ccodigo: $("#Ccodigo").val(),
            Cconsepto: $("#Cconsepto").val(),
            Cprecio: $("#Cprecio").val(),
            Ccosto: $("#Ccosto").val(),
            Cincluye: $("#Cincluye").val(),
            Ctipo: $("#Ctipo").val(),
            Cdiario: $("#Cdiario").val(),
            Cpd: $("#Cpd").val(),
            CdiarioGasolina: 0,
            Horas: $("#Horas").val(),
            CincluyeViaticos: $("#CincluyeViaticos").val(),
            CincluyeEquipo: $("#CincluyeEquipo").val(),
            cDescripcion: $("#cDescripcion").val(),
            Ccaduca: fecha(),

        }
        swal({
            title: 'Codigo',
            text: "Desea guardar cambios",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'OK'
        }).then((result) => {
            $.post("/api/funcionCodigos", DataFormEditCodigo,
                function (data) {
                    table.ajax.reload();
                    swal({
                        title: "Actualizacion correcta",
                        text: data[0].MENSAJE,
                    });

                    $('#ModalNuevoCodigo').modal('hide');
                }
            );
        })

    } else {
        swal({
            title: "Error",
            type: 'error',
            text: "Todos los datos son requeridos",
        });
    }


}


$('#catalogosCodigos-table tbody').on('click', '.Eliminar', function () {


    data = table.row($(this).parent()).data();
    idCodigo = data['id'];

    DataFormEditCodigo = {
        id: idCodigo,
        opcion: 1,
        MontoViatico: 0,
        Ccodigo: 0,
        Cconsepto: 0,
        Cprecio: 0,
        Ccosto: 0,
        Cincluye: 0,
        Ctipo: 0,
        Cdiario: 0,
        Cpd: 0,
        CdiarioGasolina: 0,
        Horas: 0,
        CincluyeViaticos: 0,
        CincluyeEquipo: 0,
        cDescripcion: 0,
        Ccaduca: fecha()
    }


    swal({
        title: 'Codigo',
        text: "Desea eliminar el codigo selecionado?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/api/funcionCodigos", DataFormEditCodigo,
            function (data) {
                table.ajax.reload();
                swal({
                    title: "Hecho!",
                    text: data[0].MENSAJE,
                });

            }
        );
    })
});


// ===================================================================
//=====================   seccion de coordinadores ===================
// ===================================================================

var idcoordinador = 0;
$('#Coordinador-table tbody').on('click', '.Editar', function () {
    $("#CoAgregar").css('visibility', 'hidden'); //Cambio de propiedad CSS
    $("#CoEditar").css('visibility', 'visible'); //Cambio de propiedad CSS


    $("CoNombre").prop('disabled', true);
    data = tableCoordinador.row($(this).parent()).data();
    idcoordinador = data['id'];

    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        Catalogo: 'coordinador',
        Opcion: 0,

        idCoordinador: data['id'],
        Nombre: 0,
        Apellido: 0,
        Correo: 0,

        plan_id: 0,
        plan_codigo: 0,
        plan_nombre: 0,
        plan_tipo: 0,
        plan_descripcion: 0,
        plan_costo: 0,
        plan_precio: 0,
        plan_empresa: 0,
        plan_proveedor: 0,

        idwbs: 0,
        cliente: 0,
        servicio: 0,
        region: 0,
        tecnologia: 0,
        grupo: 0,
    };
    $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
        function (data) {
            $('#ModalNuevoCoordinador').modal('show');
            // $('#addCoordinador').text("Editar coordinador " + data[0].nombre );
            document.getElementById("CoNombre").value = data[0].nombre;
            document.getElementById("CoApellido").value = data[0].apellido;
            document.getElementById("CoCorreo").value = data[0].correo;

            $("#CoNombre").attr('disabled', 'disabled');

        }
    );
    $('#ModalNuevoCoordinador').modal('show');
});


function caracteresCorreo(email) {
    var caract = new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/);
    if (caract.test(email) == false) {
        return false;
    } else {
        return true;
    }
}


function NuevoCoordinador() {

    if ($("#CoNombre").val() == '' || $("#CoApellido").val() == '' || $("#CoCorreo").val() == '') {
        swal({
            title: "Mensaje",
            type: "error",
            text: "Todos los campos son obligatorios",
        });
        return false
    } else {


        if (caracteresCorreo($("#CoCorreo").val()) == false) {

            swal({
                title: "Mensaje",
                type: "error",
                text: "El correo no es valido",
            });

            return false
        } else {


            //  $('#addCoordinador').text("Nuevo coordinador");

            DataFormEditCodigo = {
                _token: CSRF_TOKEN,
                Catalogo: 'coordinador',
                Opcion: 3,

                idCoordinador: 0,
                Nombre: $("#CoNombre").val(),
                Apellido: $("#CoApellido").val(),
                Correo: $("#CoCorreo").val(),

                plan_id: 0,
                plan_codigo: 0,
                plan_nombre: 0,
                plan_tipo: 0,
                plan_descripcion: 0,
                plan_costo: 0,
                plan_precio: 0,
                plan_empresa: 0,
                plan_proveedor: 0,

                idwbs: 0,
                cliente: 0,
                servicio: 0,
                region: 0,
                tecnologia: 0,
                grupo: 0,
            };
            swal({
                title: 'Codigo',
                text: "Desea guardar un nuevo coordinador?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'OK'
            }).then((result) => {
                $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
                    function (data) {
                        tableCoordinador.ajax.reload();
                        swal({
                            title: "Coordinadores",
                            text: data[0].MENSAJE,

                        });
                        $('#ModalNuevoCoordinador').modal('hide');
                    }
                );
            })


        }
    }


}


function ActualizarCoordinador() {


    if (caracteresCorreo($("#CoCorreo").val()) == false) {
        swal({
            title: "Mensaje",
            type: "error",
            text: "El correo no es valido",
        });

        return false
    } else {


        DataFormEditCodigo = {
            _token: CSRF_TOKEN,
            Catalogo: 'coordinador',
            Opcion: 1,

            idCoordinador: idcoordinador,
            Nombre: $("#CoNombre").val(),
            Apellido: $("#CoApellido").val(),
            Correo: $("#CoCorreo").val(),

            plan_id: 0,
            plan_codigo: 0,
            plan_nombre: 0,
            plan_tipo: 0,
            plan_descripcion: 0,
            plan_costo: 0,
            plan_precio: 0,
            plan_empresa: 0,
            plan_proveedor: 0,

            idwbs: 0,
            cliente: 0,
            servicio: 0,
            region: 0,
            tecnologia: 0,
            grupo: 0,
        }
        swal({
            title: 'Coordinadores',
            text: "Desea guardar cambios",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'OK'
        }).then((result) => {
            $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
                function (data) {
                    tableCoordinador.ajax.reload();
                    swal({
                        title: "Actualizacion correcta",
                        text: data[0].MENSAJE,

                    });


                    $('#ModalNuevoCoordinador').modal('hide');
                }
            );
        })


    }
}

$('#ModalNuevoCoordinador').on('hidden.bs.modal', function (event) {

    document.getElementById("CoNombre").value = null
    document.getElementById("CoApellido").value = null;
    document.getElementById("CoCorreo").value = null

})


$('#Coordinador-table tbody').on('click', '.Eliminar', function () {


    data = tableCoordinador.row($(this).parent()).data();

    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        Catalogo: 'coordinador',
        Opcion: 2,

        idCoordinador: data['id'],
        Nombre: 0,
        Apellido: 0,
        Correo: 0,

        plan_id: 0,
        plan_codigo: 0,
        plan_nombre: 0,
        plan_tipo: 0,
        plan_descripcion: 0,
        plan_costo: 0,
        plan_precio: 0,
        plan_empresa: 0,
        plan_proveedor: 0,

        idwbs: 0,
        cliente: 0,
        servicio: 0,
        region: 0,
        tecnologia: 0,
        grupo: 0,
    };

    swal({
        title: 'Codigo',
        text: "Desea eliminar el coordinador seleccioando?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
            function (data) {
                tableCoordinador.ajax.reload();
                swal({
                    title: "Hecho!",
                    text: data[0].MENSAJE,
                });
// setTimeout(function () {
//     location.href="/rh/public/configuracion"
// }, 3000);
            }
        );
    })
});


// ===================================================================
//=====================  Termina seccion de coordinadores ============
// ===================================================================


// ===================================================================
//=====================   seccion de planes ===================
// ===================================================================

var idPlan = 0;
$('#planes-table tbody').on('click', '.Editar', function () {
    $("#PlEditar").css('visibility', 'visible '); //Cambio de propiedad CSS
    $("#PlNuevo").css('visibility', 'hidden'); //Cambio de propiedad CSS


    data = tableplanes.row($(this).parent()).data();
    idPlan = data['plan_id'];

    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        Catalogo: 'plan',
        Opcion: 0,

        idCoordinador: 0,
        Nombre: 0,
        Apellido: 0,
        Correo: 0,

        plan_id: idPlan,
        plan_codigo: 0,
        plan_nombre: 0,
        plan_tipo: 0,
        plan_descripcion: 0,
        plan_costo: 0,
        plan_precio: 0,
        plan_empresa: 0,
        plan_proveedor: 0,

        idwbs: 0,
        cliente: 0,
        servicio: 0,
        region: 0,
        tecnologia: 0,
        grupo: 0,
    };

    $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
        function (data) {
            document.getElementById("Pcodigo").value = data[0].plan_codigo;
            document.getElementById("Pnombre").value = data[0].plan_nombre;
            document.getElementById("Pdescripcion").value = data[0].plan_descripcion;
            document.getElementById("pcosto").value = data[0].plan_costo;
            document.getElementById("ptipo").value = data[0].plan_tipo;
            document.getElementById("Pprecio").value = data[0].plan_precio;
            document.getElementById("Pempresa").value = data[0].plan_empresa;
            document.getElementById("Pproveedor").value = data[0].plan_proveedor;

            $("#Pcodigo").attr('disabled', 'disabled');
            $("#Pnombre").attr('disabled', 'disabled');
        }
    );
    $('#ModalNuevoPlan').modal('show');
    $('#addcodigoplan').text("Editar plan de linea");
});


function NuevoPlan() {
    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        Catalogo: 'plan',
        Opcion: 3,

        idCoordinador: 0,
        Nombre: 0,
        Apellido: 0,
        Correo: 0,

        plan_id: 0,
        plan_codigo: $("#Pcodigo").val(),
        plan_nombre: $("#Pnombre").val(),
        plan_tipo: $("#ptipo").val(),
        plan_descripcion: $("#Pdescripcion").val(),
        plan_costo: $("#pcosto").val(),
        plan_precio: $("#Pprecio").val(),
        plan_empresa: $("#Pempresa").val(),
        plan_proveedor: $("#Pproveedor").val(),

        idwbs: 0,
        cliente: 0,
        servicio: 0,
        region: 0,
        tecnologia: 0,
        grupo: 0,
    };
    swal({
        title: 'Codigo',
        text: "Desea guardar un nuevo plan?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
            function (data) {
                tableplanes.ajax.reload();
                swal({
                    title: "Mensaje",
                    text: data[0].MENSAJE,
                });
                $('#ModalNuevoPlan').modal('hide');
            }
        );
    })
}


function ActualizarPlan() {
    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        Catalogo: 'plan',
        Opcion: 1,

        idCoordinador: 0,
        Nombre: 0,
        Apellido: 0,
        Correo: 0,

        plan_id: idPlan,
        plan_codigo: $("#Pcodigo").val(),
        plan_nombre: $("#Pnombre").val(),
        plan_tipo: $("#ptipo").val(),
        plan_descripcion: $("#Pdescripcion").val(),
        plan_costo: $("#pcosto").val(),
        plan_precio: $("#Pprecio").val(),
        plan_empresa: $("#Pempresa").val(),
        plan_proveedor: $("#Pproveedor").val(),

        idwbs: 0,
        cliente: 0,
        servicio: 0,
        region: 0,
        tecnologia: 0,
        grupo: 0,
    };
    swal({
        title: 'Planes lineas',
        text: "Desea guardar cambios",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
            function (data) {
                tableplanes.ajax.reload();
                swal({
                    title: "Mensaje",
                    text: data[0].MENSAJE,
                });
                $('#ModalNuevoPlan').modal('hide');
            }
        );
    })
}

$('#ModalNuevoPlan').on('hidden.bs.modal', function (event) {
    document.getElementById("Pcodigo").value = null
    document.getElementById("Pnombre").value = null;
    document.getElementById("Pdescripcion").value = null
    document.getElementById("pcosto").value = null
    document.getElementById("ptipo").value = null;
    document.getElementById("Pprecio").value = null
    document.getElementById("Pempresa").value = null
    document.getElementById("Pproveedor").value = null;
})


$('#planes-table tbody').on('click', '.Eliminar', function () {


    data = tableplanes.row($(this).parent()).data();

    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        Catalogo: 'plan',
        Opcion: 2,

        idCoordinador: 0,
        Nombre: 0,
        Apellido: 0,
        Correo: 0,

        plan_id: data['plan_id'],
        plan_codigo: 0,
        plan_nombre: 0,
        plan_tipo: 0,
        plan_descripcion: 0,
        plan_costo: 0,
        plan_precio: 0,
        plan_empresa: 0,
        plan_proveedor: 0,

        idwbs: 0,
        cliente: 0,
        servicio: 0,
        region: 0,
        tecnologia: 0,
        grupo: 0,
    };

    swal({
        title: 'Planes lineas',
        text: "Desea eliminar el plan seleccionado?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
            function (data) {
                tableplanes.ajax.reload();
                swal({
                    title: "Hecho!",
                    text: data[0].MENSAJE,
                });
// setTimeout(function () {
//     location.href="/rh/public/configuracion"
// }, 3000);
            }
        );
    })
});


// ===================================================================
//=====================  Termina seccion de planes ============
// ===================================================================


// ===================================================================
//=====================   seccion de WBS ===================
// ===================================================================

var idwbs = 0;
$('#wbs-table tbody').on('click', '.Editar', function () {

    $('#Editarwbs').modal('show');


    data = tablewbs.row($(this).parent()).data();
    idwbs = data['id'];

    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        Catalogo: 'wbs',
        Opcion: 0,

        idCoordinador: 0,
        Nombre: 0,
        Apellido: 0,
        Correo: 0,

        plan_id: idPlan,
        plan_codigo: 0,
        plan_nombre: 0,
        plan_tipo: 0,
        plan_descripcion: 0,
        plan_costo: 0,
        plan_precio: 0,
        plan_empresa: 0,
        plan_proveedor: 0,

        idwbs: idwbs,
        cliente: 0,
        servicio: 0,
        region: 0,
        tecnologia: 0,
        grupo: 0,
    };

    $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
        function (data) {
            document.getElementById("wbsClientem").value = data[0].cliente;
            document.getElementById("wbsServiciom").value = data[0].servicio;
            document.getElementById("wbsDescripm").value = data[0].region;
            document.getElementById("wbsTecnologiam").value = data[0].tecnologia;
            document.getElementById("wbsGrupom").value = data[0].grupo;

        }
    );

});


function NuevoWBS() {
    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        Catalogo: 'wbs',
        Opcion: 3,

        idCoordinador: 0,
        Nombre: 0,
        Apellido: 0,
        Correo: 0,

        plan_id: 0,
        plan_codigo: 0,
        plan_nombre: 0,
        plan_tipo: 0,
        plan_descripcion: 0,
        plan_costo: 0,
        plan_precio: 0,
        plan_empresa: 0,
        plan_proveedor: 0,

        idwbs: 0,
        cliente: $("#wbsCliente").val(),
        servicio: $("#wbsServicio").val(),
        region: $("#wbsDescrip").val(),
        tecnologia: $("#wbsTecnologia").val(),
        grupo: $("#wbsGrupo").val(),
    };
    swal({
        title: 'Codigo',
        text: "Desea guardar un nuevo WBS?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
            function (data) {
                tablewbs.ajax.reload();
                swal({
                    title: "Mensaje",
                    text: data[0].MENSAJE,
                });
                $('#ModalNuevoWBS').modal('hide');
            }
        );
    })
}


function ActualizarWBS() {
    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        Catalogo: 'wbs',
        Opcion: 1,

        idCoordinador: 0,
        Nombre: 0,
        Apellido: 0,
        Correo: 0,

        plan_id: 0,
        plan_codigo: 0,
        plan_nombre: 0,
        plan_tipo: 0,
        plan_descripcion: 0,
        plan_costo: 0,
        plan_precio: 0,
        plan_empresa: 0,
        plan_proveedor: 0,

        idwbs: idwbs,
        cliente: $("#wbsClientem").val(),
        servicio: $("#wbsServiciom").val(),
        region: $("#wbsDescripm").val(),
        tecnologia: $("#wbsTecnologiam").val(),
        grupo: $("#wbsGrupom").val(),
    };
    swal({
        title: 'WBS',
        text: "Desea guardar cambios",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
            function (data) {
                tablewbs.ajax.reload();
                swal({
                    title: "Mensaje",
                    text: data[0].MENSAJE,
                });
                $('#ModalNuevoPlan').modal('hide');
            }
        );
    })
}


$('#wbs-table tbody').on('click', '.Eliminar', function () {
    data = tablewbs.row($(this).parent()).data();

    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        Catalogo: 'wbs',
        Opcion: 2,

        idCoordinador: 0,
        Nombre: 0,
        Apellido: 0,
        Correo: 0,

        plan_id: 0,
        plan_codigo: 0,
        plan_nombre: 0,
        plan_tipo: 0,
        plan_descripcion: 0,
        plan_costo: 0,
        plan_precio: 0,
        plan_empresa: 0,
        plan_proveedor: 0,

        idwbs: data['id'],
        cliente: 0,
        servicio: 0,
        region: 0,
        tecnologia: 0,
        grupo: 0,
    };

    swal({
        title: 'WBS',
        text: "Desea eliminar el wbs seleccionado?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/configuracion/funciones_codigos", DataFormEditCodigo,
            function (data, status) {
                tablewbs.ajax.reload();
                if (status = 'success') {
                    swal({
                        title: "Hecho!",
                        text: data[0].MENSAJE,
                        type: 'warning',
                    });

                } else {
                    swal({
                        title: "Error!",
                        type: 'erros',
                        text: data[0].MENSAJE,
                    });

                }


// setTimeout(function () {
//     location.href="/rh/public/configuracion"
// }, 3000);
            }
        );
    })
});
// ===================================================================
//=====================  Termina seccion de planes ============
// ===================================================================





















