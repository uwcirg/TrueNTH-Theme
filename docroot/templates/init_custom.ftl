<#include "${full_templates_path}/portal_init.ftl" />
<#include "${full_templates_path}/truenth_init.ftl" />

${themeDisplay.setShowSignOutIcon(false)}

<#assign control_panel_category = htmlUtil.escape(themeDisplay.getControlPanelCategory()) />
<#assign showHeader = !layoutGroup.isControlPanel() || control_panel_category != "my" || !getterUtil.getBoolean(propsUtil.get("dockbar.administrative.links.show.in.pop.up"))>
<#assign showDockBar = is_signed_in && showHeader && (RoleLocalService.hasUserRole(userId, companyId, TrueNTHPortalRoleConstants.DOCK_BAR_USER, true) || permissionChecker.isOmniadmin())>

<#if showDockBar>
	<#assign contentClass = "withDock" />
</#if>