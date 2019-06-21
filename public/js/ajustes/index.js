var CSRF_TOKEN = $('#token').val();
var table = $('#table_ajustes').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    ajax: {
        url: '/datatables/get_data_ajustes',
        type: 'GET',
        dataType: 'JSON',
        data:function (data) {
        }
    },
    order: [[0, "desc"]],
    columns: [
        {data: 'id', name: 'id', className:'text-center'},
        {data: 'enviado', name: 'check', className:'text-center'},
        {data: 'url', name: 'url', className:'text-center'},
        {data: 'nombre', name: 'nombre', className:'text-center'},
        {data: 'num_empleado', name: 'tradicional', className:'text-center'},
        {data: 'tradicional', name: 'tradicional', className:'text-center'},
        {data: 'asimilado', name: 'asimilado', className:'text-center'},
        {data: 'observaciones', name: 'observaciones', className:'text-center'},
        {data: 'fecha', name: 'fecha', className:'text-center'},
        {data: null, name:'acciones', className:'text-center', orderable: false, searchable: false,}
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
                if (data == 'SI')
                    return "<input type='checkbox' disabled checked style='color:#007bffcc;font-size:20px'>";
                return "<input type='checkbox' class='selects' style='color:#007bffcc;font-size:20px'>";
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
            targets: 9,
            data: null,
            className: "text-center",
            render: function (data, type, row) {
                var del = '<a title="Eliminar Ajuste" class="btn btn-sm btn-danger text-white del_ajuste"><i class="fa fa-close"></i></a>';
                return del;
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

function saveAjuste() {
    var exist = existe('nuevo_ajus',['observaciones']);
    if (exist == false)
        return false;
    var data = {
        _token: CSRF_TOKEN,
        id: $('#id_emp').val(),
        tradicional: $('#tradicional').val(),
        asimilado: $('#asimilado').val(),
        observaciones: $('#observaciones').val(),
    };
    $.ajax({
        url: '/ajuste/save',
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