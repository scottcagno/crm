<!DOCTYPE html>
<html>
	<head lang="en">
		<#include "../stubs/header.ftl"/>
		<title>Contact</title>
	</head>
	<body>

		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/">Ninja CMS <i class="fa fa-cube"></i></a>
				</div>
				<div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right ">
						<li><a href="/address">Address</a></li>
						<li><a href="/company">Company</a></li>
						<li><a href="/contact">Contact</a></li>
						<li><a href="/task/show/cal">Calendar</a></li>
						<#if newDocuments?has_content>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">New Document<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<#list newDocuments as newDocument>
										<li><a href="/document/${(newDocument)!}/${(contact.id)!}">${(newDocument?upper_case)!}</a></li>
									</#list>
								</ul>
							</li>
						</#if>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<#include "../stubs/alert.ftl"/>
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
							${(contact.firstName)!} ${(contact.lastName)!}<br/>
							${(contact.address.street)!}<br/>
							${(contact.address.city)!} ${(contact.address.state)!}, ${(contact.address.zip)!}<br/>
							${(contact.phone)!}<br/>
							${(contact.email)!}<br/>
							<a href="/company/${(contact.company.id)!}">${(contact.company.name)!}</a>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="panel panel-default">
						<div class="panel-heading">Documents</div>
						<#if documents?has_content>
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Document Name</th>
										<th>Date Completed</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<#list documents as document>
										<tr>
											<td>${(document.name)!}</td>
											<td>${(document.completed)!}</td>
											<td><a href="/document/${(document.id)!}">View</a></td>
										</tr>
									</#list>
								</tbody>
							</table>
						<#else/>
							<div class="text-center panel-body">
								<div class="alert alert-info">
									<p class="lead">No Documents</p>
									<br/>
								</div>
							</div>
						</#if>
					</div>
				</div>
			</div>
			<#assign aDateTime = .now/>
		</div>

	</body>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="/static/js/main.js"></script>
	<script src="/static/js/delete.js"></script>
</html>