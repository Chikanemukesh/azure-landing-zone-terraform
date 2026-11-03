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
    name                        = string
    resource_group_name         = string
    virtual_network_name        = string
    remote_virtual_network_name = string
    remote_resource_group_name  = string

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
    subnet_name          = string
    virtual_network_name = string
    public_ip_name       = string
    tags                 = map(string)
  }))
}

variable "bastions" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_prefix        = string
    public_ip_name       = string
    sku                  = string
    tags                 = map(string)
  }))
}

variable "public_ips" {
  description = "Map of Azure Public IP configurations"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    allocation_method = optional(string, "Static")
    sku               = optional(string, "Standard")
    sku_tier          = optional(string, "Regional")
    ip_version        = optional(string, "IPv4")

    tags = optional(map(string), {})
  }))
}

variable "storage_accounts" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
  }))
}