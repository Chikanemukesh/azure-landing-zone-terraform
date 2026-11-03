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