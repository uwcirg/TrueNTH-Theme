jQuery(document).ajaxError(function(event, jqxhr, settings, exception) {
	if (jqxhr.status == 401) {
		console.log("401 caught");
	}
});

jQuery(document).ready(function() {
	var protected_xhr = jQuery.ajax({
		url : PROTECTED_PORTAL_NAV_PAGE,
		type : 'GET',
		contentType : 'text/plain',
		crossDomain : true,
		cache: false,
		async:true,
		xhrFields : {
			withCredentials : true
		},
	}, 'html')

	.done(function(data) {
		
		jQuery("#pageHeader").prepend(data);
		syncProtectedHeader();
		
	}).fail(function(jqXHR, textStatus, errorThrown) {

		var unprotected_xhr = jQuery.ajax({
			url : UNPROTECTED_PORTAL_NAV_PAGE,
			type : 'GET',
			contentType : 'text/plain',
			data: {login_url: LOGIN_URL },
			crossDomain : true,
			async:true
		}, 'html').done(function(data) {
			
			jQuery("#pageHeader").prepend(data);
			syncUnprotectedHeader();
			
		});
	});
});