<#assign liferay_portlet=PortalJspTagLibs["http://liferay.com/tld/portlet"]>

<#assign PortletKeys=staticUtil["com.liferay.portal.util.PortletKeys"]>

<#assign RoleLocalService=serviceLocator.findService("com.liferay.portal.service.RoleLocalService") />

<#assign userId = themeDisplay.userId />
<#assign companyId = themeDisplay.companyId />

<#assign session = request.session />
<#assign layoutGroup = layout.group />