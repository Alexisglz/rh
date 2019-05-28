var solicit = $("#NombreUsuario").val();
var table = $('#incidencias-table').DataTable({
    processing: true,
    serverSide: true,
    order: [[0, "desc"]],
    responsive: true,
    ajax: '/datatables/get_incidencias/',
    columns: [
        {data: 'id', name: 'id'},
        {},
        {data: 'vobo', name: 'vobo'},
        {data: 'empleado', name: 'empleado'},
        {data: 'tipo_incidencia', name: 'tipo_incidencia'},
        {data: 'fecha_solicitud', name: 'fecha_solicitud'},
        {data: 'fecha_inicio', name: 'fecha_inicio'},
        {data: 'duracion', name: 'duracion'},
        {data: 'monto', name: 'monto'},
        {data: 'pedido', name: 'pedido'},
        {data: 'solicitante', name: 'solicitante'},
        {data: 'motivo', name: 'motivo'},
        {data: 'id_lote', name: 'id_lote'},
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
            "targets": 1,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Informacion' class='info btn btn-xs btn-info iconBitacora'><i class='fa fa-book nav-icon'></i></button>",

        },

        {
            "targets": 2, // your case first column
            "data": null,
            "className": "text-center",
            "render": function (data, type, row) {
                if (data != null)
                    return '<a href="/files/'+data+'" title="Descargar"><i class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>';
                else
                    return '';
            }

        },

    ],
});

var data;
$('#incidencias-table tbody').on('click', '.btn', function () {
    data = table.row($(this).parent()).data();
});
$('#incidencias-table tbody').on('click', '.info', function () {
    data = table.row($(this).parent()).data();
    MostrarBitacora(data);


});


function MostrarBitacora(data) {
    var html = '<div class="card-body"><table class="table table-active" style="font-size:12px"id="BITACORAS"><thead><tr><th>CLAVE</th><th>USUARIO</th><th>EMPLEADO</th><th>DETALLES</th><th>FECHA</th><th>HORA</th><th>AUTORIZACION</th></tr></thead></table></div>';
    $('#datosss').append(html);
    $('#ModalBitacoras').modal('show');
    var button = $(event.relatedTarget);
    var tipo = button.data('tipo');
    var modal = $('#ModalBitacoras');
    var cuerpo = modal.find('.modal-body');
    var pie = modal.find('.modal-footer');
    modal.find('.modal-title').text(tipo);

    var tabla = $('#BITACORAS');
    var id_inci = data['id'];
    tabla.DataTable({
        processing: true,
        serverSide: true,
        responsive: true,
        ajax: {
            url: '/autorizar/get_bitacora_incidentes',
            type: 'GET',
            data: function (data) {
                data.id = id_inci;
                data.tipo = "incidencia"
            }
        },
        columns: [
            {data: 'CLAVE', name: 'CLAVE'},
            {data: 'USUARIO', name: 'USUARIO'},
            {data: 'EMPLEADO', name: 'EMPLEADO'},
            {data: 'DETALLES', name: 'DETALLES'},
            {data: 'FECHA', name: 'FECHA'},
            {data: 'HORA', name: 'HORA'},
            {data: 'ESTADO', name: 'ESTADO'},
        ]
    });
    cuerpo.append(tabla);
}

function DestruirMOdal() {
    var modal = $('#ModalBitacoras');
    var cuerpo = modal.find('.modal-body');
    cuerpo.children().remove();
    $('#ModalBitacoras').modal('hide');
}

function ExcelIncidencias() {
    swal({
        title: "Incidencias",
        text: "Desea descargar todas las incidencias?",
        icon: "warning",
        buttons: true,
        dangerMode: true
    })
        .then((willDelete) => {

            if (willDelete) {
                location.href = "/excel/export_incidencias/";
            }
        });


}

new $.fn.dataTable.FixedHeader(table);
  