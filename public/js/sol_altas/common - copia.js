var token = $('input[name=_token]').val();

$(document).ready(function () {
	//Funciones para autocomplete combobox

	//Ejecuta el onchange de el combo para los div no bisibles
	$("#esquemas").trigger('change');

	

	
	$( "#coordinador_id,#lugar_trabajo,#plan_celular_select,#plan_bam_select" ).combobox();

	$( "#plan_celular_select" ).combobox({
		select: function (event, ui) {
			var cliente = $("#cliente").val();
			var servicio = $("#servicio").val();
			var esquemas = $("#esquemas").val(); 
            if (cliente == "NOK" && servicio == "RREC" && (esquemas == 2 || esquemas == 6 ) ) {
				costoVenta();
            }
        } 
	});
	$( "#plan_bam_select" ).combobox({
		select: function (event, ui) { 
            var cliente = $("#cliente").val();
			var servicio = $("#servicio").val();
			var esquemas = $("#esquemas").val(); 
            if (cliente == "NOK" && servicio == "RREC" && (esquemas == 2 || esquemas == 6 ) ) {
            	costoVenta();
            }
        } 
	});

	$(".custom-combobox-toggle").append('<i class="fa fa-chevron-down "></i>');
	//Fecha inicio contratacion
	var today = new Date();
	$('#fecha_inicio').datetimepicker({
		format: 'YYYY-MM-DD',
		//minDate : today
	});
});

// SUELDOS 
$("#esquema").change(function () {
	var esquema = $(this).val();
	if ( esquema == "TRADICIONAL") {
		if ( $("#v_imss").hasClass("hide") ) {
			$("#v_imss").removeClass("hide");
		}

		if ( !($("#v_variable").hasClass("hide")) ) {
			$("#v_variable").addClass("hide");
		}

		if ( ($("#sueldo_variable").hasClass("req_common")) ) {
			$("#sueldo_variable").removeClass("req_common");
		}
	} else if ( esquema == "ASIMILADO" || esquema == "EFECTIVO" || esquema == "VIATICOS" ) {
		if ( $("#v_imss").hasClass("hide") ) {
			$("#v_imss").removeClass("hide");
		}
		if ( $("#v_variable").hasClass("hide") ) {
			$("#v_variable").removeClass("hide");
		}
		if ( !($("#sueldo_variable").hasClass("req_common")) ) {
			$("#sueldo_variable").addClass("req_common");
		}
	}
	costoVenta();
	
});


// CODIGOS
$("#auto, #celular, #computadora, #software, #correo, #bam").change(function () {
	var id = $(this).attr('id');
	var valor = 0;
	if ( $(this).prop('checked') ) {
		valor = 1;
		if ( id == "celular" ) {
			var id_plan = $("#plan_celular_select").val();
			getCostoPlan(id_plan,'celular');
		}
		if ( id == "bam" ) {
			var id_plan = $("#plan_bam_select").val();
			getCostoPlan(id_plan,'bam');
		}
	} else {
		$('#codigo_'+id).removeAttr('data-id');
        $('#codigo_'+id).removeAttr('data-precio');
        $('#codigo_'+id).removeAttr('data-diario');
	}
	var cliente_val  = $("#cliente").val();
	var servicio_val = $("#servicio").val();
	if ( cliente_val == "NOK" && servicio_val == "RREC" ) {
		costoVenta();
	}
	
	muestraCodigos(id,valor);
});

// AUTOCOMPLETES DE LOS CODIGOS
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
	autoComplete(id,link);
});

// CUADRO DE VENTA ESPERADA
$("#esquemas").change(function () {
	var valor = $(this).val();
	// LIMPIEZA DE ELEMENTOS 
	$("#sueldo_venta").val('0.00');
	$("#codigo_poliza").val("");
	$("#sueldo_venta_div").empty();
	$("#costo_pol").empty();
	$("#cantidad_pol_inc").empty();

	if ( valor == 2 ) {
		$("#venta_esperada_div").removeClass('hide');
		$("#esq_task").removeClass('hide');
		$("#esq_poliza").addClass('hide');
	} else if ( valor == 6 ) {
		$("#venta_esperada_div").removeClass('hide');
		$("#esq_poliza").removeClass('hide');
		$("#esq_task").addClass('hide');
	} else {
		var tiene_hide = $("#venta_esperada_div").hasClass('hide');
		if ( !tiene_hide ) {
			$("#venta_esperada_div").addClass('hide');
			$("#esq_task").addClass('hide');
			$("#esq_poliza").addClass('hide');
		}
	}
	if ( valor == 3 || valor == 4 ) {
		//CODIGOS UNIFORME Y EQUIPAMIENTO
        $("#celular_codigos").removeClass('hide');
        $("#computadora_codigos").removeClass('hide');
        $("#software_codigos").removeClass('hide');
        $("#bam_codigos").removeClass('hide');
        $("#auto_codigos").removeClass('hide');
        //CODIGOS SUELDOS
        $("#codigo_sueldo_div").removeClass('hide');
		$("#sueldo_venta_c_div").removeClass('hide');
	} else {
		//CODIGOS UNIFORME Y EQUIPAMIENTO
        $("#celular_codigos").addClass('hide');
        $("#codigo_celular").val('');
        $("#computadora_codigos").addClass('hide');
        $("#codigo_computadora").val('');
        $("#software_codigos").addClass('hide');
        $("#codigo_software").val('');
        $("#bam_codigos").addClass('hide');
        $("#codigo_bam").val('');
        $("#auto_codigos").addClass('hide');
        $("#codigo_auto").val('');
        //CODIGOS SUELDOS
        $("#codigo_sueldo_div").addClass('hide');
		$("#sueldo_venta_c_div").addClass('hide');
		$("#codigo_sueldo_div").val('');
		$("#sueldo_venta_c_div").val('');

        //QUITAR ATRIBUTOS ADICIONALES CODIGOS
        var cam_cod = ['codigo_celular','codigo_computadora','codigo_software','codigo_bam','codigo_auto','codigo_sueldo'];
        $.each( cam_cod, function( i, value ) {
            $('#'+value).removeAttr('data-id');
            $('#'+value).removeAttr('data-precio');
            $('#'+value).removeAttr('data-diario');
        });
	}
	costoVenta();
	
});

// NUEVO COORDINADOR NOKIA
$("#coord_nuevo").change(function () {
	var id = $(this).attr('id');
	var valor = 0;
	if ( $(this).prop('checked') ) {
		valor = 1;
		$("#datos_coord_nuevo_div").removeClass('hide');
	} else {
		$("#datos_coord_nuevo_div").addClass('hide');
	}
});

$("#nombre_coor").keyup(function () {
	var valor = $(this).val();
	if ( valor.length > 3 ) {
		$.post( "/getCoord",
	        { valor:valor,'_token':token })
	    .done(function( data ) {
	    	var dato = JSON.parse(data);
	    	var element;
	        if ( dato[0].total != 0 ) {
	        	element = '<span style="color:red;"><i class="fa fa-times fa-2x" aria-hidden="true"></i></span>';
	        } else {
	        	element = '<span style="color:green;"><i class="fa fa-check fa-2x" aria-hidden="true"></i></span>';
	        }
	        $("#retro_nuevo_coor").html(element);         
	    })
	    .fail(function( data ) {
	        alert( "error:"+data );
	        console.log(data);
	    });
	}
});


$("#guarda_info").click(function () {
	var cliente = $("#cliente").val();
	var servicio = $("#servicio").val();
	var esquemas = $("#esquemas").val()

	var cuenta_errores = 0;
	var cadena = "";
	cadena += "Faltan llenar los siguientes campos:\n";

	var tipo_contratacion = 1;//normal

	if ( cliente == "NOK" && servicio == "RREC" ) {
		tipo_contratacion = 2;//NOK-RREC
	} else if ( cliente != "NOK" && servicio == "RREC" ) {
		tipo_contratacion = 3;//CUALQUIER RREC
	}

	// VALIDACION PARA CAMPOS REQUERIDOS COMUNES EN CUALQUIER SOLICITUD
	$("#formulario_solicitud input").each(function(){
        if ( $(this).hasClass('req_common') ) {
        	if ( $(this).val() == "" ) {
	            $(this).css("border","1px solid red");
	            cuenta_errores++;
	            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
	            cadena += titulo+"\n";
	        } else {
	            $(this).css("border","1px solid #eee");
	            console.log("no admitido")
	        }
        }else{
        	console.log("no admitido")
        }
    });

    $("#formulario_solicitud select").each(function(){
    	if ( $(this).hasClass('req_common') ) {
	        if ( $(this).val() == "" || $(this).val() == 0 || $(this).val() == "0" ) {
	            $(this).css("border","1px solid red");
	            cuenta_errores++;
	            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
	            cadena += titulo+"\n";
	        } else {
	            $(this).css("border","1px solid #eee");
	            console.log("no admitido")
	        }
        }else{
        	console.log("no admitido")
        }
    });

	if ( cliente == "NOK" && servicio == "RREC"  ) { //EVALUACION PARA NOK-RREC
		console.log("si entra aca");
		$("#formulario_solicitud input").each(function(){
	        if ( $(this).hasClass('req_nok') ) {
	        	if ( $(this).val() == "" ) {
		            $(this).css("border","1px solid red");
		            cuenta_errores++;
		            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
		            cadena += titulo+"\n";
		        } else {
		            $(this).css("border","1px solid #eee");
		            console.log("no admitido")
		        }
	        }else{
	        	console.log("no admitido")
	        }
	    });

	    $("#formulario_solicitud select").each(function(){
	    	if ( $(this).hasClass('req_nok') ) {
		        if ( $(this).val() == "" || $(this).val() == 0 || $(this).val() == "0" ) {
		            $(this).css("border","1px solid darkmagenta");
		            cuenta_errores++;
		            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
		            cadena += titulo+"\n";
		        } else {
		            $(this).css("border","1px solid #eee");
		            console.log("no admitido")
		        }
	        }else{
	        	console.log("no admitido")
	        }
	    });
	} else if ( cliente != "NOK" && servicio == "RREC"  ) { // EVALUACION PARA RREC (RAD, por ejemplo)
		$("#formulario_solicitud input").each(function(){
	        if ( $(this).hasClass('req_rrec') ) {
	        	if ( $(this).val() == "" ) {
		            $(this).css("border","1px solid red");
		            cuenta_errores++;
		            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
		            cadena += titulo+"\n";
		        } else {
		            $(this).css("border","1px solid #eee");
		            console.log("no admitido")
		        }
	        }else{
	        	console.log("no admitido")
	        }
	    });

	    $("#formulario_solicitud select").each(function(){
	    	if ( $(this).hasClass('req_rrec') ) {
		        if ( $(this).val() == "" || $(this).val() == 0 || $(this).val() == "0" ) {
		            $(this).css("border","1px solid red");
		            cuenta_errores++;
		            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
		            cadena += titulo+"\n";
		        } else {
		            $(this).css("border","1px solid #eee");
		            console.log("no admitido")
		        }
	        }else{
	        	console.log("no admitido")
	        }
	    });
	}

	console.log(cuenta_errores);

	if ( cuenta_errores == 0 ) {
		$("#formulario_solicitud").submit();
	} else {
		swal("Error!", cadena, "error");

	}
	
});

$("#actualiza_info").click(function () {
	var id_user = $("#id_user").val()
	console.log(id_user)
		var cliente = $("#cliente").val();
		var servicio = $("#servicio").val();
		var esquemas = $("#esquemas").val()

		var cuenta_errores = 0;
		var cadena = "";
		cadena += "Faltan llenar los siguientes campos:\n";

		var tipo_contratacion = 1;//normal

		if ( cliente == "NOK" && servicio == "RREC" ) {
			tipo_contratacion = 2;//NOK-RREC
		} else if ( cliente != "NOK" && servicio == "RREC" ) {
			tipo_contratacion = 3;//CUALQUIER RREC
		}

		// VALIDACION PARA CAMPOS REQUERIDOS COMUNES EN CUALQUIER SOLICITUD
		$("#formulario_solicitud_update input").each(function(){
	        if ( $(this).hasClass('req_common') ) {
	        	if ( $(this).val() == "" ) {
		            $(this).css("border","1px solid red");
		            cuenta_errores++;
		            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
		            cadena += titulo+"\n";
		        } else {
		            $(this).css("border","1px solid #eee");
		            console.log("no admitido")
		        }
	        }else{
	        	console.log("no admitido")
	        }
	    });

	    $("#formulario_solicitud_update select").each(function(){
	    	if ( $(this).hasClass('req_common') ) {
		        if ( $(this).val() == "" || $(this).val() == 0 || $(this).val() == "0" ) {
		            $(this).css("border","1px solid red");
		            cuenta_errores++;
		            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
		            cadena += titulo+"\n";
		        } else {
		            $(this).css("border","1px solid #eee");
		            console.log("no admitido")
		        }
	        }else{
	        	console.log("no admitido")
	        }
	    });

		if ( cliente == "NOK" && servicio == "RREC"  ) { //EVALUACION PARA NOK-RREC
			console.log("si entra aca");
			$("#formulario_solicitud_update input").each(function(){
		        if ( $(this).hasClass('req_nok') ) {
		        	if ( $(this).val() == "" ) {
			            $(this).css("border","1px solid red");
			            cuenta_errores++;
			            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
			            cadena += titulo+"\n";
			        } else {
			            $(this).css("border","1px solid #eee");
			            console.log("no admitido")
			        }
		        }else{
		        	console.log("no admitido")
		        }
		    });

		    $("#formulario_solicitud_update select").each(function(){
		    	if ( $(this).hasClass('req_nok') ) {
			        if ( $(this).val() == "" || $(this).val() == 0 || $(this).val() == "0" ) {
			            $(this).css("border","1px solid darkmagenta");
			            cuenta_errores++;
			            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
			            cadena += titulo+"\n";
			        } else {
			            $(this).css("border","1px solid #eee");
			            console.log("no admitido")
			        }
		        }else{
		        	console.log("no admitido")
		        }
		    });
		} else if ( cliente != "NOK" && servicio == "RREC"  ) { // EVALUACION PARA RREC (RAD, por ejemplo)
			$("#formulario_solicitud_update input").each(function(){
		        if ( $(this).hasClass('req_rrec') ) {
		        	if ( $(this).val() == "" ) {
			            $(this).css("border","1px solid red");
			            cuenta_errores++;
			            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
			            cadena += titulo+"\n";
			        } else {
			            $(this).css("border","1px solid #eee");
			            console.log("no admitido")
			        }
		        }else{
		        	console.log("no admitido")
		        }
		    });

		    $("#formulario_solicitud_update select").each(function(){
		    	if ( $(this).hasClass('req_rrec') ) {
			        if ( $(this).val() == "" || $(this).val() == 0 || $(this).val() == "0" ) {
			            $(this).css("border","1px solid red");
			            cuenta_errores++;
			            var titulo = (  $(this).prev('label').text() != "" ) ? $(this).prev('label').text():$(this).attr("name");
			            cadena += titulo+"\n";
			        } else {
			            $(this).css("border","1px solid #eee");
			            console.log("no admitido")
			        }
		        }else{
		        	console.log("no admitido")
		        }
		    });
		}

		console.log(cuenta_errores);

		if ( cuenta_errores == 0 ) {
			$("#formulario_solicitud_update").submit();
		} else {
			swal("Error!", cadena, "error");

			//alert(cadena);
		}
	
});






// FUNCIONES DE SIMPLIFICACION
function muestraCodigos(id,valor){
	var esquemas = $("#esquemas").val();
	var cliente = $("#cliente").val();
	var servicio = $("#servicio").val();
	if ( valor ) {
		$("#"+id+"_opciones").removeClass('hide');
		if ( cliente == "NOK" && servicio == "RREC" && id != "correo" && (esquemas == 3 || esquemas == 4) ) {
			$("#"+id+"_codigos").removeClass('hide');
			//COSTO NOMINA
        	$("#costo_nomina_div").removeClass('hide');
		}
	} else {
		$("#"+id+"_opciones").addClass('hide');
		if ( cliente == "NOK" && servicio == "RREC" && id != "correo" && (esquemas == 3 || esquemas == 4) ) {
			$("#codigo_"+id).val('');
			$('#codigo_'+id).removeAttr('data-id');
	        $('#codigo_'+id).removeAttr('data-precio');
	        $('#codigo_'+id).removeAttr('data-diario');
	        //COSTO NOMINA
        	$("#costo_nomina_div").addClass('hide');
		}
	}
	if ( cliente == "NOK" && servicio == "RREC" ) {
		costoVenta();
		
	}
}

function autoComplete(id,link){
	$( "#"+id ).autocomplete({
		source: "/"+link,
		minLength: 2,
		select: function(event, ui) {
			switch (id) {
				case 'codigo_poliza':
					var total = ( ui.item.incluye == null || ui.item.incluye == "" ) ? 0:ui.item.incluye;
					var sueldo_venta = ( total == 0 ) ? ui.item.precio : (ui.item.precio/total).toFixed(2);
					$('#'+id).val(ui.item.value);
					$("#sueldo_venta_div").empty();
					$("#costo_pol").empty();
					//$("#cantidad_pol").empty();
					$("#cantidad_pol_inc").empty();

					$("#costo_pol").append('<strong style="color: red; font-weight: bold;">$ '+ui.item.precio+'</strong>');
					//$("#cantidad_pol").append('<strong style="color: red; font-weight: bold;">'+ui.item.precio+'</strong>');
					$("#cantidad_pol_inc").append('<strong style="color: red; font-weight: bold;">'+total+'</strong>');
					$("#sueldo_venta_div").append( '<input name="sueldo_venta" id="sueldo_venta_p" class="form-control" value="'+sueldo_venta+'" readonly="readonly">' );
					break;
				case 'codigo_sueldo':
					$('#'+id).val(ui.item.value);
					$('#'+id).attr('data-id',ui.item.id);
					$('#'+id).attr('data-precio',ui.item.precio);
					$('#'+id).attr('data-diario',ui.item.diario);
					$('#sueldo_venta_c').val(ui.item.precio);
					break;
				case 'codigo_celular':
					var costo_cel = $("#costo_celular_incore").val();

					$('#'+id).val(ui.item.value);
					$('#'+id).attr('data-id',ui.item.id);
					$('#'+id).attr('data-precio',ui.item.precio);
					$('#'+id).attr('data-diario',ui.item.diario);

					$("#venta_celular_label").html(ui.item.precio);
					
					if ( ui.item.diario == 1 || ui.item.diario == "1" ) {
						$("#costo_celular_label").html( (parseFloat(costo_cel)/30).toFixed(2) );
					} else {
						$("#costo_celular_label").html( parseFloat(costo_cel).toFixed(2) );
					}
					break;
				case 'codigo_computadora':
					var costo_com = $("#costo_computadora_incore").val();

					$('#'+id).val(ui.item.value);
					$('#'+id).attr('data-id',ui.item.id);
					$('#'+id).attr('data-precio',ui.item.precio);
					$('#'+id).attr('data-diario',ui.item.diario);

					$("#venta_computadora_label").html(ui.item.precio);
					
					if ( ui.item.diario == 1 || ui.item.diario == "1" ) {
						$("#costo_computadora_label").html( (parseFloat(costo_com)/30).toFixed(2) );
					} else {
						$("#costo_computadora_label").html( parseFloat(costo_com).toFixed(2) );
					}
					break;
				case 'codigo_bam':
					var costo_bam = $("#costo_bam_incore").val();

					$('#'+id).val(ui.item.value);
					$('#'+id).attr('data-id',ui.item.id);
					$('#'+id).attr('data-precio',ui.item.precio);
					$('#'+id).attr('data-diario',ui.item.diario);

					$("#venta_bam_label").html(ui.item.precio);
					
					if ( ui.item.diario == 1 || ui.item.diario == "1" ) {
						$("#costo_bam_label").html( (parseFloat(costo_bam)/30).toFixed(2) );
					} else {
						$("#costo_bam_label").html( parseFloat(costo_bam).toFixed(2) );
					}
					break;
				case 'codigo_software':
					$('#'+id).val(ui.item.value);
					$('#'+id).attr('data-id',ui.item.id);
					$('#'+id).attr('data-precio',ui.item.precio);
					$('#'+id).attr('data-diario',ui.item.diario);

					$("#venta_software_label").html(ui.item.precio);
					$("#costo_software_label").html( (parseFloat(ui.item.precio)*0.7).toFixed(2) );

					break;
				case 'codigo_auto':
					var costo_auto = $("#costo_auto_incore").val();

					$('#'+id).val(ui.item.value);
					$('#'+id).attr('data-id',ui.item.id);
					$('#'+id).attr('data-precio',ui.item.precio);
					$('#'+id).attr('data-diario',ui.item.diario);

					$("#venta_auto_label").html(ui.item.precio);
					
					if ( ui.item.diario == 1 || ui.item.diario == "1" ) {
						$("#costo_auto_label").html( (parseFloat(costo_auto)/30).toFixed(2) );
					} else {
						$("#costo_auto_label").html( parseFloat(costo_auto).toFixed(2) );
					}
					break;
				default:
					$('#'+id).val(ui.item.value);
					$('#'+id).attr('data-id',ui.item.id);
					$('#'+id).attr('data-precio',ui.item.precio);
					$('#'+id).attr('data-diario',ui.item.diario);
			}

			var cliente_val = $("#cliente").val();
			var servicio_val = $("#servicio").val();
			if ( cliente_val == "NOK" && servicio_val == "RREC" ) {
				costoVenta();
				
			}
		}
	});
}
$("#sueldo_venta,#sueldo_imss,#sueldo_variable").keyup(function () {
	costoVenta();
});
$("#riesgo").change(function () {
	costoVenta();
});

function costoVenta(){
	calcularCostoRecurso();
	var id_plan_cel = $("#plan_celular_select").val();
	getCostoPlan(id_plan_cel,'celular');
	var id_plan_bam = $("#plan_bam_select").val();
	getCostoPlan(id_plan_bam,'bam');
	setTimeout(function () {
		var venta = calcularVenta();
		var costo = calcularCosto();

		var cam_cod  = ['codigo_celular','codigo_computadora','codigo_software','codigo_bam','codigo_auto','codigo_sueldo'];
		var margen   = 0;

	    margen = (venta - costo) / venta * 100;
	    $('#venta_calculada_span').empty();
		$('#costo_estimado_span').empty();
		$('#margen_span').empty();
		$('#venta_calculada_span').append('<strong>$'+( isNaN(venta.toFixed(2)) ? 0:venta.toFixed(2) )+'</strong>');
		$('#costo_estimado_span').append('<strong>$'+( isNaN(costo.toFixed(2)) ? 0:costo.toFixed(2) )+'</strong>');
		$('#margen_span').append('<strong>'+ ( isNaN(margen.toFixed(2)) ? 0:margen.toFixed(2) ) +'%</strong>');

		$('#venta_calculada').empty();
		$('#costo_estimado').empty();
		var valor_venta = isNaN(venta.toFixed(2)) ? 0:venta.toFixed(2);
		var valor_costo = isNaN(costo.toFixed(2)) ? 0:costo.toFixed(2);
		$('#venta_calculada').val(valor_venta);
		$('#costo_estimado').val(valor_costo);

	},500);
}


function calcularCosto(){
	calcularCostoRecurso();
	var total = 0;
	var cam_cod  = ['codigo_celular','codigo_computadora','codigo_software','codigo_bam','codigo_auto','codigo_sueldo'];
	var checkbox = ['celular','computadora','software','bam','auto'];
	var esquemas = $("#esquemas").val();
	var cliente  = $("#cliente").val();
	var servicio = $("#servicio").val();

	switch(esquemas) {
		case '3'://RENTA FIJA
		case '4'://ETL
		case '7'://RENTA FIJA
			$.each( cam_cod, function( i, value ) {
				var precio  = parseFloat($('#'+value).attr('data-precio'));
				var diario 		= parseInt($('#'+value).attr('data-diario'));
		    	if ( precio > 0 ) {
					switch (value) {
						case 'codigo_sueldo':
							if ( precio > 0 ) {
								if ( diario == 0 ) {
									total = total + parseFloat($("#costo_nomina").val());
								} else {
									total = total + (parseFloat($("#costo_nomina").val())/30);
								}
							}
						break;
						case 'codigo_celular':
							total = total + parseFloat( $("#costo_celular_label").html() );
						break;
						case 'codigo_computadora':
							total = total + parseFloat( $("#costo_computadora_label").html() );	
						break;
						case 'codigo_auto':
							total = total + parseFloat( $("#costo_auto_label").html() );
						break;
						case 'codigo_bam':
							total = total + parseFloat( $("#costo_bam_label").html() );
							
						break;
						case 'codigo_software':
							total = total + parseFloat( $("#costo_software_label").html() );
						break;
						default:
							return;
					}
		    	}
			});
			break;
		case '2'://TASK BASED
		case '6'://POLIZA
			$.each( checkbox, function( i, value ) {
				switch (value) {
					case 'celular':
						var valor;
						if ( $("#costo_celular_plan").length > 0 ) {
							valor = $("#costo_celular_plan").val();
							if ( valor == "" ) {
								valor = 0;
							}
						} else {
							valor = 0;
						}
						total = total + parseFloat(valor);
						break;
					case 'computadora':
						if ( $("#"+value).prop('checked') ) {
							total = total + 450;
						}
						break;
					case 'auto':
						if ( $("#"+value).prop('checked') ) {
							total = total + 300;
						}
						break;
					case 'bam':
						var valor2;
						if ( $("#costo_bam_plan").length > 0 ) {
							valor2 = $("#costo_bam_plan").val();
							if ( valor2 == "" ) {
								valor2 = 0;
							}
						} else {
							valor2 = 0;
						}
						total = total + parseFloat(valor2);
						break;
					default:
						return;
				}
			});
	    	total = total + parseFloat($("#costo_nomina").val());
			break;
	}

	return total;
}

function calcularVenta(){
	var total = 0;
	var cam_cod  = ['codigo_celular','codigo_computadora','codigo_software','codigo_bam','codigo_auto','codigo_sueldo'];
	var esquemas = $("#esquemas").val();
	switch(esquemas) {
		case '3'://RENTA FIJA
		case '4'://ETL
		case '7'://RENTA FIJA
			$.each( cam_cod, function( i, value )  {
				var venta_elem  = parseFloat($('#'+value).attr('data-precio'));
		    	if ( venta_elem > 0 ) {
		    		total = total + venta_elem; 
		    	}
			});
			break;
		case '2'://TASK BASED
			var sueldo_venta = $("#sueldo_venta").val();
	    	total = total + parseFloat(sueldo_venta);
			break;
		case '6'://POLIZA
			var sueldo_venta = $("#sueldo_venta_p").val();
	    	total = total + parseFloat(sueldo_venta);
			break;

	}
	return total;
}

function calcularCostoRecurso() {
	// PARA EL CALCULO DEL COSTO SALARIO
	
    var riesgo   = $("#riesgo").val();
    var imss     = $("#sueldo_imss").val();
    var variable = $("#sueldo_variable").val();
    var esquema  = $("#esquema").val();
    if ( imss == "" ) {
    	imss = 0;
    }
    if ( variable == "" ) {
    	variable = 0
    }

	$.post( "/getCostoRecurso", {
    	riesgo:riesgo,
    	imss:imss,
    	variable:variable,
    	esquema:esquema,
    	'_token':token
    })
    .done(function( data ) {
        $("#costo_nomina").val(data.costo_mensual);        
    })
    .fail(function( data ) {
        console.log(data);
    })
}

function getCostoPlan(id,tipo) {
	$.post( "/getCostoPlan", {
    	id:id,
    	'_token':token
    })
    .done(function( data ) {
    	if ( $("#"+tipo).prop('checked') ) {
			//SE AÑADE EL COSTO DEL PLAN
			if ( $('#costo_'+tipo+'_plan').length > 0 ) {
				$('#costo_'+tipo+'_plan').val(data[0]);
			} else {
				var input = $('<input/>', {
				  'type' : 'hidden',
				  'id' : 'costo_'+tipo+'_plan',
				  'value' : data[0]
				});
				$("body").append(input);
			}
		} else {
			if ( $('#costo_'+tipo+'_plan').length > 0 ) {
				$('#costo_'+tipo+'_plan').val("0");
			}
		}	
    })
    .fail(function( data ) {
        console.log(data);
        return false;
    })
}

/*
jQuery.ui.autocomplete.prototype._resizeMenu = function () {
  var ul = this.menu.element;
  ul.outerWidth(this.element.outerWidth());
  ul.outerHeight(this.element.outerHeight());
}
*/