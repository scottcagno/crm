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
							<a href="/secure/address" class="pull-right btn btn-xs btn-default">Clear</a>
						</div>
						<div class="panel-body">
							<form action="/admin/user" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="username" placeholder="Email" value="${(user.username)!}"/>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" name="password" placeholder="Password" value="${(user.password)!}"/>
								</div>
								<div class="form-group">
									<select name="role" class="form-control"></select>
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="form-group">
									<button class="btn btn-block btn-primary">Save</button>
								</div>
								<#if address??>
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
						<div class="panel-heading">Addresses</div>
						<#if addresses?has_content>
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Street</th>
										<th>City</th>
										<th>State</th>
										<th>Zip</th>
									</tr>
								</thead>
								<tbody>
									<#list addresses as address>
										<tr>
											<td class="text-center"><a href="/secure/address/${(address.id)!}" class="btn btn-xs btn-primary">${(address.id)!}</a></td>
											<td>${(address.street)!}</td>
											<td>${(address.city)!}</td>
											<td>${(address.state)!}</td>
											<td>${(address.zip)!}</td>
										</tr>
									</#list>
								</tbody>
							</table>
						<#else/>
							<div class="text-center panel-body">
								<div class="alert alert-info">
									<p class="lead">No Addresses</p>
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