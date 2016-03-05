var header;
$.ajax({
	url : PROTECTED_PORTAL_NAV_PAGE,
	crossDomain : true,
	cache : false,
	xhrFields : {
		withCredentials : true
	},
	success : function(data) {
		syncProtectedHeader();
		header=data;
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
			success : function(data) {
				syncUnprotectedHeader();
				header=data;
			}
		})
	},
	complete : function(jqXHR, textStatus) {
		$.get(window.location.href, "sync", function(content) {
			$("#pageHeader").html(header);
			$('body').append(content);
		},'html')
	}
})
