function EnviarCorreos(arreglo,redireccionar){
    $.ajax({
        url: '/api/mail',
        type: 'POST',
        data: arreglo,
        dataType: 'JSON',
        success: function(result) {
            swal("success "+respuesta, "un error", "success");
          },
        error: function(respuesta) {
           swal("Correo enviado" , "Notificacion de: "+ arreglo.para, "success");
                   },
    });
}

function EnviarCorreosCitas(arreglo,redireccionar){
    $.ajax({
        url: '/api/citaFirma',
        type: 'POST',
        data: arreglo,
        dataType: 'JSON',
        success: function(result) {
            Swal("success "+respuesta, "un error", "success");
          },
        error: function(respuesta) {
           Swal("Correo enviado" , "Notificacion de: "+ arreglo.para, "success");
                   },
    });


    setTimeout(function () {
        location.href=redireccionar
    }, 3000);
}



  
