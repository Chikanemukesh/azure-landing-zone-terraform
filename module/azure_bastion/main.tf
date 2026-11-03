resource "azurerm_subnet" "bastion" {
  for_each = var.bastions

  name                 = "AzureBastionSubnet"
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = [each.value.subnet_prefix]
}

resource "azurerm_public_ip" "bastion" {
  for_each = var.bastions

  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = each.value.tags
}

resource "azurerm_bastion_host" "bastion" {
  for_each = var.bastions

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku = each.value.sku

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion[each.key].id
    public_ip_address_id = azurerm_public_ip.bastion[each.key].id
  }

  tags = each.value.tags
}