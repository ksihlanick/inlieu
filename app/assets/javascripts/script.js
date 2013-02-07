$(document).ready(function(){
	
		$('#new_user').validate({

	    highlight: function(label) {
	    	$(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		//.text('OK!').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	  });

	  	$('#new_payment').validate({

	    highlight: function(label) {
	    	$(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		//.text('OK!').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	  });
	  
}); // end document.ready

$(document).ready(function(){
	
		$('#new_payment').validate({

	    highlight: function(label) {
	    	$(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		//.text('OK!').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	  });

	  	$('#new_payment').validate({

	    highlight: function(label) {
	    	$(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		//.text('OK!').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	  });
	  
}); // end document.ready