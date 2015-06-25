<!DOCTYPE html>
<html>
	<head lang="en">
		<meta charset="UTF-8">
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="/static/css/main.css"/>
		<title>Company</title>
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
				Are you sure you would like to permanently delete this company?
			</div>
			<div class="row">
				<div class="col-lg-3">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							Company
							<a href="/company" class="pull-right btn btn-xs btn-default">Clear</a>
						</div>
						<div class="panel-body">
							<form action="/company" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="name" placeholder="Name" value="${(company.name)!}"/>
								</div>
								<div class="form-group">
									<label>Select Address</label>
									<select class="form-control" name="addressId">
										<option value="0"></option>
										<#list addresses as address>
											<option value="${(address.id)!}" ${(company?? && company.address.id == address.id)?string('selected', '')}>${address.street}</option>
										</#list>
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="phone" placeholder="Phone" value="${(company.phone)!}"/>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="fax" placeholder="Fax" value="${(company.fax)!}"/>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="website" placeholder="Website" value="${(company.website)!}"/>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="description" placeholder="Description" value="${(company.description)!}"/>
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="form-group">
									<button class="btn btn-block btn-primary">Save</button>
								</div>
								<#if company??>
									<input type="hidden" name="id" value="${(company.id)!}"/>
									<div class="form-group">
										<a href="/company/${(company.id)!}/contact" class="btn btn-success btn-block">View Contacts</a>
									</div>
									<div class="form-group">
										<a href="#" id="deleteButton" data-delete="/company/${(company.id)!}" class="btn btn-danger btn-block">Delete</a>
									</div>
								</#if>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="panel panel-default">
						<div class="panel-heading">Companies</div>
						<#if companies?has_content>
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Name</th>
										<th>Address</th>
										<th>Phone</th>
										<th>Fax</th>
										<th>Website</th>
										<th>Description</th>
									</tr>
								</thead>
								<tbody>
									<#list companies as company>
										<tr>
											<td class="text-center"><a href="/company/${(company.id)!}" class="btn btn-xs btn-primary">${(company.id)!}</a></td>
											<td>${(company.name)!}</td>
											<td><a href="/address/${(company.address.id)!}">${(company.address.street)!}</a></td>
											<td>${(company.phone)!}</td>
											<td>${(company.fax)!}</td>
											<td><a href="${(company.website?? && company.website?starts_with('http://')) ? string ((company.website)!,'http://${(company.website)!}')}" target="_blank">${(company.website)!}</a></td>
											<td>${(company.description)!}</td>
										</tr>
									</#list>
								</tbody>
							</table>
						<#else/>
							<div class="text-center panel-body">
								<div class="alert alert-info">
									<p class="lead">No Companies</p>
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