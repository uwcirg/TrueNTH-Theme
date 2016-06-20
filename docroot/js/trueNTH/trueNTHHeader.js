$.ajax({
	url : PORTAL_NAV_PAGE,
	crossDomain : true,
	cache : false,
	xhrFields : {
		withCredentials : true
	},
	data : (!isSignedIn) ? {
		login_url : LOGIN_URL
	} : undefined,
	success : function(header, textStatus, jqXHR) {

		$('#pageHeader').append(header);

		if (truenth_authenticated && !isSignedIn) {
			window.location.assign(LOGIN_URL);
		}
	}
});