output "log_analytics_workspace_ids" {
  description = "Map of Log Analytics Workspace IDs"
  value       = { for k, v in azurerm_log_analytics_workspace.log_analytics_workspace : k => v.id }
}

output "log_analytics_workspace_names" {
  description = "Map of Log Analytics Workspace names"
  value       = { for k, v in azurerm_log_analytics_workspace.log_analytics_workspace : k => v.name }
}

output "log_analytics_workspace_workspace_ids" {
  description = "Map of Log Analytics Workspace workspace_ids"
  value       = { for k, v in azurerm_log_analytics_workspace.log_analytics_workspace : k => v.workspace_id }
}

output "log_analytics_workspace_primary_shared_keys" {
  description = "Map of Log Analytics Workspace primary shared keys"
  value       = { for k, v in azurerm_log_analytics_workspace.log_analytics_workspace : k => v.primary_shared_key }
  sensitive   = true
}

output "log_analytics_workspace_secondary_shared_keys" {
  description = "Map of Log Analytics Workspace secondary shared keys"
  value       = { for k, v in azurerm_log_analytics_workspace.log_analytics_workspace : k => v.secondary_shared_key }
  sensitive   = true
}
