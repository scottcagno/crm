$(document).ready(function() {

	$('#deleteButton').click(function() {
    	$('form#deleteForm').attr('action', $('#deleteButton').attr('data-delete'));
    	$('div#deleteAlert').removeClass('hide');
    });

    $('a#deleteCancel').click(function() {
    	$('div#deleteAlert').addClass('hide');
    });

});