/*
    Mod: JL Script para la vista usuarios
    1) Manda a plasmar la tabla de usuarios
    2) Editar usuario, (sin terminar)
    3) Eliminar usuario (sin terminar)
*/

var usuariosCheck    = $('#usuariosCheck');
var SolicitudesCheck = $('#SolicitudesCheck');
var EmpleadosCheck   = $('#EmpleadosCheck');
var IncidenciasCheck = $('#IncidenciasCheck');
var uscrear          = $('#uscrear');
var usedit           = $('#usedit');
var useliminar       = $('#useliminar');
var SolAlta          = $('#SolAlta');
var SolCrear         = $('#SolCrear');
var SolBaja          = $('#SolBaja');
var EmpActualizar    = $('#EmpleadoActualizar');
var EmpleadoBaja     = $('#EmpleadoBaja');
var InciCrear        = $('#InciCrear');
var inciAuth         = $('#inciAuth');
var inciLote         = $('#inciLote');
var id_noti          = $('#id_noti');
var table2           = null;

$(document).ready(function () {

    function fecha() {
        var fecha = new Date();
        var date = fecha.getFullYear() + '-' + (fecha.getMonth() + 1) + '-' + fecha.getDate() + ' ' + fecha.getHours() + ':' + fecha.getMinutes() + ':' + fecha.getSeconds();
        return date;
    }
    $("#fecha_creacion").val(fecha());
});

var table = $('#index-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    ajax: '/datatables/get_data_usuarios',
    columns: [
        {data: 'id', name: 'id'},
        {data: null, name:'info', orderable: false, searchable: false},
        {data: 'nombre_completo', name: 'nombre_completo'},
        {data: 'usuario', name: 'usuario'},
        {data: 'correo', name: 'correo'},
        {data: 'estatus', name: 'estatus'},
        {data: 'area', name: 'area'},
        {data: 'rol_rh', name: 'rol_rh'},
        {data: 'action', name: 'action'}
    ],
    columnDefs :[
        {
            targets: 1,
            data: null,
            className: "text-center",
            render: function (data, type, row) {
                return '<i class="fa fa-info" style="cursor:pointer;"></i>';
            },
        },
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
    }
});

new $.fn.dataTable.FixedHeader(table);

table2 = table;

var user = null;
$('#index-table tbody').on('click', '.fa-info', function () {
    user = table.row($(this).parent()).data();
    var div = $('#body_info');
    div.empty();
    var template = '<table class="table table-bordered text-center"><tbody>';
    for (i in user){
        if(i == "action")
            continue;
        var title = (i.toUpperCase()).replace("_"," ");
        template += '<tr><td style="font-weight: bold">'+title+'</td>';
        template += '<td>'+user[i]+'</td></tr>';
    }
    template += '</tbody></table>';
    div.append(template);
    $('#info').modal('show');
});

var CSRF_TOKEN = $('#token').val();


$('#editarUserModal').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});

function abrirModalEditUsuario(id_user, name_user, id_area) {
    $('#editarUserModal').modal('show');
    $('#titulomodal').text("Editar Usuario");
    $("#user_id").val(id_user);
    $.ajax({
        url: '/usuarios/get_usuario',
        type: "GET",
        dataType: 'JSON',
        data: {
            id: id_user
        },
        success:function (data) {
            var user  = data.user;
            var areas = data.areas;
            var rol = $("#rol");
            rol.empty();
            for (value in areas) {
                rol.append('<option value="'+value+'">'+areas[value]+'</option>');
            }
            $('#user_id').val(user.id_usuario);
            $('#name_user').val(user.nombre);
            $('#apellidos').val(user.apellido);
            $('#usuario').val(user.usuario);
            $('#perfil').val(user.perfil);
            $('#area').val(user.area);
            $('#email_user').val(user.correo);
            $('#id_empleado').val(user.empleado_id);
            rol.val(user.id_area);
        }
    });
}

function abrirModalEliminarUsuario(id_usuario) {
    swal({
        title: "¿ Deseas eliminar el usuario ?",
        text: "El usuario será borrado del sistema definitivamente.",
        icon: "warning",
        cancelButtonText: 'Cancelar',
        buttons: true,
        dangerMode: true
    })
        .then((willDelete) => {
            if (willDelete) {
                $.ajax({
                    url: '/usuarios/dar_baja',
                    type: "POST",
                    dataType: 'JSON',
                    data: {
                        _token: CSRF_TOKEN,
                        id: id_usuario
                    },
                    success:function (data) {
                        swal("Usuario eliminado con éxito", {
                            icon: "success",
                        }).then((value) => {
                            var datanotificacion = {
                                asunto: "Notificación Indeplo",
                                puesto: $("#Area").val(),
                                mensaje: "Se ha eliminado el usuario con el id: " + id_usuario + " Por: " + $("#NombreUsuario").val(),
                                name: $("#NombreUsuario").val(),
                                cc: "useliminar",
                                // datos necesarios para el elvio de correo
                                para: $("#CorreoUser").val(),
                                de: $("#CorreoUser").val(),
                                usuario: $("#NombreUsuario").val(),
                                recurso: $("#NombreUsuario").val(),
                            };
                            EnviarCorreos(datanotificacion, "/usuarios");
                            table2.ajax.reload();
                        });
                    }
                });
            } else {
                return false;
            }
        });
}

function caracteresCorreoValido(email) {
    var caract = new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/);

    if (caract.test(email) == false) {
        return false;
    } else {
        return true;
    }
}


function validateFormEdit() {
    var email = $("#email_user").val();
    var array = ['cerrar','password'];
    if (caracteresCorreoValido(email)) {
        if (existe('edit_usuario', array)){
        }
        var name        = $("#name_user").val();
        var apellidos   = $("#apellidos").val();
        var usuario     = $("#usuario").val();
        var email_user  = $("#email_user").val();
        var id_empleado = $("#id_empleado").val();
        var perfil      = $("#perfil").val();
        var id_area     = $("#area").val();
        var rol         = $("#rol").val();
        var id_user     = $("#user_id").val();
        var password    = $("#password").val();

        var data = {
            _token: CSRF_TOKEN,
            name: name,
            apellidos: apellidos,
            usuario: usuario,
            email: email_user,
            id_empleado: id_empleado,
            perfil: perfil,
            area: id_area,
            rol: rol,
            id_user: id_user,
            password: password
        };

        $.ajax({
            url: '/usuarios/update_usuario',
            type: "POST",
            dataType: 'JSON',
            data: data,
            success:function (data) {
                if (data.ok == true){
                    swal("Usuario actualizado con éxito", {
                        icon: "success",
                    }).then((value) => {
                        var obj = data;
                        $('#editarUserModal').modal('toggle');
                        table2.ajax.reload();
                    });
                }
                else {
                    Swal.fire({
                        title: 'Ocurrio un error al actualizar',
                        type: 'error',
                        showCloseButton: true
                    });
                }
            }
        });


    } else {

        swal("Correo no valido", {
            icon: "error",
        });
    }


}

$(function () {
    $('#DivEmpleados').hide();
    $('#divUsersAutori').hide();
    $('#DivSolicitudes').hide();
    $('#DivIncidencias').hide();

    $('#usuariosCheck').change(function () {
        if (this.checked) {
            $('#divUsersAutori').show();
        } else {
            $('#divUsersAutori').hide();


            //$('#uscrear').prop('checked');
            $('#uscrear').prop('checked', false);
            $('#useliminar').prop('checked', false);
            $('#usedit').prop('checked', false);

        }
    });

    $('#EmpleadosCheck').change(function () {
        if (this.checked) {
            $('#DivEmpleados').show();
        } else {
            $('#DivEmpleados').hide();
            $('#SolAlta').prop('checked', false);
            $('#SolCrear').prop('checked', false);
            $('#SolBaja').prop('checked', false);
        }
    });


    $('#SolicitudesCheck').change(function () {
        if (this.checked) {
            $('#DivSolicitudes').show();
        } else {
            $('#DivSolicitudes').hide();
            $('#EmpleadoActualizar').prop('checked', false);
            $('#EmpleadoBaja').prop('checked', false);
        }
    });

    $('#IncidenciasCheck').change(function () {
        if (this.checked) {
            $('#DivIncidencias').show();
        } else {
            $('#DivIncidencias').hide();

            $('#InciCrear').prop('checked', false);
            $('#inciAuth').prop('checked', false);
            $('#inciLote').prop('checked', false);

        }
    });


});
var idusernoti = 0;

function asignarnotificaciones(iidusernotid_user) {
    var notifi = $('#body-notifi');
    var id     = iidusernotid_user;
    notifi.empty();
    $.ajax({
        url: '/usuarios/get_notificaciones',
        type: "GET",
        dataType: 'JSON',
        data: {
            id: id
        },
        success: function (data) {
            if (data.ok = true){
                var data = data.data;
                for (i = 0; i < data.length; i++) {
                    var notificacion = data[i];
                    var template = '<div class="form-check form-check-inline col-md-5 check-permiso" style="margin-top: 5px;">' +
                        '<input class="form-check-input" title="'+notificacion.descripcion+'" type="checkbox" id="notificacion_'+notificacion.id+'" value="'+notificacion.id+'">' +
                        '<label class="form-check-label" title="'+notificacion.descripcion+'" for="notificacion_'+notificacion.id+'">'+notificacion.nombre+'</label>' +
                        '</div>';
                    var checkbox = $(template);
                    checkbox.appendTo(notifi);
                }
            }
        }
    });
    $.ajax({
        url: '/usuarios/get_notifi_usuario',
        type: "GET",
        dataType: 'JSON',
        data: {
            id: id
        },
        success:function (data) {
            if (data.ok == true){
                var data = data.data;
                for (i = 0; i < data.length; i++) {
                    var notificacion = data[i];
                    var check = $('#notificacion_'+notificacion.id_notificacion);
                    check.prop("checked", true);
                }
            }
        },
    });
    $('#asignarnotifi').modal('show');
    $('#titulomodal').text("Editar Usuario");
    idusernoti = iidusernotid_user;
}

$('#permisos').on('hidden.bs.modal', function() {
    $(':input', this).val('');
});

function asignarPermisos(id) {
    var body = $('#body_permisos');
    body.empty();
    $.ajax({
        url: '/usuarios/get_permisos',
        type: "GET",
        dataType: 'JSON',
        data: {},
        success:function (data) {
            if (data.ok = true){
                var data = data.data;
                for (i = 0; i < data.length; i++) {
                    var permiso = data[i];
                    var template = '<div class="form-check form-check-inline col-md-5 check-permiso" style="margin-top: 5px;">' +
                        '<input class="form-check-input" title="'+permiso.descripcion+'" type="checkbox" id="permiso_'+permiso.id+'" value="'+permiso.id+'">' +
                        '<label class="form-check-label" title="'+permiso.descripcion+'" for="permiso_'+permiso.id+'">'+permiso.nombre+'</label>' +
                        '</div>';
                    var checkbox = $(template);
                    checkbox.appendTo(body);
                }
            }
        },
    });
    $.ajax({
        url: '/usuarios/get_permisos_usuario',
        type: "GET",
        dataType: 'JSON',
        data: {
            id: id
        },
        success:function (data) {
            if (data.ok == true){
                var data = data.data;
                for (i = 0; i < data.length; i++) {
                    var permiso = data[i];
                    var check = $('#permiso_'+permiso.id_permiso);
                    check.prop("checked", true);
                }
            }
        },
    });
    $('#id_usuario').val(id);
    $('#permisos').modal('show');
}

function enviarPermisos(){
    var id_usuario = $('#id_usuario').val();
    var checks = $("#body_permisos input");
    var array = [];
    checks.each(function () {
        if ($(this).prop("checked")) {
            array.push($(this).val());
        }
    });
    if (array.length == 0){
        array = false
    }
    var object = {
        _token   : CSRF_TOKEN,
        usuario  : id_usuario,
        permisos : array
    };

    $.ajax({
        url: '/usuarios/guardar_permisos',
        type: "POST",
        dataType: 'JSON',
        data: object,
        success:function (data) {
            if (data.ok == true){
                swal("Permisos guardados correctamente", {
                    icon: "success",
                });
                $('#permisos').modal('toggle');
            }
        }
    });
}


function validaCheckNotificaciones() {
    var datosCheck = {
        _token: CSRF_TOKEN,
        id_noti: $('#id_noti').val(),
        uscrear: $('#uscrear').prop('checked'),
        useliminar: $('#useliminar').prop('checked'),
        usedit: $('#usedit').prop('checked'),
        SolAlta: $('#SolAlta').prop('checked'),
        SolCrear: $('#SolCrear').prop('checked'),
        SolBaja: $('#SolBaja').prop('checked'),
        EmpleadoActualizar: $('#EmpleadoActualizar').prop('checked'),
        EmpleadoBaja: $('#EmpleadoBaja').prop('checked'),
        InciCrear: $('#InciCrear').prop('checked'),
        inciAuth: $('#inciAuth').prop('checked'),
        inciLote: $('#inciLote').prop('checked'),
        user: idusernoti,
    };
    $.ajax({
        url: '/usuarios/update_notificaciones',
        type: "POST",
        dataType: 'JSON',
        data: datosCheck,
        success:function (data) {
            swal("Actualizacion correcta", {
                icon: "success",
            }).then((value) => {
            });
            $('#asignarnotifi').modal('toggle');
        }
    });
}


function ExcelUsuarios() {
    swal({
        title: "Descargar Usuarios",
        text: "¿Desea descargar todos los datos de usuarios?",
        icon: "warning",
        buttons: true,
        dangerMode: true
    })
        .then((willDelete) => {

            if (willDelete) {
                location.href = "/ExcelUsuarios";
            }
        });
}

var usuario = $('#usuario');

usuario.on('keyup', function () {
   var value = usuario.val();
   $.ajax({
       url:'/usuarios/exist_user',
       type:'GET',
       dataType:'JSON',
       data:{
           user: value
       },
       success: function (data) {
           if (data.ok == true){
               var usuario = data.data;
               var error = $('#user_error');
               var create = $('#create_user');
               if (usuario != null){
                   error.append('El usuario '+usuario.usuario+' ya existe');
                   error.css('color','red');
                   error.css('font-weight','bold');
                   create.prop('disabled', true);
               }
               else{
                   error.empty();
                   create.prop('disabled', false);
               }
           }
       }
   });
});