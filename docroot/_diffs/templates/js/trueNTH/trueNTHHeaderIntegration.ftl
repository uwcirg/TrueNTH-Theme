<script>
	function syncProtectedHeader(){
		<#if !is_signed_in && !(session.getAttribute(TrueNTHConnectWebkeys.TRUENTH_ACCESS_TOKEN)??)>
			window.location.assign(LOGIN_URL);
		</#if>
	}
	
	function syncUnprotectedHeader(){
		<#if is_signed_in>
			window.location.assign(LOGOUT_URL);
		</#if>
	}
</script>