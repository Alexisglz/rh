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
        url: '/datatables/get_vali_ajustes',
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
        {data: 'estatus', name: 'check', className:'text-center validar_as'},
        {data: 'nombre', name: 'nombre', className:'text-center'},
        {data: 'num_empleado', name: 'tradicional', className:'text-center'},
        {data: 'tradicional', name: 'tradicional', className:'text-center'},
        {data: 'asimilado', name: 'asimilado', className:'text-center'},
        {data: 'fecha_inicio', name: 'fecha_inicio', className:'text-center'},
        {data: 'observaciones', name: 'observaciones', className:'text-center'},
        {data: 'fecha', name: 'fecha', className:'text-center'},
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
                if (row.estatus == 'cancelado') {
                    return '<i class="fas fa-close" style="color:red;font-size:20px"></i>';
                }
                if (row.estatus == 'enviado') {
                    return '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                }
                else {
                    if (validar == 1){
                        view += "<button class='auth_ajuste btn btn-xs btn-success iconAutorizar'><i class='fa fa-thumbs-up nav-icon'></i></button>";
                        view += "<button class='cancel_ajuste btn btn-xs btn-danger btnDeshautorizar'><i class='fa fa-thumbs-down nav-icon'></i></button>";
                    }
                    else
                        view = '<i class="fas fa-ban" style="color:orange;font-size:20px"></i>';
                }
                return view;
            },
        }
    ]
});

new $.fn.dataTable.FixedHeader(table);

var data;

$('#table_ajustes tbody').on('click', '.auth_ajuste', function () {
    data = table.row($(this).parent()).data();
    alertAccion(data, 'deduc', 'autorizar');
});

$('#table_ajustes tbody').on('click', '.cancel_ajuste', function () {
    data = table.row($(this).parent()).data();
    alertAccion(data, 'deduc', 'cancelar');
});

function alertAccion(data, tipo, accion){
    Swal.fire({
        title: "¿DESEA "+accion.toUpperCase()+" ESTE AJUSTE DE SUELDO?",
        text: "",
        type: "warning",
        showCancelButton: true
    }).then((willDelete) => {
        if (willDelete.value == true){
            var datosRe = {
                _token: CSRF_TOKEN,
                id: data.id,
                recurso: data['empleado'],
                tipo: tipo,
                accion: accion
            };
            $.ajax({
                url: '/ajuste/validar_ajuste',
                type: 'POST',
                dataType: 'JSON',
                data: datosRe,
                beforeSend: function () {
                    $().loader("show");
                },
                complete: function () {
                    $().loader("hide");
                },
                success: function (data) {
                    if (data.ok == true)
                        Swal.fire({
                            title: "Incidencia Actualizada Correctamente",
                            text: "",
                            type: "success"
                        });
                    else
                        Swal.fire({
                            title: "Ocurrio un error",
                            text: "",
                            type: "error"
                        });
                    table.ajax.reload();
                }
            });
        }
    });
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

if (validar != 1)
    table.columns( '.validar_as' ).visible( false );