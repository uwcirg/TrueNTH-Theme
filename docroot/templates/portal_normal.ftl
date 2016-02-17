<!DOCTYPE html>

<#include init />

<html class="trueNTH ${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

	<head>
		<title>${the_title} - ${company_name}</title>
		
		<meta charset="UTF-8">
		<meta name="author" content="Victor de Lima Soares">
		<meta name="description" content="TrueNTH Portal">
		<meta name="keywords" content="TrueNTH, Movember, CIRG">
		<meta name="viewport" content="initial-scale=1.0, width=device-width">
	
		${theme.include(top_head_include)}
		
		<#if showHeader>
			<link href="${css_folder}/bootstrap-3.3.5/css/bootstrap3.css" rel="stylesheet" />
			<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
		    <link href="${csLocation}/static/css/liferay.css" rel="stylesheet" type="text/css" />
	    </#if>
	</head>
	
	<body class="${css_class}">
		<#if showHeader>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
			<#include "${full_templates_path}/js/trueNTH/trueNTHDefinitions.ftl" />
			<#include "${full_templates_path}/js/trueNTH/trueNTHHeaderIntegration.ftl" />
			<script src="${javascript_folder}/trueNTH/trueNTHHeader.js"></script>
		</#if>
	
		<header id="pageHeader" class="bootstrap-3"></header>
		
		<main id="pageContent" class="${contentClass!""}">
		
			${theme.include(body_top_include)}
			
			<#if showDockBar>
					<@liferay.dockbar />
			</#if>
			
			<div class="container-fluid" id="wrapper">
				<header id="banner" role="banner">
					<#if has_navigation || is_signed_in>
						<#include "${full_templates_path}/navigation.ftl" />
					</#if>
				</header>
			
				<div id="content">
					
					<#include "${full_templates_path}/messages.ftl" />
					
					<#if selectable>
						${theme.include(content_include)}
					<#else>
						${portletDisplay.recycle()}
			
						${portletDisplay.setTitle(the_title)}
			
						${theme.wrapPortlet("portlet.ftl", content_include)}
					</#if>
				</div>
			
			</div>
				
		</main>
		
		<footer id="footer" role="contentinfo">
			<p class="powered-by">
				<@liferay.language key="powered-by" /> <a href="https://us.movember.com/programs/prostate-cancer" rel="external">TrueNTH USA</a> 
			</p>
		</footer>
		
		${theme.include(body_bottom_include)}
			
		${theme.include(bottom_include)}
		
		<#if showHeader>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		</#if>
	
	</body>
</html>