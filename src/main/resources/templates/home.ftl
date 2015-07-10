<!DOCTYPE html>
<html>
	<head lang="en">
		<#include "stubs/header.ftl"/>
		<title>Home</title>
	</head>
	<body>
		<#include "stubs/navbar.ftl"/>
		<#include "stubs/alert.ftl"/>
		<div class="text-center">
			<div class="text-center">
				<img src="/static/img/cns-logo-lg.png" alt="CNS Truck Licensing Logo"/>
			</div>
			<br/>
			<div class="col-lg-offset-2 col-lg-8">
				<h3>
					<div class="col-lg-4">
						<div class="mute-contents">
							<a href="/secure/company">
								<i class="fa fa-4x fa-building-o logo-primary"></i>
								<br/><br/>
								Company
							</a>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="mute-contents">
							<a href="/secure/contact">
								<i class="fa fa-4x fa-user logo-primary"></i>
								<br/><br/>
								Contact
							</a>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="mute-contents">
							<a href="/secure/task">
								<i class="fa fa-4x fa-calendar logo-primary"></i>
								<br/><br/>
								Calendar
							</a>
						</div>
					</div>
				</h3>
			</div>
		</div>
	</body>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!--<script src="/static/js/main.js"></script>-->
</html>