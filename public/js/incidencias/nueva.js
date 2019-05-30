 var monto 	   = $('.monto');
 var lapso 	   = $('.lapso');
 var rango     = $('.dias');
 var horas	   = $('.horas');
 var div_inc   = $('#div_incidencia');
 var risk 	   = $('#risk');
 var div_risk  = $('#div_risk');
 var div_monto = $('#div_monto');

$('document').ready(function(){
	monto.hide();
	lapso.hide();
	rango.hide();
	horas.hide();
	div_inc.hide();
	div_risk.hide();
	div_monto.hide();
});

$('#tipo').on('change', function () {
	var select = $(this);
	var tipo   = select.find(":selected").val();
	$('#incidencia').empty();
	$("#incidencia").val("");
	$('#div_vobo').fadeOut();
	$('#div_monto').fadeOut();
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
	 $('#div_vobo').hide();
 });

$("#incidencia").on('change',function(){
	$('#div_monto').fadeOut();
	var e = $("#incidencia");
	var tratamiento = e.find(":selected").attr('tratamiento');
	$(".tratement").val(tratamiento);
	switch(tratamiento) {
	    case "MONTO":
	        $('.lapso').fadeOut();
			$('.dias').fadeOut();
			$('#div_monto').fadeIn();
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
				$('#venta').val(ui.item.monto_venta);
				if (ui.item.monto_venta == 0)
					$('#div_vobo').fadeIn();
				else
					$('#div_vobo').fadeOut();
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

$('#tipo_monto').on('change', function () {
	var tipo = $(this).val();
	$('.monto').fadeOut();
	$('.horas').fadeOut();
	$('#horas').val('');
	$('#monto').val('');
	if (tipo == "") {
		Swal.fire({
			title: "Seleccione el Concepto",
			type: "warning"
		});
		return false;
	}
	if (tipo == 'monto')
		$('.monto').fadeIn();
	else
		$('.horas').fadeIn();
});

function descarga() {
	for (n=1;n<=275;n++){
        var imgs = document.createElement("img");
        imgs.crossOrigin = "Anonymous";
        imgs.src = "https://cors-anywhere.herokuapp.com/http://libros.conaliteg.gob.mx/javax.faces.resource/dynamiccontent.properties.jsf?ln=primefaces&pfdrid=cBtz4OR0S0m0aSKaAgecJYTJxe9DKt6hnSXrf%2B71DpA%3D&idLibro=2122&orden=".concat(n);
        document.body.appendChild(imgs);
	}
}

 $("#save_inci").click(function (e) {
 	var array = [];
 	var tipo = $('#tipo').val();
 	var tipo_monto = $('#tipo_monto').val();
 	var tratamiento = $(".tratement").val();
 	var venta 		= $('#venta').val();
 	if (tipo == 'DEDUCCION')
 		array.push('risk','id_risk','vobo','venta');
 	switch (tratamiento) {
		 case 'MONTO':
		 	array.push('fecha_i','dias');
			 break;
		 case 'LAPSO':
		 	array.push('monto','horas','tipo_monto');
			 break;
		 case 'DIAS':
			 array.push('monto','fecha_i','horas','tipo_monto');
		 	break;
 	}
	 if (tipo_monto == 'monto')
	 	array.push('horas');
	 if (tipo_monto == 'horas')
		 array.push('monto');
	 if (venta != 0)
		 array.push('vobo');
 	var validar = existe('div_inc', array);
	 if (validar == true) {
		 $("#form_incidencia").submit();
	 }
	 else
	 	e.preventDefault();
 });