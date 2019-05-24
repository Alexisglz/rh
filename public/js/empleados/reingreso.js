function GetDatos() {
    var Valors = {};
    // Get all the inputs into an array...
    var $inputs = $('#ReingresoDiv :input');
    //  // An array of just the ids...
    //  var ids = {};
    //  ids[$(this).attr('name')] = $(this).attr('id');
    //  console.log(ids);
    $inputs.each(function (index) {
        Valors[$(this).attr('id')] = $(this).val();
    });
    return Valors;
}



function VerIds() {
    console.log(GetDatos());
}

var ValorBuscar = "";
$("#rnss").keyup(function (e) {
    // alert(e.which);
    GetExistente($(this).val())
});

$("#rrfc").keyup(function (e) {
    GetExistente($(this).val())
});

$("#curp").keyup(function (e) {
    GetExistente($(this).val());
});


function GetExistente(id) {
    ValorBuscar = id;
    $.get("/obtener_empleado/" + id, function (data) {
        if (data['recordsTotal'] == 0) {
            $("#collapseOne").collapse('hide');
        }
        else {
            $("#collapseOne").collapse('show');

        }
    }
    )
}


$('#collapseOne').on('show.bs.collapse', function () {
    $('#EmpleadoEncontrado-table').DataTable({
        processing: true,
        serverSide: true,
        paging: false,
        searching: false,
        ajax: '/getEmpleadosCriterio/' + ValorBuscar,
        columns: [

            { data: 'empleado_nombre', name: 'empleado_nombre' },
            { data: 'empleado_apaterno', name: 'empleado_apaterno' },
            { data: 'empleado_amaterno', name: 'empleado_amaterno' },
            { data: 'nss', name: 'fecha_inicio' },
            { data: 'curp', name: 'fecha_fin' },
            { data: 'rfc', name: 'duracion' },
            { data: 'id', name: 'id' },
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
            }
        },
        'columnDefs': [
            {
                "targets": 6,
                "data": null,
                "render": function (data, type, row) {
                    return "<input type='button' value='Selecionar' onclick='selectEmpleado(" + data + ");'  class='btn btn-link'></input>"
                }
            }],
    });
});

$('#collapseOne').on('hide.bs.collapse', function () {
    $("#EmpleadoEncontrado-table").dataTable().fnDestroy();
});


function selectEmpleado(Valor) {
    valores = {
        id: Valor
    };
    $.post("/api/getEmpleadoBaja", valores,
        function (data) {

            if (data == undefined || data == "") {
                swal("Error interno!", {
                    icon: "error"
                })
            }
            else {
                document.getElementById("rnombre").value = data['empleado_nombre'];
                document.getElementById("rapaterno").value = data['empleado_apaterno'];
                document.getElementById("ramaterno").value = data['empleado_amaterno'];
                document.getElementById("rcalle").value = data['calle'];
                document.getElementById("rno_exterior").value = data['num_exterior'];
                document.getElementById("no_interior").value = data['num_interior'];
                document.getElementById("rcolonia").value = data['colonia'];
                document.getElementById("rmunicipio").value = data['municipio'];
                document.getElementById("rcp").value = data['cp'];
                document.getElementById("estado").value = data['estado'];
                document.getElementById("rnss").value = data['nss'];
                document.getElementById("rrfc").value = data['rfc'];
                document.getElementById("curp").value = data['curp'];
                document.getElementById("rid").value = data['id'];
                document.getElementById("rsolicitud").value = data['id_solicitud'];
            }
            $("#collapseOne").collapse('hide');
        });
}

function guardar() {
    var Datos = {};
    var $inputs = $('#ReingresoDiv :input');
    $inputs.each(function (index) {
        Datos[$(this).attr('id')] = $(this).val();
    });
    var validaDatos = {};
    var count=0;
    for (i in Datos) {
        if ($("#" + i).val() == "") {
            validaDatos[i] = $("#" + i).val();
            count=count+1;
        }
    }

    if (count==0) {
        if (Datos.rid == "" || Datos.rid == "") {
            swal("No se ha selecionado un empledo de la lista de bajas", {
                icon: "error",
            });
            return false;
        }
        else {
            swal({
                title: "Alta de empleado",
                text: "¿Desea Guardar un empleado nuevo?",
                icon: "warning",
                buttons: true,
                dangerMode: true
            })
                .then((res) => {
                    if (res) {
                        $.post("/api/ReingresarEmpleado", Datos,
                            function (data) {
                                swal("Empleado se ha creado con éxito", {
                                    icon: "success",
                                }).then((value) => {
                                    location.href = "/empleados"
                                })
                            });
                    }
                });
        }

    }
    else {
        swal("Todos los campos son requeridos", {
            icon: "error",
        })
    }
}













