<head>
	${theme.include(top_head_include)}
</head>

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