var models     = {};
var CSRF_TOKEN = $('#token').val();
var table      = $('#table_dir').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    pageLength: 100,
    order: [[0, "desc"]],
    ajax: {
        url: '/auth/get_inci',
        type: 'GET',
        data: function (data) {}
    },
    columns: [
        {data: 'id', name: 'id'},
        {data:null, name:'info',orderable: false, searchable: false},
        {data: 'incidencia', name: 'incidencia'},
        {data: 'empleado', name: 'empleado'},
        {data: 'proyecto', name: 'proyecto', className:'proyecto_p'},
        {data: 'solicitante', name: 'solicitante'},
        {data: 'vobo', name: 'vobo', className:'vobo_p'},
        {data: 'venta', name: 'venta',className:'venta_p'},
        {data: 'evidencia', name: 'evidencia',className:'venta_p'},
        {data: 'pedido', name: 'pedido', className:'pedido_p'},
        {data: 'monto', name: 'monto'},
        {data: 'fecha_inicio', name: 'fecha_inicio'},
        {data: 'duracion', name: 'duracion'},
        {data: 'fecha_solicitud', name: 'fecha_solicitud'},
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
            render: function (data, type, row) {
                var template = '';
                template = '<input id="'+row.id+'" type="checkbox" class="toggle_1" data-toggle="toggle" data-on="<i class=\'fa fa-check\'></i>" ' +
                    'data-off="<i class=\'fa fa-close\'></i>" data-onstyle ="success" data-offstyle="danger" data-size="small" checked="checked">';
                return template;
            }
        },
        {
            "targets": 6,
            "data": null,
            "className": "text-center",
            render: function (data,type,row) {
                var template = '';
                if (data != null)
                    template += '<a class="btn" href="/files/'+data+'"><i class="fa fa-download"></i></a>';
                return template;
            }
        },
        {
            "targets": 7,
            "data": null,
            "className": "text-center",
            render: function (data,type,row) {
                var template = '';
                if (row.tipo_incidencia == "DEDUCCION")
                    template = '<span class="text-primary">No aplica</span>';
                else {
                    if (data <= 0)
                        template = '<strong class="text-danger">'+data+'</strong>';
                    else
                        template = '<strong class="text-success">'+data+'</strong>';
                }
                return template;
            }
        },
        {
            "targets": 8,
            "data": null,
            "className": "text-center",
            render: function (data,type,row) {
                var template = '';
                if (data != null)
                    template += '<a class="btn" href="/files/'+data+'"><i class="fa fa-download"></i></a>';
                return template;
            }
        },
    ],
    drawCallback: function(settings) {
        $(function() {
            $('.toggle_1').bootstrapToggle();
        })
    }
});

function save() {
    var checks = $('#table_dir :input');
    var data = [];
    checks.each(function (key, value) {
        var input  = $(this);
        var value  = input.prop('checked');
        var id     = input.attr('id');
        var array = [id,value];
        data.push(array)
    });
    if (data.length == 0){
        swal({
            title: "No se ha seleccionado ninguna incidencia",
            type: 'warning'
        });
        return false;
    }
    Swal.fire({
        title: "¿Deseas enviar la validacion de estas incidencias?",
        text: "",
        type: "warning",
        showCancelButton: true
    }).then((ok) => {
        if (ok.value == true) {
            $.ajax({
                url: '/auth/validar_masivo',
                type: 'POST',
                dataType: 'JSON',
                data: {
                    _token: CSRF_TOKEN,
                    incidencias: data
                },
                beforeSend: function () {
                    $().loader("show");
                },
                complete: function () {
                    $().loader("hide");
                },
                success:function (data) {
                    if (data.ok == true) {
                        Swal.fire({
                            title: "Incidencias Actualizadas Correctamente",
                            text: "",
                            type: "success"
                        });
                    } else {
                        Swal.fire({
                            title: "Ocurrio un error",
                            text: data.data,
                            type: "error"
                        });
                    }
                    table.ajax.reload();
                }
            });
        }
        else console.log('No');
    });
}

if(inc_c_v != 1 && inc_s_v != 1){
    table.columns( '.venta_p' ).visible( false );
    table.columns( '.vobo_p' ).visible( false );
    table.columns( '.pedido_p' ).visible( false );
    table.columns( '.proyecto_p' ).visible( false );
}
