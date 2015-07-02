
var temp;
$(document).ready(function() {

	$('a[id="deleteButton"]').click(function() {
		$('#taskModal').modal('hide');
		$('#deleteForm input[id="view"]').val($('#calendar').fullCalendar('getView').name);
	});

	$('a[id="deleteCancel"]').click(function() {
		$('#taskModal').modal('show');
	});

	var form = 'form[id="taskForm"]';

	function clearForm() {
		$(form + ' input.clear').val('');
		$(form + ' select').val('0');
		$(form + ' textarea').val('');
		$(form + ' input[id="color"]').val('#0079ff');
		$(form + ' input[id="id"]').remove();
		$(form + ' input[id="allDayFalse"]').click();
		$(form + ' a[id="deleteButton"]').addClass('hide');
	}

	function fillForm(event) {
		$(form + ' input[id="name"]').val(event.title);
		if (event.end == null) {
			event.end = event.start.clone();
			event.end.add(1, 'hours');
		}
		$(form + ' input[id="startString"]').val(event.start.toISOString());
		$(form + ' input[id="endString"]').val(event.end.toISOString());
		$(form + ' select[id="contact"]').val(event.contact.id);
		$(form + ' select[id="priority"]').val(event.priority);
		$(form + ' select[id="status"]').val(event.status);
		$(form + ' select[id="reminder"]').val(event.reminder);
		$(form + ' select[id="repeat"]').val(event.repeatInterval);
		$(form + ' textarea[id="description"]').val(event.description);
		$(form + ' input[id="color"]').val(event.color);
		$(form).append('<input type="hidden" id="id" name="id"/>');
		$(form + ' input[id="id"]').val(event.id);
		if (event.allDay) {
			$(form + ' input[id="allDayTrue"]').click();
		}
		$(form + ' a[id="deleteButton"]').attr('data-delete', '/task/' + event.id);
		$(form + ' a[id="deleteButton"]').removeClass('hide');
	}

	$('#calendar').fullCalendar({
		header: {
			left: 'prev,today,next',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		eventClick: function(event) {
			console.log(event)
			fillForm(event);
			$('#taskModal').modal('show');
		},
		selectable: true,
		selectHelper: true,
		select: function(start, end, js, view) {
			if (start.date() == (end.date() - 1) && view.name === 'month') {
				$('#calendar').fullCalendar('changeView', 'agendaDay');
				$('#calendar').fullCalendar('gotoDate', start);
			} else {
				clearForm();
				if (view.name === 'month') {
					end.subtract(1, 'days');
					$(form + ' input[id="startString"]').val(start.toISOString() + 'T09:00:00');
					$(form + ' input[id="endString"]').val(end.toISOString() + 'T17:00:00');
				} else {
					$(form + ' input[id="startString"]').val(start.toISOString());
					$(form + ' input[id="endString"]').val(end.toISOString());
				}
				$(form + ' input[id="view"]').val(view.name);
				$('#taskModal').modal('show');
			}
		},
		eventDrop: function(event, delta, revertFunction, jsEvent, ui, view) {
			fillForm(event);
			$(form + ' input[id="view"]').val(view.name);
			$(form).submit();
		},
		eventResize: function(event, delta, revertFunction, jsEvent, ui, view) {
			fillForm(event);
			$(form + ' input[id="view"]').val(view.name);
			temp = event;
			$(form).submit();
		},
		// eventMouseover: function(event, js) {
		// 	$(js.currentTarget).popover({content: 'stuff'});
		// 	$(js.currentTarget).popover('show');
		// 	var t = $(js.target);
		// 	var p = $(t.parent());
		// 	if (!p.is('td')) {
		// 		p = p.parent();
		// 	}
		// 	temp = p;
		// 	console.log(p);
		// 	p.popover({placement: 'bottom', content: event.description});
		// 	p.popover('show');
		// },
		// eventMouseout: function(event, js) {
		// 	var t = $(js.target);
		// 	var p = $(t.parent());
		// 	if (!p.is('td')) {
		// 		p = p.parent();
		// 	}
		// 	p.popover('hide');
		// },
		defaultDate: new Date(),
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: events
	});
	if (view !== '') {
		$('#calendar').fullCalendar('changeView', view);
		$('#calendar').fullCalendar('gotoDate', day);
	}
});
