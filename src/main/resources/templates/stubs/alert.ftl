<div class="navbar-padding">
	<#if alert??>
		<div id="alert" class="container-fluid">
			<div class="alert alert-info alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alert}
			</div>
		</div>
		<#elseif alertError??/>
		<div id="alert" class="container-fluid">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alertError}
			</div>
		</div>
		<#elseif alertSuccess??/>
		<div id="alert" class="container-fluid">
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alertSuccess}
			</div>
		</div>
	</#if>
</div>