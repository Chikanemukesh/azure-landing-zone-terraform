output "private_dns_zones" {
  description = "Map of created private DNS zones"
  value       = azurerm_private_dns_zone.zone
}

output "private_dns_zone_ids" {
  description = "Map of private DNS zone IDs"
  value       = { for k, v in azurerm_private_dns_zone.zone : k => v.id }
}
