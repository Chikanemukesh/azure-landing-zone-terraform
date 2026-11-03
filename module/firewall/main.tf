# Data Source: Existing Azure Firewall Subnet
# Purpose: AzureFirewallSubnet ki ID lookup karna.

data "azurerm_subnet" "firewall_subnet" {
  for_each = var.firewalls

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}


# Data Source: Existing Firewall Public IP
# Purpose: Firewall Public IP ki ID lookup karna.

data "azurerm_public_ip" "firewall_pip" {
  for_each = var.firewalls

  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}


# Azure Firewall
# Purpose: Network traffic ko inspect aur filter karna.

resource "azurerm_firewall" "firewall" {
  for_each = var.firewalls

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku_name = "AZFW_VNet"
  sku_tier = each.value.sku_tier

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.firewall_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.firewall_pip[each.key].id
  }

  tags = each.value.tags
}