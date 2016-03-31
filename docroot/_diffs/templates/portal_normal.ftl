<#include init />
<#if request.getParameter("sync")??>
	<#include "${full_templates_path}/portal_normal_content.ftl" />
<#else>
	<!DOCTYPE html>
		
	<html class="trueNTH ${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">
	
		<head>
			<title>${the_title} - ${company_name}</title>
			
			<meta charset="UTF-8">
			<meta name="author" content="Victor de Lima Soares">
			<meta name="description" content="TrueNTH Portal">
			<meta name="keywords" content="TrueNTH, Movember, CIRG">
			<meta name="viewport" content="initial-scale=1.0, width=device-width">
					
			${theme.include(top_head_include)}
			
			<link href="${csLocation}/static/css/portal.css" rel="stylesheet">
			
		</head>
		
		<body class="${css_class}">
		
			<#if showHeader>
				<header id="pageHeader"></header>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
				<#include "${full_templates_path}/js/trueNTH/trueNTHDefinitions.ftl" />
				<#include "${full_templates_path}/js/trueNTH/trueNTHHeaderIntegration.ftl" />
				<script src="${javascript_folder}/trueNTH/trueNTHHeader.js"></script>
			<#else>
				<#include "${full_templates_path}/portal_normal_content.ftl" />
			</#if>
			
		</body>
	</html>
</#if>