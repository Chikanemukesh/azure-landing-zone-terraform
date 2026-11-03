# Azure Public IP Address
# Purpose: Create Public IP for Azure Firewall, NAT Gateway, etc.

resource "azurerm_public_ip" "public_ip" {
  for_each = var.public_ips

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  allocation_method = each.value.allocation_method
  sku               = each.value.sku
  sku_tier          = each.value.sku_tier

  ip_version = each.value.ip_version

  tags = each.value.tags
}