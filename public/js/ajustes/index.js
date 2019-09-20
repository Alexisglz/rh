var CSRF_TOKEN = $('#token').val();
var s_id       = null;
var s_nombre   = null;
var s_est      = null;
var reset      = 0;
var table      = $('#table_ajustes').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    ajax: {
        url: '/datatables/get_data_ajustes',
        type: 'GET',
        dataType: 'JSON',
        data:function (data) {
            data.search_id     = s_id;
            data.search_nombre = s_nombre;
            data.search_est    = s_est;
        }
    },
    order: [[0, "desc"]],
    pageLength: 100,
    columns: [
        {data: 'id', name: 'id', className:'text-center'},
        {data: 'estatus', name: 'estatus', className:'text-center envio_as'},
        {data: 'url', name: 'url', className:'text-center'},
        {data: 'nombre', name: 'nombre', className:'text-center'},
        {data: 'num_empleado', name: 'tradicional', className:'text-center'},
        {data: 'tradicional', name: 'tradicional', className:'text-center'},
        {data: 'asimilado', name: 'asimilado', className:'text-center'},
        {data: 'pedido', name: 'pedido', className:'text-center'},
        {data: 'monto', name: 'monto', className:'text-center'},
        {data: 'fecha_inicio', name: 'fecha_inicio', className:'text-center'},
        {data: 'observaciones', name: 'observaciones', className:'text-center'},
        {data: 'fecha', name: 'fecha', className:'text-center'},
        {data: null, name:'acciones', className:'text-center acciones_as', orderable: false, searchable: false,}
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
                var view = '';
                switch (data) {
                    case 'autorizado':
                        view = "<input type='checkbox' class='selects' style='color:#007bffcc;font-size:20px'>";
                        break;
                    case 'solicitado':
                        view = '<i title="Solicitud Pendiente de Autorizacion" class="fas fa-hourglass-half" style="color:#007bff;font-size:20px"></i>';
                        break;
                    case 'rechazado':
                    case 'cancelado':
                        view = '<i title="Solicitud Rechazada" class="fas fa-close" style="color:red;font-size:20px"></i>';
                        break;
                    case 'enviado':
                        view = '<i title="Solicitud Enviada" class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                        break;
                }
                return view;
            },
        },
        {
            targets: 2,
            data: null,
            className: "text-center",
            render: function (data, type, row) {
                if (data != null)
                    return '<a href="/files/'+data+'" title="Descargar"><i class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>';
                else
                    return '';
            }
        },
        {
            targets: 12,
            data: null,
            className: "text-center",
            render: function (data, type, row) {
                var del  = '';
                var edit = '';
                if (row.estatus != 'solicitado'){
                    edit = editar_ajustes_s == 1 ? '<button title="Editar Ajuste" disabled="disabled" class="btn btn-sm btn-primary text-white"><i class="fa fa-edit fa-sm"></i></button>':'';
                    del  = eliminar_ajuste_s == 1 ? '<button title="Eliminar Ajuste" disabled="disabled" class="btn btn-sm btn-danger text-white"><i class="fa fa-close"></i></button>':'';
                }
                else{
                    edit = editar_ajustes_s == 1 ? '<a title="Editar Ajuste" class="btn btn-sm btn-primary text-white edit_ajuste"><i class="fa fa-edit fa-sm"></i></a>':'';
                    del  = eliminar_ajuste_s == 1 ? '<a title="Eliminar Ajuste" class="btn btn-sm btn-danger text-white del_ajuste"><i class="fa fa-close"></i></a>':'';
                }
                return edit + del;
            }
        },
    ]
});

new $.fn.dataTable.FixedHeader(table);

$('#nuevo_ajuste').on('click',function () {
    $('#empleado').val('');
    $('#id_emp').val('');
    $('#tradicional').val(0);
    $('#asimilado').val(0);
    $('#observaciones').val('');
    $('#ro').val('');
    $('#id_risk').val('');
    $('#save_ajuste').modal('show');
});

$("#empleado").autocomplete({
    source: "/incidencias/get_empleados",
    minLength: 2,
    select: function(event, ui) {
        $('#empleado').val(ui.item.value);
        $('#id_emp').val(ui.item.id);
    }
});

var risk = $('#ro');

risk.on('keyup',function () {
    if ($('#id_emp').val() != ""){
        risk.autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '/incidencias/get_risk',
                    type: 'GET',
                    dataType: 'JSON',
                    data: {
                        term: request.term,
                        id: $('#id_emp').val()
                    },
                    success: function (data) {
                        response(data);
                    }
                });
            },
            minLength: 2,
            select: function(event, ui) {
                $('#id_risk').val(ui.item.id);
            }
        });
    }
    else{
        $(this).val("");
        Swal.fire({
            title: "Debe seleccionar un empleado",
            type: "warning"
        });
    }
});

$('#save_ajuste').on('hidden.bs.modal', function () {
    $(':input', this).val('');
    $('#tradicional').val(0);
    $('#asimilado').val(0);
});

function saveAjuste() {
    var exist = existe('nuevo_ajus',['observaciones','evidencia']);
    if (exist == false)
        return false;
    var DataInsert = new FormData();
    DataInsert.append('_token', CSRF_TOKEN);
    DataInsert.append('id', $('#id_emp').val());
    DataInsert.append('ro', $('#id_risk').val());
    DataInsert.append('tradicional', $('#tradicional').val());
    DataInsert.append('asimilado', $('#asimilado').val());
    DataInsert.append('observaciones', $('#observaciones').val());
    DataInsert.append('fecha', $('#fecha').val());
    var evidencia = $('#evidencia');
    var file = evidencia[0].files[0];
    if (file != null && file != undefined){
        DataInsert.append('evidencia',  file);
    }
    $.ajax({
        url: '/ajuste/save',
        type: 'POST',
        dataType: 'JSON',
        data: DataInsert,
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (data) {
            if (data.ok == true){
                swal("Solicitud de ajuste de sueldo generado con éxito", {
                    icon: "success",
                });
                table.ajax.reload();
                $('#save_ajuste').modal('toggle');
            }
            else {
                swal("Error!", "Ocurrio un error al actualizar la solicitud!", "error");
            }
        }
    });
}

$('#table_ajustes tbody').on('click', '.edit_ajuste', function () {
    data = table.row($(this).parent()).data();
    $('#e_empleado').val(data.nombre);
    $('#e_id_emp').val(data.id);
    $('#e_tradicional').val(data.tradicional);
    $('#e_asimilado').val(data.asimilado);
    $('#e_observaciones').val(data.observaciones);
    $('#edit_ajuste').modal('show');
});

function saveEdit(){
    var exist = existe('edit_ajus',['e_observaciones']);
    if (exist == false)
        return false;
    var data = {
        _token: CSRF_TOKEN,
        id: $('#e_id_emp').val(),
        tradicional: $('#e_tradicional').val(),
        asimilado: $('#e_asimilado').val(),
        observaciones: $('#e_observaciones').val(),
    };
    $.ajax({
        url: '/ajuste/edit',
        type: 'POST',
        dataType: 'JSON',
        data:data,
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function (data) {
            if (data.ok == true){
                swal("Solicitud de ajuste editada con éxito", {
                    icon: "success",
                });
                table.ajax.reload();
                $('#edit_ajuste').modal('toggle');
            }
            else {
                swal("Error!", "Ocurrio un error al actualizar la solicitud!", "error");
            }
        }
    });
}

$('#table_ajustes tbody').on('click', '.del_ajuste', function () {
    data = table.row($(this).parent()).data();
    swal({
        title: '¿Deseas eliminar el ajuste?',
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
                url: 'ajuste/delete',
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
                        swal("Solicitud de ajuste de Sueldo eliminado con éxito", {
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

var rows_selected = [];
$('#table_ajustes tbody').on('click', 'input[type="checkbox"]', function(e){
    var row = $(this).closest('tr');
    var data = table.row(row).data();
    var rowId = data.id;
    var index = $.inArray(rowId, rows_selected);
    if(this.checked && index === -1){
        rows_selected.push(rowId);
    }
    else rows_selected.splice(index, 1);

});

$('#marcar').on('click', function () {
    if ($(this).is( ":checked" ))
        $('.selects').each(function () {
            if (!$(this).is( ":checked" ))
                $(this).trigger('click');
        });
    else
        $('.selects').each(function () {
            if ($(this).is( ":checked" ))
                $(this).trigger('click');
        });
});

$('#enviar_ajustes').on('click', function () {
    if (rows_selected.length == 0){
        Swal.fire({
            title: "No se ha seleccionado ninguna solicitud",
            type: 'error'
        });
        return false;
    }
    swal({
        title: '¿Deseas enviar las solicitudes de ajuste de sueldo?',
        icon: 'warning',
        buttons: true,
        dangerMode: true
    }) .then((confirm) => {
        if (confirm){
            var object = {
                _token: CSRF_TOKEN,
                ajustes: rows_selected
            };
            $.ajax({
                url: 'ajuste/send',
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
                        swal("Solicitudes enviadas con éxito", {
                            icon: "success",
                        });
                        table.ajax.reload();
                    }
                    else {
                        swal("Error!", "Ocurrio un error al enviar los ajustes!", "error");
                    }
                }
            });
        }
    });
});

function ExcelAjustes() {
    var inicio  = ($('#exp_inicio').val() != null && $('#exp_inicio').val() != "") ? $('#exp_inicio').val():'';
    var fin     = ($('#exp_fin').val() != null && $('#exp_fin').val() != "") ? $('#exp_fin').val():'';
    var estatus = ($('#exp_estatus').val() != null && $('#exp_estatus').val() != "") ? $('#exp_estatus').val():'TODAS';
    var url = "/excel/export_ajustes/?inicio="+inicio+"&fin="+fin+"&estatus="+estatus;
    location.href =url;
}

var search_id     = $('#search_id');
var search_nombre = $('#search_emp');
var search_est    = $('#search_est');

search_id.on('keyup', function () {
    s_id = $(this).val();
    table.draw();
});
search_nombre.on('keyup', function () {
    s_nombre = $(this).val();
    table.draw();
});
search_est.on('change', function () {
    s_est = $(this).val();
    table.draw();
});

$('#reset').on('click', function (e) {
    reset    = 1;
    s_id     = null;
    s_nombre = null;
    s_est    = null;
    search_id.val("");
    search_nombre.val("");
    search_est.val("");
    table.draw();
    e.preventDefault();
    reset = 0;
});

if (enviar_ajuste_s != 1)
    table.columns( '.envio_as' ).visible( false );

if (eliminar_ajuste_s != 1 && editar_ajustes_s != 1)
    table.columns( '.acciones_as' ).visible( false );