<!DOCTYPE html>
<html>
	<head lang="en">
		<#include "../stubs/header.ftl"/>
		<title>Address</title>
	</head>
	<body>
		<#include "../stubs/navbar.ftl"/>
		<div class="container-fluid">
			<#include "../stubs/alert.ftl"/>
			<!-- delete object alert -->
			<div id="deleteAlert" class="alert alert-danger clearfix hide">
				<form id="deleteForm" action="" method="post" class="col-lg-2">
					<button id="delete" class="btn btn-danger btn-sm">Yes</button>
					<a id="deleteCancel" class="btn btn-default btn-sm">No</a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
				Are you sure you would like to permanently delete this user?
			</div>
			<div class="row">
				<div class="col-lg-3">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							Address
							<a href="/admin/user" class="pull-right btn btn-xs btn-default">Clear</a>
						</div>
						<div class="panel-body">
							<form action="/admin/user" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="username" placeholder="Email" value="${(user.username)!}"/>
								</div>
								<#if user??>
									<div class="text-center">
										<a data-toggle="collapse" data-parent="#accordion"
										   href="#changePassword" class="text-primary">
											Click to change password
										</a>
									</div>
									<br/>
									<div id="changePassword" class="panel-collapse collapse">
										<!-- toggle show password input -->
										<div class="form-group">
											<div class="input-group">
												<input type="password" id="toggle-pass" name="password" class="form-control"
													   placeholder="Password" />
												<span class="input-group-btn">
													<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"
															title="Click to show/hide your password">
														<i class="fa fa-eye-slash"></i>
													</button>
												</span>
											</div>
										</div>
										<!-- toggle show password input -->
									</div>
								<#else/>
									<!-- toggle show password input -->
									<div class="form-group">
										<div class="input-group">
											<input type="password" id="toggle-pass" name="password" class="form-control"
												   placeholder="Password" />
											<span class="input-group-btn">
												<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"
														title="Click to show/hide your password">
													<i class="fa fa-eye-slash"></i>
												</button>
											</span>
										</div>
									</div>
									<!-- toggle show password input -->
								</#if>
								<div class="form-group">
									<label>Role</label>
									<select name="role" class="form-control">
										<option value="ROLE_USER">User</option>
										<option value="ROLE_ADMIN">Admin</option>
									</select>
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="form-group">
									<button class="btn btn-block btn-primary">Save</button>
								</div>
								<#if user??>
									<input type="hidden" name="id" value="${(user.id)!}"/>
									<div class="form-group">
										<a href="#" id="deleteButton" data-delete="/admin/user/${(user.id)!}" class="btn btn-danger btn-block">Delete</a>
									</div>
								</#if>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="panel panel-default">
						<div class="panel-heading">Users</div>
						<#if users?has_content>
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Email</th>
										<th>Role</th>
									</tr>
								</thead>
								<tbody>
									<#list users as user>
										<tr>
											<td class="text-center"><a href="/admin/user/${(user.id)!}" class="btn btn-xs btn-primary">${(user.id)!}</a></td>
											<td>${(user.username)!}</td>
											<td>${(user.role)!}</td>
										</tr>
									</#list>
								</tbody>
							</table>
						<#else/>
							<div class="text-center panel-body">
								<div class="alert alert-info">
									<p class="lead">No Users</p>
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
	<script src="/static/js/password.js"></script>
</html>