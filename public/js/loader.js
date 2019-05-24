/*
USO
	MOSTRAR
	$().loader("show",{
		background: "rgba(0,75,95,.5)", //siempre manejarlo en RGBA con el ultimo parametro al .5 (transparencia)
		color:      "white",     //color del engrane -> "#edr435", "red", "rgb(255,0,0)"
		effectIn:   "slideDown", //"fadeIn","show","slideDown"
		speedIn:    "fast",      //"fast","normal","slow", "100"(numerico)
	});
		O SIMPLEMENTE
	$().loader("show");

	OCULTAR
	$().loader("hide",{
		effectOut:  "slideUp",   //"fadeOut","hide","slideUp"
		speedOut:   "100",       //"fast","normal","slow", "100"(numerico)
	});
		O SIMPLEMENTE
	$().loader("hide");
*/
(function($){  
  $.fn.loader = function( action, options ) {
      var settings = $.extend({
        background: "rgba(0,75,95,.5)",
        color:      "white",
        effectIn:   "slideDown",
        speedIn:    "fast",
        effectOut:  "slideUp",
        speedOut:   "100",
      }, $.fn.loader.defaults, options);

      if ( $("#id_cover_loader").length ) {
        var cover_p = $("#id_cover_loader");
      } else {
        var cover_p = $("<div/>");
        $(cover_p).attr("id","id_cover_loader");
        $(cover_p).html('<i class="fa fa-cog fa-spin fa-fw" style="font-size: 170px;"></i><span class="sr-only">Loading...</span>');
        $(cover_p).css({
          "width":      "100%",
          "height":     "100%",
          "background": settings.background,
          "color":      settings.color,
          "position":   "fixed",
          "text-align": "center",
          "padding":    "260px 0",
          "top":        "0px",
          "z-index":    "99999",
          "display":    "none",
        });
      }
      if ( action === "show" ) {
        $(cover_p).appendTo('body');
          switch (settings.effectIn) {
            case 'fadeIn':
              $(cover_p).fadeIn(settings.speedIn);
              break;
            case 'show':
              $(cover_p).show(settings.speedIn);
              break;
            case 'slideDown':
              $(cover_p).slideDown(settings.speedIn);
              break;
            default:  
              $(cover_p).fadeIn(settings.speedIn);
          }
          return this;
      } else if ( action === "hide" ) {
          switch (settings.effectOut) {
            case 'fadeOut':
              $(cover_p).fadeOut(settings.speedOut,function(){
                $(cover_p).remove();
              });
              break;
            case 'hide':
              $(cover_p).hide(settings.speedOut,function(){
                $(cover_p).remove();
              });
              break;
            case 'slideUp':
              $(cover_p).slideUp(settings.speedOut,function(){
                $(cover_p).remove();
              });
              break;
            default:  
              $(cover_p).fadeOut(settings.speedOut,function(){
                $(cover_p).remove();
                
              });
          }
          return this;
      } else {
        console.log("nope");
      }
  };
})(jQuery);