<!DOCTYPE html>
<html>
	<head>
		<#include "../stubs/header.ftl"/>
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
					<input type="hidden" id="view" name="view"/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
				Are you sure you would like to permanently delete this task?
			</div>

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
							<form id="taskForm" action="/secure/task" method="post" class="form-horizontal">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="control-label col-xs-3">Name</label>
											<div class="col-xs-9">
												<input id="name" class="form-control clear" type="text" name="name" placeholder="Name" value=""/>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-xs-3">Color</label>
											<div class="col-xs-9">
												<select name="color" id="color" class="form-control">
													<option value="#d10000">Red</option>
													<option value="#ff6622">Orange</option>
													<option value="#ffda21">Yellow</option>
													<option value="#33dd00">Green</option>
													<option value="#1133cc">Blue</option>
													<option value="#330044">Purple</option>
												</select>
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
											<input id="startString" type="hidden" class="form-control" name="startString"/>
										</div>
										<div class="form-group">
											<input id="endString" type="hidden" class="form-control" name="endString"/>
										</div>

										<div class="form-group hide">
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
									</div>
								</div>
								<div class="col-xs-12">
									<div class="form-group">
										<label class="col-xs-12">Description</label>
										<textarea id="description" name="description" class="form-control" rows="3"></textarea>
									</div>
									<input type="hidden" id="view" name="view"/>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								</div>
								<div class="row">
									<div class="col-xs-6">
										<button class="btn btn-block btn-primary">Save</button>
									</div>
									<div class="col-xs-6">
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

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src='/static/calendar/js/moment.min.js'></script>
		<script src='/static/calendar/js/fullcalendar.js'></script>
		<script src="/static/js/delete.js"></script>
		<script>
			var events = [${tasks?join(",")}];
			var view = ${(view??)? string('\'${(view)!}\'', '\'\'')};
			var day = ${(day??)? string('\'${(day)!}\'', '\'\'')};
		</script>
		<script src="/static/js/task.js"></script>

	</body>
</html>
