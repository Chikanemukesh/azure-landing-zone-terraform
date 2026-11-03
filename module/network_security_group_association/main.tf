data "azurerm_subnet" "subnet_lookup" {
  for_each = var.nsg_subnet_associations

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_network_security_group" "nsg_lookup" {
  for_each = var.nsg_subnet_associations

  name                = each.value.nsg_name
  resource_group_name = each.value.nsg_resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "association" {
  for_each = var.nsg_subnet_associations

  subnet_id = data.azurerm_subnet.subnet_lookup[each.key].id

  network_security_group_id = data.azurerm_network_security_group.nsg_lookup[each.key].id
}