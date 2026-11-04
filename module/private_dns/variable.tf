variable "private_dns_zones" {
  description = "Map of Azure Private DNS Zones"
  type = map(object({
    name                = string
    resource_group_name = string
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "vnet_links" {
  description = "Map of Private DNS Zone Virtual Network Links"
  type = map(object({
    name                  = string
    private_dns_zone_key  = string
    virtual_network_name  = string
    vnet_resource_group   = string
    registration_enabled  = optional(bool, false)
    tags                  = optional(map(string), {})
  }))
  default = {}
}
