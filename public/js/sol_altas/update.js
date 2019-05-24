$( "#codigo_auto,#codigo_celular, #codigo_computadora, #codigo_software, #codigo_bam, #codigo_poliza, #codigo_sueldo" ).keyup( function () {
	var id   = $(this).attr('id');
	var link = "";
	switch(id){
		case 'codigo_auto':
			link = "getCodigosAuto";
			break;
		case 'codigo_celular':
			link = "getCodigosCelular";
			break;
		case 'codigo_computadora':
			link = "getCodigosComputadora";
			break;
		case 'codigo_software':
			link = "getCodigosSoftware";
			break;
		case 'codigo_bam':
			link = "getCodigosBam";
			break;
		case 'codigo_poliza':
			link = "getCodigosPoliza";
			break;
		case 'codigo_sueldo':
			link = "getCodigosSueldo";
			break;
	}
	
});


function GetCodigoCel()
{
    autoComplete("getCodigosCelularDato/");
}

function autoComplete(link){
      $.get("/"+link+"FF-HER-SD-T-002", function (data) {
        console.log(data);
        })
 


}


	// $( "#"+id ).autocomplete({
	// 	source: "/rh/public/"+link,
	// 	minLength: 2,
	// 	select: function(event, ui) {
	// 		switch (id) {
		
	// 			case 'codigo_celular':
	// 				var costo_cel = $("#costo_celular_incore").val();

	// 				$('#'+id).val(ui.item.value);
	// 				$('#'+id).attr('data-id',ui.item.id);
	// 				$('#'+id).attr('data-precio',ui.item.precio);
	// 				$('#'+id).attr('data-diario',ui.item.diario);

	// 				$("#venta_celular_label").html(ui.item.precio);
					
	// 				if ( ui.item.diario == 1 || ui.item.diario == "1" ) {
	// 					$("#costo_celular_label").html( (parseFloat(costo_cel)/30).toFixed(2) );
	// 				} else {
	// 					$("#costo_celular_label").html( parseFloat(costo_cel).toFixed(2) );
	// 				}
	// 				break;
				
	// 			default:
	// 				$('#'+id).val(ui.item.value);
	// 				$('#'+id).attr('data-id',ui.item.id);
	// 				$('#'+id).attr('data-precio',ui.item.precio);
	// 				$('#'+id).attr('data-diario',ui.item.diario);
	// 		}

	// 		var cliente_val = $("#cliente").val();
	// 		var servicio_val = $("#servicio").val();
	// 		if ( cliente_val == "NOK" && servicio_val == "RREC" ) {
				
	// 		}
	// 	}
    // });
//}
