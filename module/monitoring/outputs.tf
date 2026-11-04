output "workspace_ids" {
  description = "Map of Log Analytics workspace IDs"
  value       = { for k, v in azurerm_log_analytics_workspace.law : k => v.id }
}

output "application_insights_ids" {
  description = "Map of Application Insights IDs"
  value       = { for k, v in azurerm_application_insights.appi : k => v.id }
}

output "application_insights_instrumentation_keys" {
  description = "Map of Application Insights instrumentation keys"
  value       = { for k, v in azurerm_application_insights.appi : k => v.instrumentation_key }
  sensitive   = true
}

output "action_group_ids" {
  description = "Map of Monitor Action Group IDs"
  value       = { for k, v in azurerm_monitor_action_group.action_group : k => v.id }
}
