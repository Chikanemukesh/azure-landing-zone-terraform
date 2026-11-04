variable "virtual_machines" {
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    subnet_name              = string
    virtual_network_name     = string
    vnet_resource_group_name = string

    nic_name                 = string
    os_disk_name             = string

    size                     = optional(string, "Standard_B1s")
    admin_username           = optional(string, "azureadmin")
    admin_password           = string

    os_disk_type             = optional(string, "Standard_LRS")
    os_disk_size_gb          = optional(number, 30)

    image_publisher          = optional(string, "Canonical")
    image_offer              = optional(string, "0001-com-ubuntu-server-jammy")
    image_sku                = optional(string, "22_04-lts")
    image_version            = optional(string, "latest")

    tags                     = optional(map(string), {})
  }))
}