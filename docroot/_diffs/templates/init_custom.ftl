<#include "${full_templates_path}/portal_init.ftl" />

<#assign TrueNTHAssociationLocalService=serviceLocator.findService("TrueNTHConnect-portlet","edu.uw.cirg.truenth.sb.service.TrueNTHAssociationLocalService") />
<#assign trueNTHConnect=utilLocator.findUtil("TrueNTHConnect-portlet","trueNTHConnect") />
<#assign TrueNTHOAuthConstants=staticUtil["edu.uw.cirg.truenth.oauth.model.definitions.TrueNTHOAuthConstants"] />
<#assign TrueNTHPortalRoleConstants=staticUtil["edu.uw.cirg.truenth.roles.TrueNTHPortalRoleConstants"] />

<#assign callbackParameters=objectUtil("org.scribe.model.ParameterList") />

<#assign csLocation=trueNTHConnect.getCSBaseURL(companyId) /> 

${callbackParameters.add(TrueNTHOAuthConstants.REDIRECT, portalUtil.getCurrentCompleteURL(request))}	
<#assign trueNTHConnectLoginURL = trueNTHConnect.getAuthorizationUrl(companyId,1, callbackParameters) />

<#assign trueNTHConnectLogoutURL = themeDisplay.getURLSignOut() />

<#if userId??>
	<#assign trueNTHAssociation=TrueNTHAssociationLocalService.getByUserId(userId)!'' />
	<#assign isTrueNTHUser=trueNTHAssociation?has_content />
	
	<#if isTrueNTHUser>
		<#assign trueNTHId=trueNTHAssociation.trueNTHId />
	</#if>
</#if>

<#assign layoutGroup = layout.getGroup()>

${themeDisplay.setShowSignOutIcon(false)}

<#assign control_panel_category = htmlUtil.escape(themeDisplay.getControlPanelCategory()) />
<#assign showHeader = !layoutGroup.isControlPanel() || control_panel_category != "my" || !getterUtil.getBoolean(propsUtil.get("dockbar.administrative.links.show.in.pop.up"))>
<#assign showDockBar = is_signed_in && showHeader && (RoleLocalService.hasUserRole(userId, companyId, TrueNTHPortalRoleConstants.DOCK_BAR_USER, true) || permissionChecker.isOmniadmin())>

<#if showDockBar>
	<#assign contentClass = "withDock" />
</#if>