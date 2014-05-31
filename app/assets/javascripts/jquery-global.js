$(document).ready(function(){

	$( ".dropdown" ).hover(function() {
  		$(this).children().stop( true, false )
  		$(this).find('ul').show(300);
  	});	
  	$( ".dropdown" ).mouseleave(function(){
  		$( this ).children().stop( true, true );
  		$( this ).find('ul').hide(400);
  	});
	
	$('#timepicker1').timepicker();
	
	$(function(){
	    $('#thumbs a').touchTouch();
	});

});