
variable "load_balancers" {
  description = "Map of Azure Internal Load Balancers"

  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    sku                      = optional(string, "Standard")

    subnet_name              = string
    virtual_network_name     = string
    vnet_resource_group_name = string

    frontend_ip_name         = optional(string, "FrontendIP")
    private_ip_allocation    = optional(string, "Dynamic")

    backend_pool_name        = optional(string, "backend-pool")

    probe_name               = optional(string, "health-probe")
    probe_protocol           = optional(string, "Tcp")
    probe_port               = optional(number, 80)

    rule_name                = optional(string, "lb-rule")
    protocol                 = optional(string, "Tcp")
    frontend_port            = optional(number, 80)
    backend_port             = optional(number, 80)

    tags                     = optional(map(string), {})
  }))
}
