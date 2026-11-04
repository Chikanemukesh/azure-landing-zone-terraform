output "application_gateways" {
  description = "Map of application gateways"
  value       = azurerm_application_gateway.appgw
}

output "appgw_ids" {
  description = "Map of application gateway IDs"
  value       = { for k, v in azurerm_application_gateway.appgw : k => v.id }
}
