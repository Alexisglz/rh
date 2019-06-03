var envio = $('#envio').val();
var CSRF_TOKEN = $('#token').val();
var s_id = null;
var s_nombre = null;
var s_num = null;
var s_inci = null;
var s_sol = null;
var s_esta = null;
var s_tipo = null;
var reset = 0;
var table = $('#Incidencias_Enviar-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    order: [[0, "desc"]],
    ajax: {
        url: '/datatables/get_incidencias_finalizadas',
        type: 'GET',
        data: function (data) {
            data.tipo          = envio;
            data.search_id     = s_id;
            data.search_nombre = s_nombre;
            data.search_num    = s_num;
            data.search_inci   = s_inci;
            data.search_sol    = s_sol;
            data.search_esta   = s_esta;
            data.search_tipo   = s_tipo;
        },
    },
    columns: [
        {data: 'id', name: 'id'},
        {valor: {data: 'id_lote', data: 'id'}, name: 'id_lote'},
        {data: 'empleado', name: 'empleado'},
        {data: 'emp_id', name: 'emp_id'},
        {data: 'incidencia', name: 'incidencia'},
        {data: 'tipo_incidencia', name: 'tipo_incidencia'},
        {data: 'solicitante', name: 'solicitante'},
        {data: 'id_lote', name: 'id_lote'},
        {data: 'estatus', name: 'estatus'},
        {data: 'duracion', name: 'duracion'},
        {data: 'fecha_solicitud', name: 'fecha_solicitud'},
        {data: 'fecha_inicio', name: 'fecha_inicio'},
        {data: 'motivo', name: 'motivo'},
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
    }, 'columnDefs': [

        {
            "targets": 1,
            "data": null,
            "render": function (data, type, row) {
                if (row.estatus == 'ENVIADO') {
                    return '<i class="fas fa-check-circle" style="color:#007bffcc;font-size:20px"></i>';
                } else if(row.estatus == 'CANCELAR') {
                    return '<i class="fas fa-close" style="color:red;font-size:20px"></i>';
                }
            },
        },
    ],
});

function ExportExcel() {
    swal({
            title: "Incidencias",
            text: "Se descargaran todas las incidencias con lote",
            type: "warning",
            confirmButtonClass: "btn-success",
            confirmButtonText: "Ok",
            closeOnConfirm: true,
            closeOnCancel: true
        },
        function (isConfirm) {
            if (isConfirm) {
                location.href = "/excel/export_incidencias_lote/";
            }
        });
}

var search_id     = $('#search_id');
var search_nombre = $('#search_nombre');
var search_num    = $('#search_num');
var search_inci   = $('#search_inci');
var search_sol    = $('#search_sol');
var search_esta   = $('#search_esta');
var search_tipo   = $('#search_tipo');

search_id.on('keyup', function () {
    s_id = $(this).val();
    table.draw();
});
search_nombre.on('keyup', function () {
    s_nombre = $(this).val();
    table.draw();
});
search_num.on('keyup', function () {
    s_num = $(this).val();
    table.draw();
});
search_inci.on('keyup', function () {
    s_inci = $(this).val();
    table.draw();
});
search_sol.on('keyup', function () {
    s_sol = $(this).val();
    table.draw();
});
search_esta.on('change', function () {
    s_esta = $(this).val();
    table.draw();
});
search_tipo.on('change', function () {
    s_tipo = $(this).val();
    table.draw();
});

$('#reset').on('click', function (e) {
    reset    = 1;
    s_id     = null;
    s_nombre = null;
    s_num    = null;
    s_inci   = null;
    s_sol    = null;
    s_esta   = null;
    s_tipo   = null;
    search_id.val("");
    search_nombre.val("");
    search_num.val("");
    search_inci.val("");
    search_sol.val("");
    search_esta.val("");
    search_tipo.val("");
    table.draw();
    e.preventDefault();
    reset = 0;
});