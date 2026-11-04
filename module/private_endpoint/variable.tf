variable "private_endpoints" {
  description = "Map of Azure Private Endpoints"
  type = map(object({
    name                           = string
    location                       = string
    resource_group_name            = string
    subnet_name                    = string
    virtual_network_name           = string
    vnet_resource_group_name       = string
    subresource_names              = list(string)
    private_connection_resource_id = string
    is_manual_connection          = optional(bool, false)
    private_dns_zone_ids           = optional(list(string), [])
    tags                           = optional(map(string), {})
  }))
}
