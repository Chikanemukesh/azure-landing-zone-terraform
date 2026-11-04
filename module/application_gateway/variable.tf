variable "application_gateways" {
  description = "Map of Application Gateways"

  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string

    sku_name                 = optional(string, "Standard_v2")
    sku_tier                 = optional(string, "Standard_v2")
    capacity                 = optional(number, 1)

    subnet_name              = string
    virtual_network_name     = string
    vnet_resource_group_name = string

    public_ip_name           = string
    pip_resource_group_name  = optional(string)

    frontend_port            = optional(number, 80)

    frontend_port_name         = optional(string, "frontend-port")
    frontend_ip_name           = optional(string, "frontend-ip")
    backend_pool_name          = optional(string, "backend-pool")
    backend_http_settings_name = optional(string, "backend-settings")
    http_listener_name         = optional(string, "http-listener")
    routing_rule_name          = optional(string, "routing-rule")
    priority                   = optional(number, 100)

    tags = optional(map(string), {})
  }))
}