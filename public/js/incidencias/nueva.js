 var monto 	  = $('.monto');
 var lapso 	  = $('.lapso');
 var rango    = $('.dias');
 var div_inc  = $('#div_incidencia');
 var risk 	  = $('#risk');
 var div_risk = $('#div_risk');

$('document').ready(function(){
	monto.hide();
	lapso.hide();
	rango.hide();
	div_inc.hide();
	div_risk.hide();
});

$('#tipo').on('change', function () {
	var select = $(this);
	var tipo   = select.find(":selected").val();
	$('#incidencia').empty();
	$("#incidencia").val("");
	$("#esquema").val("");
	$("#risk").val("");
	$("#id_risk").val("");
	monto.fadeOut();
	lapso.fadeOut();
	rango.fadeOut();
	div_risk.fadeOut();
	if (tipo == "") {
		$('#div_incidencia').fadeOut();
		$('#div_risk').fadeOut();
		Swal.fire({
			title: "Seleccione el Concepto",
			type: "warning"
		});
		return false;
	}
	if (tipo == 'PERCEPCION')
		div_risk.fadeIn();

	$.ajax({
		url: '/incidencias/filtro',
		type: 'GET',
		dataType: 'JSON',
		data: {
			tipo: tipo,
		},
		success: function (data) {
			if (data.ok == true){
				div_inc.fadeIn();
				var options = data.data;
				$('#incidencia').append($('<option>', {
					value: "",
					text : "Selecciona el tipo"
				}));
				for (i in options){
					$('#incidencia').append($('<option>', {
						value: options[i].id,
						text : options[i].alias,
						class: options[i].descripcion,
						tratamiento: options[i].tratamiento
					}));
				}
			}
		}
	});
});

 $('#empleado').on('keyup', function () {
     $('#risk').val("");
 });

$("#incidencia").on('change',function(){
	var e = $("#incidencia");
	var tratamiento = e.find(":selected").attr('tratamiento');
	$(".tratement").val(tratamiento);
	switch(tratamiento) {
	    case "MONTO":
	        $('.lapso').fadeOut();
			$('.dias').fadeOut();
			$('.monto').fadeIn();
	    break; 
	    case "LAPSO":
	        $('.monto').fadeOut();
			$('.dias').fadeIn();
			$('.lapso').fadeIn();
	    break;
	    case "DIAS":
	        $('.monto').fadeOut();
			$('.lapso').fadeOut();
			$('.dias').fadeIn();
	    break;
	    default:
			Swal.fire({
				title: "Seleccione el tipo",
				type: "warning"
			});
	    break;
	}	
   
});

$("#empleado" ).autocomplete({
	source: "/incidencias/get_empleados",
	minLength: 2,
	select: function(event, ui) {
		$('#empleado').val(ui.item.value);
		$('#id_empleado').val(ui.item.id);
	}
});

risk.on('keyup',function () {
	if ($('#id_empleado').val() != ""){
		risk.autocomplete({
			source: function (request, response) {
				$.ajax({
					url: '/incidencias/get_risk',
					type: 'GET',
					dataType: 'JSON',
					data: {
						term: request.term,
						id: $('#id_empleado').val()
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

function descarga() {
	for (n=1;n<=275;n++){
        var imgs = document.createElement("img");
        imgs.crossOrigin = "Anonymous";
        imgs.src = "https://cors-anywhere.herokuapp.com/http://libros.conaliteg.gob.mx/javax.faces.resource/dynamiccontent.properties.jsf?ln=primefaces&pfdrid=cBtz4OR0S0m0aSKaAgecJYTJxe9DKt6hnSXrf%2B71DpA%3D&idLibro=2122&orden=".concat(n);
        document.body.appendChild(imgs);
	}
}
