<script type="text/javascript">
	function syncProtectedHeader(){
		<#if !is_signed_in>
			window.location.replace(LOGIN_URL);
		</#if>
	}
	function syncUnprotectedHeader(){
		<#if is_signed_in>
			window.location.replace(LOGOUT_URL);
		</#if>
	}
</script>