<#assign TrueNTHAssociationLocalService=serviceLocator.findService("TrueNTHConnect-portlet","edu.uw.cirg.truenth.sb.service.TrueNTHAssociationLocalService") />
<#assign trueNTHConnect=utilLocator.findUtil("TrueNTHConnect-portlet","trueNTHConnect") />
<#assign TrueNTHOAuthConstants=staticUtil["edu.uw.cirg.truenth.oauth.model.definitions.TrueNTHOAuthConstants"] />
<#assign TrueNTHPortalRoleConstants=staticUtil["edu.uw.cirg.truenth.roles.TrueNTHPortalRoleConstants"] />
<#assign TrueNTHConnectWebkeys=staticUtil["edu.uw.cirg.truenthconnect.config.TrueNTHConnectWebkeys"] />
<#assign Maintenance=staticUtil["edu.uw.cirg.liferay.utils.Maintenance"] />

<#assign callbackParameters=objectUtil("org.scribe.model.ParameterList") />

<#assign csLocation=trueNTHConnect.getSsBaseURL(companyId) /> 

${callbackParameters.add(TrueNTHOAuthConstants.REDIRECT, currentCompleteURL)}	
<#assign trueNTHConnectLoginURL = trueNTHConnect.getAuthorizationUrl(companyId,1, callbackParameters) />

<#if userId??>
	<#assign trueNTHAssociation=TrueNTHAssociationLocalService.getByUserId(userId)!'' />
	<#assign isTrueNTHUser=trueNTHAssociation?has_content />
	
	<#if isTrueNTHUser>
		<#assign trueNTHId=trueNTHAssociation.trueNTHId />
	</#if>
</#if>

<#assign trueNTH_nav_item_css_class = "btn-lg btn-tnth-primary" />