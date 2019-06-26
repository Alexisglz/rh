var CSRF_TOKEN = $('#token').val();
var solicit    = $("#NombreUsuario").val();
var s_id       = $('#search_id').val();
var s_nombre   = null;
var s_tipo     = null;
var table      = $('#incidencias-table').DataTable({
    processing: true,
    serverSide: true,
    order: [[0, "desc"]],
    responsive: true,
    ajax: {
        url: '/datatables/get_incidencias/',
        type: 'GET',
        data: function (data) {
            data.search_id     = s_id;
            data.search_nombre = s_nombre;
            data.search_tipo   = s_tipo;
        }
    },
    columns: [
        {data: 'id', name: 'id'},
        {},
        {data: 'vobo', name: 'vobo'},
        {data: 'empleado', name: 'empleado'},
        {data: 'incidencia', name: 'incidencia'},
        {data: 'tipo_incidencia', name: 'tipo_incidencia'},
        {data: 'fecha_solicitud', name: 'fecha_solicitud'},
        {data: 'fecha_inicio', name: 'fecha_inicio'},
        {data: 'duracion', name: 'duracion'},
        {data: 'monto', name: 'monto'},
        {data: 'pedido', name: 'pedido'},
        {data: 'solicitante', name: 'solicitante'},
        {data: 'motivo', name: 'motivo'},
        {data: 'id_lote', name: 'id_lote'},
        {data: null, name: 'acciones'}
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
        {
            "targets": 14,
            "data": null,
            "render": function (data, type, row) {
                var del  = '';
                var edit = '';
                if (row.estatus != null){
                    edit = /*editar_ajustes_s*/ 1 == 1 ? '<button title="Editar Incidencia" disabled="disabled" class="btn btn-sm btn-primary text-white"><i class="fa fa-edit fa-sm"></i></button>':'';
                    del  = /*eliminar_ajuste_s*/ 1 == 1 ? '<button title="Eliminar Incidencia" disabled="disabled" class="btn btn-sm btn-danger text-white"><i class="fa fa-close"></i></button>':'';
                }
                else{
                    edit = /*editar_ajustes_s*/ 1 == 1 ? '<a title="Editar Incidencia" class="btn btn-sm btn-primary text-white edit_incidencia"><i class="fa fa-edit fa-sm"></i></a>':'';
                    del  = /*eliminar_ajuste_s*/ 1 == 1 ? '<a title="Eliminar Incidencia" class="btn btn-sm btn-danger text-white del_incidencia"><i class="fa fa-close"></i></a>':'';
                }
                return edit + del;
            }
        }
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

$('#editar_envio').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});

var data;
$('#incidencias-table tbody').on('click', '.edit_incidencia', function () {
    data = table.row($(this).parent()).data();
    $('#id_inc').val(data.id);
    $('#empleado_id').val(data.emp_id);
    $('#empleado').val(data.empleado);
    $('#monto').val(data.monto).css('border','1px solid #ced4da');
    $('#incidencia').val(data.incidencia);
    $('#incidencia_id').val(data.id_tipo);
    $('#tratamiento').val(data.tratamiento);
    $('#motivo').val(data.motivo);
    $('#fecha').val(data.fecha_inicio).css('border','1px solid #ced4da');
    $('#dias').val(data.duracion).css('border','1px solid #ced4da');
    $('#editar_envio').modal('show');
});

function enviarIncidencia() {
    var tratamiento = $('#tratamiento').val();
    var monto       =  $('#monto').val();
    var fecha       =  $('#fecha').val();
    var dias        =  $('#dias').val();
    var motivo      =  $('#motivo').val();
    var array       = [];
    if ((dias%1)!==0){
        swal("Atención", "Los dias deben ser completos", "error");
        return false;
    }
    var object = {
        _token: CSRF_TOKEN,
        id: $('#id_inc').val(),
        tratamiento: tratamiento,
        motivo: motivo
    };
    switch (tratamiento) {
        case 'MONTO':
            if (monto <= 0) {
                swal("Atención", "El monto debe ser mayor a 0", "error");
                return false;
            }
            object.monto = monto;
            array.push('fecha','dias');
            break;
        case 'LAPSO':
            if (dias <= 0) {
                swal("Atención", "Los dias deben ser mayor a 0", "error");
                return false;
            }
            object.fecha = fecha;
            object.dias  = dias;
            array.push('monto');
            break;
        case 'DIAS':
            if (dias <= 0) {
                swal("Atención", "Los dias deben ser mayor a 0", "error");
                return false;
            }
            array.push('fecha','monto');
            object.dias  = dias;
            break;
    }
    var validador = existe('valida',array);
    if (validador == false)
        return false;
    $.ajax({
        url: '/envio_incidencias/editar',
        type: 'POST',
        dataType: 'JSON',
        data: object,
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function(data){
            if(data.ok == true){
                Swal.fire({
                    title: 'Se actualizo la incidencia correctamente',
                    type: 'success'
                });
                $('#editar_envio').modal('toggle');
                table.ajax.reload();
            }
            else
                Swal.fire({
                    title: 'Ocurrio un error',
                    type: 'error'
                });
        }
    });
}

$('#incidencias-table tbody').on('click', '.del_incidencia', function () {
    data = table.row($(this).parent()).data();
    swal({
        title: '¿Deseas eliminar la incidencia?',
        icon: 'warning',
        buttons: true,
        dangerMode: true
    }) .then((confirm) => {
        if (confirm) {
            var object = {
                _token: CSRF_TOKEN,
                id: data.id
            };
            $.ajax({
                url: 'incidencias/delete',
                type: 'POST',
                dataType: 'JSON',
                data: object,
                beforeSend: function () {
                    $().loader("show");
                },
                complete: function () {
                    $().loader("hide");
                },
                success: function (data) {
                    if (data.ok == true){
                        swal("Incidencia eliminada con éxito", {
                            icon: "success",
                        });
                        table.ajax.reload();
                    }
                    else {
                        swal("Error!", "Ocurrio un error al eliminar el ajuste!", "error");
                    }
                }
            });
        }
    });
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

var search_id     = $('#search_id');
var search_nombre = $('#search_nombre');
var search_tipo   = $('#search_tipo');

search_id.on('keyup', function () {
    s_id = $(this).val();
    table.draw();
});
search_nombre.on('keyup', function () {
    s_nombre = $(this).val();
    table.draw();
});
search_tipo.on('change', function () {
    s_tipo = $(this).val();
    table.draw();
});

$('#reset').on('click', function (e) {
    if (id_post != 0)
        window.location = '/incidencias';
    reset    = 1;
    s_id     = null;
    s_nombre = null;
    s_tipo   = null;
    search_id.val("");
    search_nombre.val("");
    search_tipo.val("");
    table.draw();
    e.preventDefault();
    reset = 0;
});