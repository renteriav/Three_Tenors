$(document).ready(function(){

	$( ".dropdown" ).hover(function() {
  		$(this).children().stop( true, false )
  		$(this).children().show(300);
  	});	
  	$( ".dropdown" ).mouseleave(function(){
  		$( this ).children().stop( true, true );
  		$( this ).find('ul').hide(400);
  	});
	
	$('#timepicker1').timepicker();
	
	$(function(){
	    $('#thumbs a').touchTouch();
	});
	
	$("#jquery_jplayer_N").jPlayer();
	
	var myPlaylist = new jPlayerPlaylist(
		{
		jPlayer: "#jquery_jplayer_N",
		cssSelectorAncestor: "#jp_container_N"
		}, 
		gon.playlist, 
		{
		playlistOptions: {
			enableRemoveControls: false
		},
		swfPath: "js",
		supplied: "webmv, ogv, m4v, oga, mp3",
		smoothPlayBar: true,
		keyEnabled: true,
		audioFullScreen: true
	});
	
});