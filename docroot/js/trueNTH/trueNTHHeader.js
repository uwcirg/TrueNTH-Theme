PROTECTED_PORTAL_NAV_PAGE = "https://truenth-demo.cirg.washington.edu/api/protected-portal-wrapper-html";
UNPROTECTED_PORTAL_NAV_PAGE = "https://truenth-demo.cirg.washington.edu/api/portal-wrapper-html/";
PORTAL_HOSTNAME  = new URL(UNPROTECTED_PORTAL_NAV_PAGE).hostname;

jQuery( document ).ajaxError(function( event, jqxhr, settings, exception ) {
    if ( jqxhr.status== 401 ) {
        console.log("401 caught");
    }
});

jQuery(document).ready(function () {
    var protected_xhr = jQuery.ajax({
        url: PROTECTED_PORTAL_NAV_PAGE,
        type: 'GET',
        contentType: 'text/plain',
        crossDomain: true,
        xhrFields: {withCredentials: true},
    }, 'html')
        .done(function (data) {
            jQuery("body").prepend(data);
            $(".tnth-nav-wrapper").addClass( "bootstrap-3 font-awesome-4" );
        })
        .fail(function (jqXHR, textStatus, errorThrown) {

            console.log("Error loading nav elements from " + PORTAL_HOSTNAME);
            console.log("falling back to unauth");

            var unprotected_xhr = jQuery.ajax({
                url: UNPROTECTED_PORTAL_NAV_PAGE,
                type: 'GET',
                contentType: 'text/plain',
                crossDomain: true,
            }, 'html')
                .done(function (data) {
                	jQuery("body").prepend(data);
                	$(".tnth-nav-wrapper").addClass( "bootstrap-3 font-awesome-4" );
                    console.log("unprotected_xhr success");
                })
                .fail(function (jqXHR, textStatus, errorThrown) {});
        });
});