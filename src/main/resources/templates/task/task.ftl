<!DOCTYPE html>
<html>
	<head lang="en">
		<meta charset="UTF-8">
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="/static/css/main.css"/>
		<title>Task</title>
	</head>
	<body>
		<#include "../stubs/navbar.ftl"/>
		<#include "../stubs/alert.ftl"/>
		<div class="container-fluid">
			<!-- delete object alert -->
			<div id="deleteAlert" class="alert alert-danger clearfix hide">
				<form id="deleteForm" action="" method="post" class="col-lg-2">
					<button id="delete" class="btn btn-danger btn-sm">Yes</button>
					<a id="deleteCancel" class="btn btn-default btn-sm">No</a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
				Are you sure you would like to permanently delete this task?
			</div>
			<div class="row">
				<div class="col-lg-3">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							Task
							<a href="/task" class="pull-right btn btn-xs btn-default">Clear</a>
						</div>
						<div class="panel-body">
							<form action="/task" method="post" class="form-horizontal">
								<div class="form-group">
									<label class="control-label col-xs-3">Name</label>
									<div class="col-xs-9">
										<input class="form-control" type="text" name="name" placeholder="Name" value=""/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">Date</label>
									<div class="col-xs-9">
										<input class="form-control" type="date" name="date" placeholder="Date" value=""/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">Customer</label>
									<div class="col-xs-9">
										<select class="form-control" name="contactId">
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
										<select name="priority" class="form-control">
											<option value="0">Low</option>
											<option value="1">Medium</option>
											<option value="2">High</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">Status</label>
									<div class="col-xs-9">
										<select name="status" class="form-control">
											<option value="0">Open</option>
											<option value="1">Closed</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-12">Description</label>
									<div class="col-xs-12">
										<textarea name="description" class="form-control" rows="5"></textarea>
									</div>
								</div>
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
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="form-group">
									<button class="btn btn-block btn-primary">Save</button>
								</div>
								<#if task??>
									<input type="hidden" name="id" value="${(task.id)!}"/>
									<div class="form-group">
										<a href="#" id="deleteButton" data-delete="/task/${(task.id)!}" class="btn btn-danger btn-block">Delete</a>
									</div>
								</#if>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="panel panel-default">
						<div class="panel-heading">Task</div>
						<#if tasks?has_content>
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Date</th>
									</tr>
								</thead>
								<tbody>
									<#list tasks as task>
										<tr>
											<td class="text-center"><a href="/task/${(task.id)!}" class="btn btn-xs btn-primary">${(task.id)!}</a></td>
											<td>${(task.date?date)!}</td>
										</tr>
									</#list>
								</tbody>
							</table>
						<#else/>
							<div class="text-center panel-body">
								<div class="alert alert-info">
									<p class="lead">No Tasks</p>
									<br/>
								</div>
							</div>
						</#if>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="/static/js/main.js"></script>
	<script src="/static/js/delete.js"></script>
</html>