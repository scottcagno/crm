$('select#address').change(function() {
	if ($('select[id="address"]').val() === 'new') {
		$('#addressModal').modal('show');
	}
});

$('#addressModal').on('hidden.bs.modal', function (e) {
	$('select#address').val(0);
})

$('select#company').change(function() {
	if ($('select[id="company"]').val() === 'new') {
		$('#companyModal').modal('show');
	}
});

$('#companyModal').on('hidden.bs.modal', function (e) {
	$('select#company').val(0);
})