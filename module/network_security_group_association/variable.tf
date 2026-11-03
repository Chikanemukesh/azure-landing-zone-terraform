variable "nsg_subnet_associations" {
  type = map(object({
    nsg_name                = string
    nsg_resource_group_name = string
    subnet_name             = string
    resource_group_name     = string
    virtual_network_name    = string
  }))
}