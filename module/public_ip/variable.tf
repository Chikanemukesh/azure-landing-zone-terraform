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