<div class="navbar-padding">
	<#if alert??>
		<div class="alert alert-info alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			${alert}
		</div>
	<#elseif alertError??/>
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			${alertError}
		</div>
	<#elseif alertSuccess??/>
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			${alertSuccess}
		</div>
	</#if>
</div>