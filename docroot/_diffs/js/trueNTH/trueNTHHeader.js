jQuery.ajax({
	url : PROTECTED_PORTAL_NAV_PAGE,
	crossDomain : true,
	cache : false,
	async : true,
	xhrFields : {
		withCredentials : true
	},
	success : function(data) {

		jQuery("#pageHeader").prepend(data);
		syncProtectedHeader();

	},
	error : function(jqXHR, textStatus, errorThrown) {

		jQuery.ajax({
			url : UNPROTECTED_PORTAL_NAV_PAGE,
			crossDomain : true,
			contentType : 'text/plain',
			data : {
				login_url : LOGIN_URL
			},
			success : function(data) {

				jQuery("#pageHeader").prepend(data);
				syncUnprotectedHeader();

			}
		})
	}
})
