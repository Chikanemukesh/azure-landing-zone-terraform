# Azure Monitoring (Log Analytics, Application Insights, Action Group)
# Purpose: Infrastructure monitoring, logs aggregation aur alerting (cost-effective 30-day retention).

resource "azurerm_log_analytics_workspace" "law" {
  for_each = var.log_analytics_workspaces

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = coalesce(each.value.sku, "PerGB2018")
  retention_in_days   = coalesce(each.value.retention_in_days, 30)

  tags = each.value.tags
}

resource "azurerm_application_insights" "appi" {
  for_each = var.application_insights

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  workspace_id        = azurerm_log_analytics_workspace.law[each.value.workspace_key].id
  application_type    = coalesce(each.value.application_type, "web")

  tags = each.value.tags
}

resource "azurerm_monitor_action_group" "action_group" {
  for_each = var.action_groups

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  short_name          = each.value.short_name

  email_receiver {
    name          = coalesce(each.value.email_receiver_name, "admin")
    email_address = coalesce(each.value.email_address, "admin@contoso.com")
  }

  tags = each.value.tags
}
