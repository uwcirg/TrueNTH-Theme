$.ajax({
	url : PROTECTED_PORTAL_NAV_PAGE,
	crossDomain : true,
	cache : false,
	xhrFields : {
		withCredentials : true
	},
	success : function(header, textStatus, jqXHR) {
		syncProtectedHeader();
		$('#pageHeader').append(header);
	},
	error : function(jqXHR, textStatus, errorThrown) {

		$.ajax({
			url : UNPROTECTED_PORTAL_NAV_PAGE,
			crossDomain : true,
			async: false,
			dataType: "html",
			contentType : 'text/plain',
			data : {
				login_url : LOGIN_URL
			},
			success : function(header) {
				syncUnprotectedHeader();
				$('#pageHeader').append(header);
			}
		});
	},
	complete : function(jqXHR, textStatus) {
		
		$.ajax({
			url : CURRENT_URL,
			dataType: "html",
			contentType : 'text/plain',
			data : {
				sync : true
			},
			success : function(content) {
				$('body').append(content);
			}
		});
	}
});

