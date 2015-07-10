<!DOCTYPE html>
<html>
	<head lang="en">
		<#include "stubs/header.ftl"/>
		<title>Ninja CMS</title>
	</head>
	<body>
		<#include "stubs/alert.ftl"/>
		<div class="container">
			<div class="row">
				<br/><br/>
				<div class="col-lg-offset-4 col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">Login</div>
						<div class="panel-body">
							<form action="/login" method="post">
								<div class="form-group">
									<input type="text" name="username" class="form-control" placeholder="Email"/>
								</div>
								<div class="form-group">
									<input type="password" name="password" class="form-control" placeholder="Password"/>
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button class="btn btn-block btn-primary">Login</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</html>