var envio = $('#envio').val();
var CSRF_TOKEN = $('#token').val();
var table_ = $('#Incidencias_Enviar-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    order: [[0, "desc"]],
    ajax: {
        url: '/autorizar/get_incidencias_finalizadas',
        type: 'GET',
        data: function (data) {
            data.tipo = envio
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