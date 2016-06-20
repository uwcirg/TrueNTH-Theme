<#assign trueNTHConnect=utilLocator.findUtil("TrueNTHConnect-portlet","trueNTHConnect") />
<#assign TrueNTHPortalRoleConstants=staticUtil["edu.uw.cirg.truenth.roles.TrueNTHPortalRoleConstants"] />

<#assign Maintenance=staticUtil["edu.uw.cirg.liferay.utils.Maintenance"] />

<#assign ssLocation=trueNTHConnect.getSsBaseURL(companyId) /> 

<#assign trueNTHConnectLoginURL = trueNTHConnect.getLoginUrl(companyId, 1, currentCompleteURL) />

<#assign trueNTH_nav_item_css_class = "btn-lg btn-tnth-primary" />