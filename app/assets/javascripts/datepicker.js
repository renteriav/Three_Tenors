$(document).ready(function(){	
	$("#date-box").datepicker({altField: '.db-date', altFormat: 'yy-mm-dd'});
	
	$(window).resize(function() {
	      var field = $(document.activeElement);
	      if (field.is('.hasDatepicker')) {
			  field.datepicker({
			    showAnim: ""
			  });
	          field.datepicker('hide');
			  field.blur();
	      }
		  
	});
});