$(document).ready(function(){
	
// dropdown custom setup

	$( ".dropdown-main" ).hover(function() {
  		$(this).children().stop( true, false )
  		$(this).children().show(300);
  	});	
  	$( ".dropdown-main" ).mouseleave(function(){
  		$( this ).children().stop( true, true );
  		$( this ).find('ul').hide(400);
  	});
	
	$(".dropdwon-admin").dropdown();
	
// hides datetimepicker after resizing window
	
  	$(window).resize(function() {
		var field = $(document.activeElement);
			if (field.prop('id')== "event_time") {
				$('#datetimepicker3').data("DateTimePicker").hide();
				$('#event_time').blur();
			}
	});
	
// datetimepicker initial setup
	
	$('#datetimepicker3').datetimepicker({
		icons: {
		time: "fa fa-clock-o",
		date: "fa fa-calendar",
		up: "fa fa-arrow-up",
		down: "fa fa-arrow-down"
		},
		format: 'LT',
		stepping: 15,
		debug: false,
		widgetPositioning: {
			horizontal: "left"
		},
	});
	
	$('.readonly').on('keypress', function(e) {
    e.preventDefault(); // Don't allow direct editing
});

// adjust the width at which the sidebar collapses
	
	$(window).bind("load resize", function () {
    if ($(this).width() < 768) {
        $('div.sidebar-collapse').addClass('collapse')
    } else {
        $('div.sidebar-collapse').removeClass('collapse')
    }
	
	});

// prevents main window from scrolling, once the sidebar is toggled to give a more native feel
		
    $("#side-bar-toggle").click(function() {
        $("#wrapper").toggleClass("toggled");
		if($("#wrapper").hasClass("toggled")){
			var content = $(window).height();
			$('#page-content-wrapper').addClass("no-scroll");
			$('#page-content-wrapper').height(content);
		}
		else{
			$('#page-content-wrapper').removeClass("no-scroll");
		}
    });

	$( window ).resize(function() {
		$('body').removeClass("no-scroll");
		$('#page-content-wrapper').removeClass("no-scroll");
		if(!$("#wrapper").hasClass('wrapper-mobile')){
	  	  $("#wrapper").removeClass("toggled");
		}
	});
	
// toggles the disclosure indicators for nested menus
	
	$('.nested').click(function(){
		if($(this).children("ul").hasClass("nested-toggled")){
			$(this).children("ul").hide("fast");
			$(this).children("ul").removeClass("nested-toggled");
			$(this).children().children("i").removeClass("fa-chevron-up");
			$(this).children().children("i").addClass("fa-chevron-down");
		}
		else{
			$(".nested-toggled").hide("fast");
			$(".nested-toggled").parent().children().children("i").removeClass("fa-chevron-up");
			$(".nested-toggled").parent().children().children("i").addClass("fa-chevron-down");
			$(".nested-toggled").removeClass("nested-toggled");
			$(this).children("ul").show("fast");
			$(this).children("ul").addClass("nested-toggled");
			$(this).children().children("i").removeClass("fa-chevron-down");
			$(this).children().children("i").addClass("fa-chevron-up");
		}
	})

// initializes the gallery	
	$(function(){
	    $('#thumbs a').touchTouch();
	});
	
// initialize the Jquery_player
	
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
	
// disables the upload button if the title field is blank
	
	$("#title, #description").keyup(function(){
		if($('#title').val() == "" || $('#description').val() == ""){
			$("#start").prop( "disabled", true );
		}
		else{
			$("#start").prop( "disabled", false );
		}
	});
	
// setup the uploader
	
	$('#sound_clip_attachment').change(function(){
		var oFReader = new FileReader();		   		   
		oFReader.readAsDataURL(document.getElementById("sound_clip_attachment").files[0]);
		oFReader.onload = function (oFREvent) {
			document.getElementById("clip_preview").src = oFREvent.target.result;
		};
	});
	
});