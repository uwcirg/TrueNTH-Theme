<!DOCTYPE html>

<#include init />

<html class="trueNTH ${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>
	
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<meta charset="UTF-8">
	<meta name="author" content="Victor Soares">
	<meta name="description" content="TrueNTH Portal">
	<meta name="keywords" content="TrueNTH, Movember, CIRG">
	<meta name="viewport" content="initial-scale=1.0, width=device-width">

	${theme.include(top_head_include)}
	
	<#if !layoutGroup.isControlPanel()>
		<link href="${css_folder}/bootstrap-3.3.5/css/bootstrap3-iso.min.css" rel="stylesheet" />
		<link href="${css_folder}/font-awesome-4.4.0/css/font-awesome4-iso.min.css" rel="stylesheet" />
	    <link href="${csLocation}/static/css/topnav.css" rel="stylesheet" type="text/css" />
	    <link href="${csLocation}/static/css/liferay.css" rel="stylesheet" type="text/css" />
    </#if>
</head>

<body class="${css_class}">

<a href="#main-content" id="skip-to-content"><@liferay.language key="skip-to-content" /></a>

${theme.include(body_top_include)}

<#if !layoutGroup.isControlPanel()>
	<#if is_signed_in>
		<@liferay.dockbar />
	</#if>
</#if>

<div class="container-fluid" id="wrapper">
	<header id="banner" role="banner">
		<#if has_navigation || is_signed_in>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>
	</header>

	<div id="content">

		<#if selectable>
			${theme.include(content_include)}
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			${theme.wrapPortlet("portlet.ftl", content_include)}
		</#if>
	</div>

	<footer id="footer" role="contentinfo">
		<p class="powered-by">
			<@liferay.language key="powered-by" /> <a href="https://us.movember.com/programs/prostate-cancer" rel="external">TrueNTH USA</a> 
		</p>
	</footer>
</div>

${theme.include(body_bottom_include)}

${theme.include(bottom_include)}

<#if !layoutGroup.isControlPanel()>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<#include "${full_templates_path}/js/trueNTH/trueNTHDefinitions.ftl" />
	<#include "${full_templates_path}/js/trueNTH/trueNTHHeaderIntegration.ftl" />
	<script src="${javascript_folder}/trueNTH/trueNTHHeader.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</#if>
</body>
</html>