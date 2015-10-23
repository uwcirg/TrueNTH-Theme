<#include "${full_templates_path}/portal_init.ftl" />

<#assign TrueNTHAssociationLocalService=serviceLocator.findService("TrueNTHConnect-portlet","edu.uw.cirg.truenth.sb.service.TrueNTHAssociationLocalService") />
<#assign trueNTHConnect=utilLocator.findUtil("TrueNTHConnect-portlet","trueNTHConnect") />
<#assign TrueNTHOAuthConstants=staticUtil["edu.uw.cirg.truenth.oauth.model.definitions.TrueNTHOAuthConstants"] />
<#assign callbackParameters=objectUtil("org.scribe.model.ParameterList") />

<#assign csLocation=trueNTHConnect.getCSBaseURL(themeDisplay.companyId) /> 

${callbackParameters.add(TrueNTHOAuthConstants.REDIRECT, portalUtil.getCurrentCompleteURL(request))}	
<#assign trueNTHConnectLoginURL = trueNTHConnect.getAuthorizationUrl(themeDisplay.companyId,1, callbackParameters) />

<#assign trueNTHConnectLogoutURL = themeDisplay.getURLSignOut() >

<#if themeDisplay.userId??>
	<#assign trueNTHAssociation=TrueNTHAssociationLocalService.getByUserId(themeDisplay.userId)!''>
	<#assign isTrueNTHUser=trueNTHAssociation?has_content>
	
	<#if isTrueNTHUser>
		<#assign trueNTHId=trueNTHAssociation.trueNTHId>
	</#if>
</#if>