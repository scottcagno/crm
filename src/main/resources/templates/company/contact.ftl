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

	</body>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="/static/js/main.js"></script>
	<script src="/static/js/delete.js"></script>
</html>