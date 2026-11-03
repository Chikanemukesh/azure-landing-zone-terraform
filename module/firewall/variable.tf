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