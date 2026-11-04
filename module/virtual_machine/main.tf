# Azure Linux Virtual Machine & NIC
# Purpose: Landing Zone workloads ke liye secure, budget-friendly Linux VM create karna.

# SUBNET DATA SOURCE

data "azurerm_subnet" "vm_subnet" {
  for_each = var.virtual_machines

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.vnet_resource_group_name
}

# NETWORK INTERFACE

resource "azurerm_network_interface" "vm_nic" {
  for_each = var.virtual_machines

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.vm_subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }

  tags = each.value.tags
}

# LINUX VIRTUAL MACHINE

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.virtual_machines

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  size           = each.value.size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.vm_nic[each.key].id
  ]

  os_disk {
    name                 = each.value.os_disk_name
    caching              = "ReadWrite"
    storage_account_type = each.value.os_disk_type
    disk_size_gb         = each.value.os_disk_size_gb
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }

  tags = each.value.tags
}