<#if session.getAttribute(Maintenance.PRIVATE_BLOCKED)?? >
	
	${session.removeAttribute(Maintenance.PRIVATE_BLOCKED)}
	
	<div id="maintenanceAlert" class="alert alert-danger">
    	${languageUtil.get(locale, "server-in-maintenance-mode-private-content-unavailable")}
	</div>
	
	<script type="text/javascript">
		YUI().use(
		  'aui-alert',
		  function(Y) {
		    new Y.Alert(
		      {
		        closeable: true,
		        render: true,
		        srcNode: '#maintenanceAlert'
		      }
		    );
		  }
		);
	</script>
</#if>
