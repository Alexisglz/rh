var envio = $('#envio').val();
var CSRF_TOKEN = $('#token').val();
var table_ = $('#envio_lote').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    pageLength: 50,
    order: [[0, "desc"]],
    ajax: {
        url: '/datatables/get_incidencias_periodo',
        type: 'GET',
        data: function (data) {
            data.tipo = envio
        },
    },
    dom: '<"top"f>rt<"bottom"lpi><"clear">',
    columns: [
        {data: 'id', name: 'id'},
        {valor: {data: 'id_lote', data: 'id'}, name: 'id_lote',orderable: false, searchable: false},
        {data:null, name:'editar',orderable: false, searchable: false},
        {data: 'empleado', name: 'empleado'},
        {data: 'emp_id', name: 'emp_id'},
        {data: 'incidencia', name: 'incidencia'},
        {data: 'tipo_incidencia', name: 'tipo_incidencia'},
        {data: 'solicitante', name: 'solicitante'},
        {data: 'monto', name: 'monto'},
        {data: 'duracion', name: 'duracion'},
        {data: 'fecha_solicitud', name: 'fecha_solicitud'},
        {data: 'fecha_inicio', name: 'fecha_inicio'},
        {data: 'motivo', name: 'motivo'},
    ],
    language: {
        "lengthMenu": "Ver _MENU_ registros por página",
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
                return "<input type='checkbox' class='selects' style='color:#007bffcc;font-size:20px'>";
                /*if (data['id_lote'] != null && data['id_lote'] != undefined) {
                    return '<i class="fas fa-check-circle" style="color:#007bffcc;font-size:20px"></i>';
                } else {
                    if (row.tipo_incidencia == 'PERCEPCION' && (row.venta == 0 || row.venta == null))
                        if (row.vobo_final == null)
                            return '<i class="fas fa-ban" style="color:orange;font-size:20px"></i>';
                        else
                            return "<input type='checkbox' class='selects' style='color:#007bffcc;font-size:20px'>";
                    else
                        return "<input type='checkbox' class='selects' style='color:#007bffcc;font-size:20px'>";
                }*/
            },
        },
        {
            "targets": 2,
            "data": null,
            "render": function (data, type, row) {
                return "<a class='editar_inci btn btn-md' style='color:#007bffcc;'><i class='fa fa-edit'></i></a>";
            }
        }
        /*{
            "targets": 2,
            "data": null,
            "render": function (data, type, row) {
                var view = '';
                if (data['id_lote'] != null && data['id_lote'] != undefined)
                    view = '';
                else {
                    if(row.tipo_incidencia == 'PERCEPCION' && (row.venta == 0 || row.venta == null)){
                        if(row.vobo_final == null)
                            view = '<i class="fa fa-upload" style="color:#007bffcc;font-size:20px;cursor: pointer"></i>';
                        else
                            view = '<a href="/files/'+row.vobo_final+'" title="Descargar"><i class="fa fa-download" style="color:limegreen;font-size:20px"></i></a>';
                    }
                }
                return view;
            }
        },*/
    ],
});

var upload_data = null;
table_.on('click', '.fa-upload', function () {
    upload_data = table_.row($(this).parent()).data();
    $('#vobo').modal('show');
});

$('#editar_envio').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});

var data;
$('#envio_lote tbody').on('click', '.editar_inci', function () {
    data = table_.row($(this).parent()).data();
    $('#id_inc').val(data.id);
    $('#empleado_id').val(data.emp_id);
    $('#empleado').val(data.empleado);
    $('#monto').val(data.monto).css('border','1px solid #ced4da');
    $('#incidencia').val(data.incidencia);
    $('#incidencia_id').val(data.id_tipo);
    $('#tratamiento').val(data.tratamiento);
    $('#fecha').val(data.fecha_inicio).css('border','1px solid #ced4da');
    $('#dias').val(data.duracion).css('border','1px solid #ced4da');
    $('#editar_envio').modal('show');
});

function enviarIncidencia() {
    var tratamiento = $('#tratamiento').val();
    var monto =  $('#monto').val();
    var fecha =  $('#fecha').val();
    var dias  =  $('#dias').val();
    var array = [];
    if ((dias%1)!==0){
        swal("Atención", "Los dias deben ser completos", "error");
        return false;
    }
    var object = {
        _token: CSRF_TOKEN,
        id: $('#id_inc').val(),
        tratamiento: tratamiento
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
                table_.ajax.reload();
            }
            else
                Swal.fire({
                    title: 'Ocurrio un error',
                    type: 'error'
                });
        }
    });
    console.log(object);
}

function subirVobo(){
    var vobo = $('#vobo_final');
    var file = vobo[0].files[0];
    if (file == null || file == undefined){
        swal("Atención", "El V.o B.o es obligatorio", "error");
        return false;
    }
    var data = new FormData();
    data.append('_token', CSRF_TOKEN);
    data.append('id', upload_data.id);
    data.append('vobo_final', file);
    $.ajax({
        url: '/autorizar/vobo_final',
        data:data,
        cache: false,
        contentType: false,
        processData: false,
        method: 'POST',
        type: 'POST',
        beforeSend: function () {
            $().loader("show");
        },
        complete: function () {
            $().loader("hide");
        },
        success: function(data){
            if (data.ok == true){
                swal("Atención", "El V.o B.o se subio correctamente", "success");
                $('#vobo').modal('toggle');
                table_.ajax.reload();
            }
            else
                swal("Atención", "Ocurrio un error al subir el Vo.Bo.", "error");
        }
    });
}


let arregloids2 = [];

function validaBoton() {

    var dataIncidencia = {
        concepto: 206,  //CAMBIA
        empleado: 2638, //CAMBIA
        importe: 100, //CAMBIA
        turno: '',
        fecha: '',
        vt1: '',
        vt2: '',
        vt3: '',
        vt4: '',
        zona: 29,
        area: '',
        centro: '',
        linea: '',
        factor: '',
        puesto: '',
        gral_cpto: '',
        cia: 677,
        proceso: "065", // Siempre es el mismo
        lote: 'Lote2',  //OPCIONAL LO QUE SEA
    };
    dataWSDL = {
        usuario: 'rhindeplo1',
        password: 'Password02',
        incidencia: dataIncidencia,
    };

    $.post("/api/EnvioIncidencias", dataWSDL, function (data) {

    });
}


function ciclo(idIncidencia, idEmpleado, monto, motivo) {
    $.getJSON("http://webwsdl.superhouse.mx/IndeploWS.php",
        {
            'concepto': idIncidencia,
            'empleado': idEmpleado,
            'importe': monto,
        },
        function (data) {
        });
}

let nombrelote = '';

function validaArreglo(id,cia, empleado, monto, motivo, fecha, vt1) {
    let arregloids = {};
    arregloids.id = id;
    arregloids.concepto = motivo;
    arregloids.empleado = empleado; //empleado;  ------- se cambia para efectos de pruebas ya que manda ERR. Error en incidencia 1 : El empleado 6
    //no existe en esta compañía, ni como alta, ni como baja. . Error en incidencia 2 : El empleado 2 no existe en esta compañía, ni como alta, ni como baja. .
    arregloids.importe = monto==null?"":monto;
    arregloids.turno = '';
    arregloids.fecha = fecha==null?"":fecha;//fecha;
    arregloids.vt1 = vt1==null?"":vt1;
    arregloids.vt2 = '';
    arregloids.vt3 = '';
    arregloids.vt4 = '';
    arregloids.zona = '29';
    arregloids.area = '';
    arregloids.centro = '';
    arregloids.linea = '';
    arregloids.factor = '';
    arregloids.puesto = '';
    arregloids.gral_cpto = '';
    arregloids.cia = '677';//cia;
    arregloids.proceso = '065';
    arregloids.lote = nombrelote;
    arregloids2.push(arregloids);
    return arregloids2;
}
var rows_selected = [];
$('#envio_lote tbody').on('click', 'input[type="checkbox"]', function(e){
    var $row = $(this).closest('tr');
    var data = table_.row($row).data();
    var rowId = data;
    var index = $.inArray(rowId, rows_selected);
    if(this.checked && index === -1){
        rows_selected.push(rowId);
    }
    else rows_selected.splice(index, 1);
});

function EjecutarLote() {
    if (rows_selected.length == 0){
        swal({
            title: "No se ha seleccionado ninguna incidencia",
            type: 'warning'
            });
        return false;
    }
    swal({
            title: "Desea crear nuevo lote de incidencias?",
            text: "Todos los datos selecionados en la tabla se almacenaran con un nuevo lote...",
            type: "input",
            showCancelButton: true,
            closeOnConfirm: false,
            inputPlaceholder: "Escribir el nombre del nuevo lote"
        },
        function (inputValue) {
            if (inputValue === false)
                return false;
            if (inputValue === "") {
                swal.showInputError("se requiere un nombre...");
                return false
            }
            nombrelote = inputValue;
            arregloids2 = [];
            let datas = [];
            for (i in rows_selected){
                var item = rows_selected[i];
                datas = validaArreglo(item.id, item.capital_id, item.emp_id, item.monto, item.id_tipo, item.fecha_inicio,item.duracion);
            }
            if (datas.length == 0) {
                console.log('no hay datos seleccionados');
            } else {
                let dataWSDL = {
                    _token: CSRF_TOKEN,
                    usuario: 'rhindeplo1',
                    password: 'Password05',
                    incidencia: datas,
                };

                console.log(dataWSDL);
                $.ajax({
                    url: '/envio_incidencias/insert_lote',
                    type: 'POST',
                    dataType: 'JSON',
                    data: dataWSDL,
                    beforeSend: function () {
                        $().loader("show");
                    },
                    complete: function () {
                        $().loader("hide");
                    },
                    success:function (data) {
                        if (data.ok == false) {
                            swal("Error", data.data, "error")
                        } else {
                            swal({
                                    title: "Incidencias",
                                    text: data.data,
                                    type: "success",
                                    confirmButtonClass: "btn-success",
                                    confirmButtonText: "Ok",
                                    closeOnConfirm: true,
                                    closeOnCancel: false
                                },
                                function (isConfirm) {
                                    if (isConfirm) {
                                        table_.ajax.reload();
                                    }
                                });
                        }
                    }
                });
            }
        });
}

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