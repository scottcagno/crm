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
		<#include "../stubs/alert.ftl"/>
		<div class="container">
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
												<input id="name" class="form-control" type="text" name="name" placeholder="Name" value=""/>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">Date</label>
											<div class="col-xs-9">
												<input id="date" class="form-control" type="date" name="date" placeholder="Date" value=""/>
											</div>
										</div>
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
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="col-xs-3">Send Email</label>
											<div class="col-xs-4">
												<label><input type="radio" name="sendEmail" value="1"> &nbsp;&nbsp;&nbsp;True</label>
											</div>
											<div class="col-xs-4">
												<label><input type="radio" name="sendEmail" value="0"> &nbsp;&nbsp;&nbsp;False</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-xs-3">Send Text</label>
											<div class="col-xs-4">
												<label><input type="radio" name="sendText" value="1"> &nbsp;&nbsp;&nbsp;True</label>
											</div>
											<div class="col-xs-4">
												<label><input type="radio" name="sendText" value="0"> &nbsp;&nbsp;&nbsp;False</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-xs-3">Repeat</label>
											<div class="col-xs-4">
												<label><input type="radio" name="repeate" value="1"> &nbsp;&nbsp;&nbsp;True</label>
											</div>
											<div class="col-xs-4">
												<label><input type="radio" name="repeate" value="0"> &nbsp;&nbsp;&nbsp;False</label>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">Repeat Interval</label>
											<div class="col-xs-9">
												<select class="form-control" name="repeatInterval">
													<option value="0">Weekly</option>
													<option value="1">Monthly</option>
													<option value="2">Yearly</option>
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
										<#if task??>
											<div class="form-group">
												<a href="#" id="deleteButton" data-delete="/task/${(task.id)!}" class="btn btn-danger btn-block">Delete</a>
											</div>
										</#if>
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-12">Description</label>
									<div class="col-xs-12">
										<textarea id="description" name="description" class="form-control" rows="5"></textarea>
									</div>
								</div>
								<input type="hidden" id="id" name="id"/>
								<div class="form-group">
									<button class="btn btn-block btn-primary">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src='/static/calendar/js/moment.min.js'></script>
		<script src='/static/calendar/js/fullcalendar.js'></script>
		<script>

			$(document).ready(function() {

				function fillForm(event) {
					var form = 'form[id="taskForm"]';
					$(form + ' input[id="name"]').val(event.title);
					$(form + ' input[id="date"]').val(event.start.toISOString().slice(0,10));
					$(form + ' select[id="contact"]').val(event.contact.id);
					$(form + ' select[id="priority"]').val(event.priority);
					$(form + ' select[id="status"]').val(event.status);
					$(form + ' textarea[id="description"]').val(event.description);
					$(form + ' input[id="id"]').val(event.id);
					$(form + ' input[id="color"]').val(event.color);
				}

				$('#calendar').fullCalendar({
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month,basicWeek,basicDay'
					},
					eventClick: function(event) {
						console.log(event)
						fillForm(event);
						$('#taskModal').modal('show');
					},
					selectable: true,
        			selectHelper: true,
					select: function(start) {
						$('input[name="date"]').val(start.toISOString().slice(0,10));
						$('#taskModal').modal('show');
					},
					defaultDate: new Date(),
					//editable: true,
					eventLimit: true, // allow "more" link when too many events
					events: [${tasks?join(",")}]
				});

			});

		</script>

	</body>
</html>
