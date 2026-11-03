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