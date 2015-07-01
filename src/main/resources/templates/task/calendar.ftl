<!DOCTYPE html>
<html>
	<head>
		<meta charset='utf-8' />
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="/static/css/main.css"/>
		<link href='/static/calendar/css/fullcalendar.css' rel='stylesheet' />
		<link href='/static/calendar/css/fullcalendar.print.css' rel='stylesheet' media='print' />
	</head>
	<body>
		<#include "../stubs/navbar.ftl"/>

		<div class="container">

			<#include "../stubs/alert.ftl"/>

			<!-- delete object alert -->
			<div id="deleteAlert" class="alert alert-danger clearfix hide">
				<form id="deleteForm" action="" method="post" class="col-lg-2">
					<button id="delete" class="btn btn-danger btn-sm">Yes</button>
					<a id="deleteCancel" class="btn btn-default btn-sm">No</a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
				Are you sure you would like to permanently delete this task?
			</div>

			<a href="#" id="test">test</a>

			<div class="row">
				<div class="col-lg-12">
					<div id='calendar'></div>
				</div>
			</div>

		</div>

		<!-- task model -->
		<div class="modal fade" id="taskModal" tabindex="-1">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Add Task</h4>
					</div>
					<div class="modal-body clearfix">
						<div class="col-lg-12">
							<form id="taskForm" action="/task" method="post" class="form-horizontal">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="control-label col-xs-3">Name</label>
											<div class="col-xs-9">
												<input id="name" class="form-control clear" type="text" name="name" placeholder="Name" value=""/>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">Start Date</label>
											<div class="col-xs-9">
												<input id="startDate" class="form-control clear" type="date" name="startDate" placeholder="Start Date" value=""/>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">Start Time</label>
											<div class="col-xs-9">
												<input id="startTime" class="form-control clear" type="time" name="startTime" placeholder="Start Time"/>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">End Date</label>
											<div class="col-xs-9">
												<input id="endDate" class="form-control clear" type="date" name="endDate" placeholder="End Date" value=""/>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">End Time</label>
											<div class="col-xs-9">
												<input id="endTime" class="form-control clear" type="time" name="endTime" placeholder="End Time"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-xs-3">All Day</label>
											<div class="col-xs-4">
												<label><input id="allDayTrue" type="radio" name="allDay" value="1"> &nbsp;&nbsp;&nbsp;True</label>
											</div>
											<div class="col-xs-4">
												<label><input id="allDayFalse" type="radio" name="allDay" value="0" checked> &nbsp;&nbsp;&nbsp;False</label>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="control-label col-xs-3">Customer</label>
											<div class="col-xs-9">
												<select id="contact" class="form-control" name="contactId">
													<option value="0"></option>
													<#list contacts as contact>
														<option value="${(contact.id)!}">${(contact.firstName)!} ${(contact.lastName)!}</option>
													</#list>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">Priority</label>
											<div class="col-xs-9">
												<select id="priority" name="priority" class="form-control">
													<option value="0">Low</option>
													<option value="1">Medium</option>
													<option value="2">High</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">Status</label>
											<div class="col-xs-9">
												<select id="status" name="status" class="form-control">
													<option value="0">Open</option>
													<option value="1">Closed</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">Reminder</label>
											<div class="col-xs-9">
												<select id="reminder" class="form-control" name="reminder">
													<option value="0">None</option>
													<option value="1">Email</option>
													<option value="2">Text Message</option>
													<option value="2">Both</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">Repeat</label>
											<div class="col-xs-9">
												<select id="repeat" class="form-control" name="repeatInterval">
													<option value="0">None</option>
													<option value="1">Weekly</option>
													<option value="2">Monthly</option>
													<option value="3">Yearly</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">Color</label>
											<div class="col-xs-9">
												<input class="form-control" id="color" type="color" name="color"/>
											</div>
										</div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									</div>
								</div>
								<div class="col-xs-12">
									<div class="form-group">
										<label class="col-xs-12">Description</label>
										<textarea id="description" name="description" class="form-control" rows="3"></textarea>
									</div>
									<div class="form-group">
										<button class="btn btn-block btn-primary">Save</button>
									</div>
									<div class="form-group">
										<a href="#" id="deleteButton" data-delete="" class="btn btn-block btn-danger hide">Delete</a>
									</div>
								</div>
								<input type="hidden" id="id" name="id"/>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		[${tasks?join(",")}]

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src='/static/calendar/js/moment.min.js'></script>
		<script src='/static/calendar/js/fullcalendar.js'></script>
		<script src="/static/js/delete.js"></script>
		<script>
			var events = [${tasks?join(",")}];

			var temp;
			$(document).ready(function() {

				$('a[id="deleteButton"]').click(function() {
					$('#taskModal').modal('hide');
				});

				$('a[id="deleteCancel"]').click(function() {
					$('#taskModal').modal('show');
				});

				var form = 'form[id="taskForm"]';

				$(form + ' input[name="allDay"]').change(function() {
					if ($(form + ' input[id="allDayTrue"]').prop('checked') == true) {
						$(form + ' input[id="startTime"]').prop('disabled', true);
						$(form + ' input[id="endTime"]').prop('disabled', true);
					} else {
						$(form + ' input[id="startTime"]').prop('disabled', false);
						$(form + ' input[id="endTime"]').prop('disabled', false);
					}
				});

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
					$(form + ' input[id="startDate"]').val(event.start.toISOString().slice(0,10));
					if (event.end != null) {
						$(form + ' input[id="endDate"]').val(event.end.toISOString().slice(0,10));
					}
					if (!event.allDay) {
						$(form + ' input[id="startTime"]').val(event.start.toISOString().slice(11,16));
						$(form + ' input[id="endTime"]').val(event.end.toISOString().slice(11,16));
					}
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
						left: 'prev,next today',
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
					select: function(start, end) {
						clearForm();
						$(form + ' input[name="startDate"]').val(start.toISOString().slice(0,10));
						$(form + ' input[name="endDate"]').val(end.toISOString().slice(0,10));
						$(form + ' input[id="startTime"]').val(start._i.toTimeString().slice(0, 5));
						$(form + ' input[id="endTime"]').val(end._i.toTimeString().slice(0, 5));
						console.log(start._i);
						temp = start;
						$('#taskModal').modal('show');
					},
					eventDrop: function(event) {
						console.log(event)
						fillForm(event);
						//$('#taskModal').modal('show');
						$(form).submit();
					},
					eventResize: function(event) {
						console.log(event)
						fillForm(event);
						//$('#taskModal').modal('show');
						$(form).submit();
					},
					eventMouseover: function(event, js) {
						//$(js.currentTarget).popover({content: 'stuff'});
						//$(js.currentTarget).popover('show');
						//var t = $(js.target);
						//var p = $(t.parent());
						//if (!p.is('td')) {
						//	p = p.parent();
						//}
						//temp = p;
						//console.log(p);
						//p.popover({placement: 'bottom', content: event.description});
						//p.popover('show');
					},
					eventMouseout: function(event, js) {
						//var t = $(js.target);
						//var p = $(t.parent());
						//if (!p.is('td')) {
						//	p = p.parent();
						//}
						//p.popover('hide');
					},
					defaultDate: new Date(),
					editable: true,
					eventLimit: true, // allow "more" link when too many events
					events: [${tasks?join(",")}]
				});

			});

		</script>

	</body>
</html>
