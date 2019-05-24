$(document).ready(function () {
	var form = $("#comment-form");
	var miMensaje = $("#mensaje-enviado");
	miMensaje.hide();
	var id_post = $(form).find("#id_post").val();

	$.get("/comentarios/"+id_post,function (resp) {
		$(resp).each(function (id,value) {
			if ( value.path == 'NULL' ) {
				var imagen = '/img/user.png';
			} else {
				var imagen = '/uploads/'+value.path;
			}
			$("#comentariosPost").append('<div class="row"> <div class="col-md-2"> <img src="'+imagen+'" class="img-responsive"> </div> <div class="col-md-10"> <strong>'+value.name+'</strong> says:<p>'+value.comment+'</p> <strong>Publicado en: </strong><span>'+value.created_at+'</span> <a href="#">Eliminar</a> </div> </div> <hr>');
			
		});
	});
	
	form.submit(function (e) {
		e.preventDefault();
		var name = $(form).find("#name").val();
		var email = $(form).find("#email").val();
		var website = $(form).find("#website").val();
		var comment = $(form).find("#comment").val();
		var id_post = $(form).find("#id_post").val();
		var path = $(form).find("#path").val();
		var token = $('input[name=_token]').val();
		
		$.post( "/comments",
			{ 
				name:name,
				email:email,
				website:website,
				comment:comment,
				id_post:id_post,
				path:path,
				'_token':token,
			}
		)
	    .done(function( data ) {
	        form.fadeOut();
			miMensaje.fadeIn();        
	    })
	    .fail(function( data ) {
	        var obj = JSON.parse(data.responseText);
	        var cadena = "";
	        if (obj.name) {
	        	cadena += "El campo nombre es obligatorio \n"
	        }
	        if (obj.email) {
	        	cadena += "El campo email es obligatorio y tiene que ser válido \n"
	        }
	        if (obj.comment) {
	        	cadena += "El campo comentario es obligatorio \n"
	        }
	        alert(cadena);
	    });
	});
});