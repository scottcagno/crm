<!DOCTYPE html>
<html>
	<head lang="en">
		<meta charset="UTF-8">
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="/static/css/main.css"/>
		<title>Contact</title>
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
				Are you sure you would like to permanently delete this contact?
			</div>
			<div class="row">
				<div class="col-lg-3">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							Contact
						</div>
						<div class="panel-body">
							<p><label>Name:</label> ${(company.name)!}</p>
							<p><label>Street:</label> ${(company.address.state)!}</p>
							<p><label>City:</label> ${(company.address.city)!}</p>
							<p><label>State:</label> ${(company.address.state)!}</p>
							<p><label>Zip:</label> ${(company.address.zip)!}</p>
							<p><label>Phone:</label> ${(company.phone)!}</p>
							<p><label>Fax:</label> ${(company.fax)!}</p>
							<p><label>Website:</label> ${(company.website)!}</p>
							<p><label>Description:</label> ${(company.description)!}</p>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="panel panel-default">
						<div class="panel-heading">Contacts</div>
						<#if company.contacts?has_content>
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Address</th>
										<th>Phone</th>
										<th>Email</th>
										<th>Company</th>
										<th>Description</th>
									</tr>
								</thead>
								<tbody>
									<#list company.contacts as contact>
										<tr>
											<td class="text-center"><a href="/contact/${(contact.id)!}" class="btn btn-xs btn-primary">${(contact.id)!}</a></td>
											<td>${(contact.firstName)!}</td>
											<td>${(contact.lastName)!}</td>
											<td><a href="/address/${(contact.addresss.id)!}">${(contact.address.street)!}</a></td>
											<td>${(contact.phone)!}</td>
											<td>${(contact.email)!}</td>
											<td><a href="/company/${(company.contact.company.id)!}">${(contact.company.name)!}</a></td>
											<td>${(contact.description)!}</td>
										</tr>
									</#list>
								</tbody>
							</table>
						<#else/>
							<div class="text-center panel-body">
								<div class="alert alert-info">
									<p class="lead">No contacts</p>
									<br/>
								</div>
							</div>
						</#if>
					</div>
				</div>
			</div>
		</div>

		<!-- address model -->
		<div class="modal fade" id="addressModal" tabindex="-1">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Add Address</h4>
					</div>
					<div class="modal-body clearfix">
						<div class="col-lg-offset-2 col-lg-8">
							<form action="/address" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="street" placeholder="Street" value="${(address.street)!}"/>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="city" placeholder="City" value="${(address.city)!}"/>
								</div>
								<div class="form-group row">
									<div class="col-xs-6">
										<input type="text" class="form-control" name="state" placeholder="ST" value="${(address.state)!}"/>
									</div>
									<div class="col-xs-6">
										<input type="text" class="form-control" name="zip" placeholder="Zip" value="${(address.zip)!}"/>
									</div>
								</div>
								<input type="hidden" name="redirect" value="/contact${(contact??)?string('/${(contact.id)!}', '')}"/>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="form-group">
									<button class="btn btn-block btn-primary">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- company model -->
		<div class="modal fade" id="companyModal" tabindex="-1">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Add Company</h4>
					</div>
					<div class="modal-body clearfix">
						<div class="col-lg-offset-2 col-lg-8">
							<form action="/company" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="name" placeholder="Name"/>
								</div>
								<div class="form-group">
									<label>Select Address</label>
									<select class="form-control" name="addressId">
										<option value="0"></option>
										<#list addresses as address>
											<option value="${(address.id)!}">${address.street}</option>
										</#list>
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="phone" placeholder="Phone"/>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="fax" placeholder="Fax"/>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="website" placeholder="Website"/>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="description" placeholder="Description"/>
								</div>
								<input type="hidden" name="redirect" value="/contact${(contact??)?string('/${(contact.id)!}', '')}"/>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="form-group">
									<button class="btn btn-block btn-primary">Save</button>
								</div>
							</form>
						</div>
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