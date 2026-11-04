# Azure Private DNS Zone
# Purpose: Private network ke andar custom domain / Private Link ke liye internal DNS resolution provide karna.

resource "azurerm_private_dns_zone" "zone" {
  for_each = var.private_dns_zones

  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  tags = each.value.tags
}

data "azurerm_virtual_network" "vnet_lookup" {
  for_each = var.vnet_links

  name                = each.value.virtual_network_name
  resource_group_name = each.value.vnet_resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link" {
  for_each = var.vnet_links

  name                  = each.value.name
  private_dns_zone_id   = azurerm_private_dns_zone.zone[each.value.private_dns_zone_key].id
  virtual_network_id    = data.azurerm_virtual_network.vnet_lookup[each.key].id
  registration_enabled  = coalesce(each.value.registration_enabled, false)

  tags       = each.value.tags
}
