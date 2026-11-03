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