output "private_endpoints" {
  description = "Map of created private endpoints"
  value       = azurerm_private_endpoint.private_endpoint
}

output "private_endpoint_ids" {
  description = "Map of private endpoint IDs"
  value       = { for k, v in azurerm_private_endpoint.private_endpoint : k => v.id }
}
