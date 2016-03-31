${theme.include(top_body_js)}

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
	 <a href="http://us.movember.com" title="Movember"><img id="footerLockup" src="${csLocation}/static/img/logo_movember_lockup.png"></a>
</footer>

${theme.include(body_bottom_include)}
	
${theme.include(bottom_include)}
