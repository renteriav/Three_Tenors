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
	
    $("#side-bar-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
	
	$("#main-photo").click(function(){
		$("#wrapper").removeClass("toggled");
	});

	$( window ).resize(function() {
	  $("#wrapper").removeClass("toggled");
	});
	
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
			enableRemoveControls: false,
			
		},
		
		supplied: "mp3, webmv, ogv, m4v, oga",
		smoothPlayBar: true,
		keyEnabled: true,
		audioFullScreen: true,
	});
	
	$("#title, #description").keyup(function(){
		if($('#title').val() == "" || $('#description').val() == ""){
			$("#start").prop( "disabled", true );
		}
		else{
			$("#start").prop( "disabled", false );
		}
	});
	
	$('#sound_clip_attachment').change(function(){
		var oFReader = new FileReader();		   		   
		oFReader.readAsDataURL(document.getElementById("sound_clip_attachment").files[0]);
		oFReader.onload = function (oFREvent) {
			document.getElementById("clip_preview").src = oFREvent.target.result;
		};
	});
	
});