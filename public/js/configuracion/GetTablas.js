var CSRF_TOKEN = $('#token').val();
var tableProy = $('#proyectos-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    order: [[0, "desc"]],
    ajax: '/datatables/get_catalogo_proyectos',
    columns: [
        {data: 'id', name: 'id'},
        {data: 'proyecto', name: 'proyecto'},
        {data: 'nombre', name: 'nombre'},
        {data: 'activo', name: 'activo'},
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
            "defaultContent": "<button data-tipo='Editar'  class='Editar btn-xs btn-primary iconEdit' style='margin-rigth: 5px;margin-left: 5px'><i class='fa fa-pencil-square-o'></i></button>"

        },


        {
            "targets": 5,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Eliminar' class='Eliminar btn-xs btn-primary iconEdit'  style='margin-rigth: 5px;margin-left: 5px'><i class='fa fa-trash'></i></button>"

        }

    ],
});

new $.fn.dataTable.FixedHeader(tableProy);

var TipoProyecto;

function OcultaDiv() {
    $('#NuevoProy').show(); //muestro mediante id
    $('#ActualizarProy').hide();


    if (!$("#divRadios input[name='p']").is(':checked')) {
        alert('Favor de seleccionar una opción');
    } else {
        TipoProyecto = $('input:radio[name=p]:checked').val();

        document.getElementById("ProyTablan").value = TipoProyecto

        document.getElementById("proyId").value = ''
        document.getElementById("ProyNom").value = ''
        document.getElementById("proyActivo").value = 1

    }

}

var TableBus;
var idwbs;
$('#proyectos-table tbody').on('click', '.Editar', function () {
    $('#ModalProyectos').modal('show');
    $('#ActualizarProy').show(); //muestro mediante id
    $('#NuevoProy').hide();


    data = tableProy.row($(this).parent()).data();
    idwbs = data['id'];
    TableBus = data['proyecto'];


    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        id: idwbs,
        opcion: 0,
        wbs: TableBus,
        nombre: 'hhh',
        activo: 1
    };

    $.post("/configuracion/funcion_proyectos_wbs", DataFormEditCodigo,
        function (data) {
            document.getElementById("proyId").value = data[0].id;
            document.getElementById("ProyTabla").value = TableBus;
            document.getElementById("ProyNom").value = data[0].nombre;
            document.getElementById("proyActivo").value = data[0].activo;
        }
    );
});


function NuevoProyecto() {
    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        id: $("#proyIdn").val(),
        opcion: 3,
        wbs: TipoProyecto,
        nombre: $("#ProyNomn").val(),
        activo: $("#proyActivon").val(),
    };

    swal({
        title: 'Proyecto',
        text: "Desea guardar datos?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/configuracion/funcion_proyectos_wbs", DataFormEditCodigo,
            function (data) {
                tableProy.ajax.reload();
                swal({
                    title: "Mensaje",
                    text: data[0].MENSAJE,
                });
                $('#ModalProyectos').modal('hide');
            }
        );
    })
}


function ActualizarProyecto() {
    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        id: $("#proyId").val(),
        opcion: 1,
        wbs: $("#ProyTabla").val(),
        nombre: $("#ProyNom").val(),
        activo: $("#proyActivo").val(),
    };

    swal({
        title: 'Proyecto',
        text: "Desea guardar cambios",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/configuracion/funcion_proyectos_wbs", DataFormEditCodigo,
            function (data) {
                tableProy.ajax.reload();
                swal({
                    title: "Mensaje",
                    text: data[0].MENSAJE,
                });
                $('#ModalProyectos').modal('hide');
            }
        );
    })

}


$('#proyectos-table tbody').on('click', '.Eliminar', function () {
    data = tableProy.row($(this).parent()).data();

    DataFormEditCodigo = {
        _token: CSRF_TOKEN,
        id: data['id'],
        opcion: 2,
        wbs: data['proyecto'],
        nombre: 0,
        activo: 0,
    };

    swal({
        title: 'proyectos',
        text: "Desea eliminar el registro selecionado?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'OK'
    }).then((result) => {
        $.post("/configuracion/funcion_proyectos_wbs", DataFormEditCodigo,
            function (data, status) {
                tableProy.ajax.reload();
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
// ==============================