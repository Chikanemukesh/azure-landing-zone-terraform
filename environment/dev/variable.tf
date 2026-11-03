variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "virtual_networks" {
  description = "Map of Azure Virtual Networks"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "subnets" {
  description = "Map of Azure Subnets"
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}
variable "network_security_groups" {
  description = "Map of Azure Network Security Groups"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = map(string)
  }))
}
variable "nsg_subnet_associations" {
  type = map(object({
    nsg_name                = string
    nsg_resource_group_name = string
    subnet_name             = string
    resource_group_name     = string
    virtual_network_name    = string
  }))
}

variable "route_tables" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    route_name          = string
    address_prefix      = string
    next_hop_type       = string
    tags                = map(string)
  }))
}
variable "vnet_peerings" {
  type = map(object({
    name                          = string
    resource_group_name           = string
    virtual_network_name          = string
    remote_virtual_network_name   = string
    remote_resource_group_name    = string

    allow_virtual_network_access = bool
    allow_forwarded_traffic      = bool
    allow_gateway_transit        = bool
    use_remote_gateways          = bool
  }))
}

variable "firewalls" {
  description = "Map of Azure Firewalls"

  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    sku_tier             = string
    subnet_id            = string
    public_ip_address_id = string
    tags                 = map(string)
  }))
}