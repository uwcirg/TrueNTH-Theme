<#assign TrueNTHAssociationLocalService=serviceLocator.findService("TrueNTHConnect-portlet","edu.uw.cirg.truenth.sb.service.TrueNTHAssociationLocalService") />
<#assign trueNTHConnect=utilLocator.findUtil("TrueNTHConnect-portlet","trueNTHConnect") />
<#assign TrueNTHOAuthConstants=staticUtil["edu.uw.cirg.truenth.oauth.model.definitions.TrueNTHOAuthConstants"] />
<#assign TrueNTHPortalRoleConstants=staticUtil["edu.uw.cirg.truenth.roles.TrueNTHPortalRoleConstants"] />
<#assign Maintenance=staticUtil["edu.uw.cirg.liferay.utils.Maintenance"] />

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