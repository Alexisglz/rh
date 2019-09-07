var solicit    = $("#NombreUsuario").val();
var CSRF_TOKEN = $('#token').val();
var reset      = 0;
var s_id       = $('#search_id').val();
var s_emp      = null;
var table      = $('#incidencias-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    pageLength: 100,
    order: [[0, "desc"]],
    ajax: {
        url: '/datatables/get_incidencias_gerente',
        type: 'GET',
        data: function (data) {
            data.reset = reset;
            data.id    = s_id;
            data.emp   = s_emp;
        }
    },
    columns: [
        {data: 'id', name: 'id'},
        {data:null, name:'info',orderable: false, searchable: false},
        //{data:null, name:'bitacora',orderable: false, searchable: false},
        {data: null, name: 'Autorizado',orderable: false, searchable: false, className:'auth_inc'},
        {data: 'empleado', name: 'empleado'},
        {data: 'incidencia', name: 'incidencia'},
        {data: 'solicitante', name: 'solicitante'},
        {data: 'evidencia', name:'evidencia',orderable: false, searchable: false},
        {data: null, name:'venta',orderable: false, searchable: false},
        {data: 'pedido', name: 'pedido'},
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
            "defaultContent": "<button data-tipo='Informacion' class='info btn btn-xs btn-success iconInfo' data-toggle='modal' data-target='#Modal'><i class='fa fa-info nav-icon'></i></button>",
        },
        /*{
            "targets": 2,
            "data": null,
            "className": "text-center",
            "defaultContent": "<button data-tipo='Bitacora' class='bitacora btn btn-xs btn-info iconBitacora'><i class='fa fa-book nav-icon'></i></button>",
        },*/
        {
            "targets": 2, // your case first column
            "data": null,
            "render": function (data, type, row) {
                var view = '';
                if (row.estatus == 'CANCELAR') {
                    return '<i class="fas fa-close" style="color:red;font-size:20px"></i>';
                }
                if (row.estatus == 'POR ENVIAR' || row.estatus == 'ENVIADO') {
                    return '<i class="fas fa-check-circle" style="color:limegreen;font-size:20px"></i>';
                }
                else {
                    if (auth_cancel == 1){
                        view += "<button class='auth btn btn-xs btn-success iconAutorizar'><i class='fa fa-thumbs-up nav-icon'></i></button>";
                        view += "<button class='cancel btn btn-xs btn-danger btnDeshautorizar'><i class='fa fa-thumbs-down nav-icon'></i></button>";
                    }
                    else
                        view = '<i class="fas fa-ban" style="color:orange;font-size:20px"></i>';
                }
                return view;
            },
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
            "render": function (data, type, row) {
                var view = '';
                if (row.tipo_incidencia == "DEDUCCION"){
                    view = '<span>No aplica</span>';
                }
                else {
                    if (row.venta == null || row.venta == 0)
                        view = '<span style="color: red">0</span>';
                    else
                        view = '<span style="color: #007bff">'+row.venta+'</span>';
                }
                return view;
            }
        },
    ],
});
new $.fn.dataTable.FixedHeader(table);
var data;

$('#incidencias-table tbody').on('click', '.info', function () {
    data = table.row($(this).parent()).data();
});

$('#incidencias-table tbody').on('click', '.auth', function () {
    data = table.row($(this).parent()).data();
    alertAccion(data, 'autorizar');
});

$('#incidencias-table tbody').on('click', '.cancel', function () {
    data = table.row($(this).parent()).data();
    alertAccion(data, 'cancelar');
});

function alertAccion(data, accion){
    Swal.fire({
        title: "¿DESEA AUTORIZAR ESTA INCIDENCIA?",
        text: "",
        type: "warning",
        showCancelButton: true
    }).then((willDelete) => {
        if (willDelete.value == true){
            var datosRe = {
                _token: CSRF_TOKEN,
                id: data.id,
                accion: accion
            };
            $.ajax({
                url: '/autorizar/auth_incidencia',
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

$('#incidencias-table tbody').on('click', '.bitacora', function () {
    data = table.row($(this).parent()).data();
    MostrarBitacora(data)
});

$('#Modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var tipo = button.data('tipo');
    var modal = $(this);
    var cuerpo = modal.find('.modal-body');
    var pie = modal.find('.modal-footer');
    modal.find('.modal-title').text(tipo);
    if (tipo == 'Informacion') {
        var tabla = $('<table>').addClass('table table-bordered');

        for (var k in data) {
            var ocultas = [];
            switch (data['tipo_incidencia']) {
                case 'Faltas':
                    ocultas = ['solicitante', 'monto', 'fecha_fin'];
                    break;
                case 'Bono Fijo Div':
                    ocultas = ['solicitante', 'fecha_fin', 'fecha_inicio', 'duracion'];
                    break;
                case 'vacaciones':
                    ocultas = ['solicitante', 'monto', 'duracion'];
                    break;
            }
            ocultas.push('id');
            if (ocultas.indexOf(k) >= 0) {
                continue
            }
            var tr     = document.createElement("tr");
            var nombre = document.createElement("td");
            var dato   = document.createElement("td");
            if (k == 'vobo'){
                var value = data[k];
                if (value != null){
                    dato.innerHTML   = '<a href="/files/'+value+'" title="Descargar"><i class="fa fa-download" style="color:#007bffcc;font-size:20px"></i></a>';
                }
                else
                    dato.innerHTML = '';
            }
            else{
                dato.innerHTML = data[k];
            }
            var str = k.toUpperCase();
            nombre.innerHTML = str.replace("_"," ");
            tr.append(nombre);
            tr.append(dato);
            tabla.append(tr);
        }
        cuerpo.append(tabla);
    }
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
    var id_inci = data.id;
    var VariableConcat = data['id'] + '-' + "'auth_incidencia'";
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


$('#Modal').on('hidden.bs.modal', function (event) {
    var modal = $(this);
    var cuerpo = modal.find('.modal-body');
    var pie = modal.find('.modal-footer');
    cuerpo.children().remove();
    pie.children('.btn2').remove();
});

if (auth_cancel != 1)
    table.columns( '.auth_inc' ).visible( false );

var search_id  = $('#search_id');
var search_emp = $('#search_emp');

search_id.on('keyup', function () {
    s_id = $(this).val();
    table.draw();
});
search_emp.on('keyup', function () {
    s_emp = $(this).val();
    table.draw();
});

$('#reset').on('click', function (e) {
    if (id_post != 0)
        window.location = '/autorizar';
    reset    = 1;
    s_id     = null;
    s_emp    = null;
    search_id.val("");
    search_emp.val("");
    table.draw();
    e.preventDefault();
    reset = 0;
});