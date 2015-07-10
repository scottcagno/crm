<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/"><i class="fa fa-cube"></i>&nbsp;CMS System</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right ">
				<!--<li><a href="/address">Address</a></li>
				<li><a href="/company">Company</a></li>
				<li><a href="/contact">Contact</a></li>
				<li><a href="/task/show/cal">Calendar</a></li>-->
				<li><a href="/secure/contact/view/${(contact.id)!}">Back To ${(contact.firstName)!}</a></li>
			</ul>
		</div>
	</div>
</nav>