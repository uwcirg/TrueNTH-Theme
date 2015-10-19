<#assign csLocation="https://truenth-dev.cirg.washington.edu" /> 
<#assign TrueNTHAssociationLocalService=serviceLocator.findService("TrueNTHConnect-portlet","edu.uw.cirg.truenth.sb.service.TrueNTHAssociationLocalService") />
<#assign trueNTHConnectUtil=utilLocator.findUtil("TrueNTHConnect-portlet","edu.uw.cirg.truenthconnect.TrueNTHConnectUtil")>

<#if themeDisplay.userId??>
	<#assign trueNTHAssociation=TrueNTHAssociationLocalService.getByUserId(themeDisplay.userId)!''>
	<#assign isTrueNTHUser=trueNTHAssociation?has_content>
	
	<#if isTrueNTHUser>
		<#assign trueNTHId=trueNTHAssociation.trueNTHId>
	</#if>
</#if>