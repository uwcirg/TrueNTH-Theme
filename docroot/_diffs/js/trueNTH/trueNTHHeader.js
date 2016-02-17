$.ajax({
	url : PROTECTED_PORTAL_NAV_PAGE,
	crossDomain : true,
	cache : false,
	xhrFields : {
		withCredentials : true
	},
	success : function(data) {

		$("#pageHeader").prepend(data);
		syncProtectedHeader();

	},
	error : function(jqXHR, textStatus, errorThrown) {

		$.ajax({
			url : UNPROTECTED_PORTAL_NAV_PAGE,
			crossDomain : true,
			contentType : 'text/plain',
			data : {
				login_url : LOGIN_URL
			},
			success : function(data) {

				$("#pageHeader").prepend(data);
				syncUnprotectedHeader();

			}
		})
	},
	complete : function(jqXHR, textStatus) {
		$.get(window.location.href, "sync", function(data) {
			$("body").append(data);
		})
	}
})
